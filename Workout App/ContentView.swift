//
//  ContentView.swift
//  Workout App
//
//  Created by Jonathan Young on 6/26/25.
//

import SwiftData
import SwiftUI

enum TabType: Int, CaseIterable, Comparable {
    case profile = 0
    case history = 1
    case exercise = 2
    case workout = 3
    
    static func < (lhs: TabType, rhs: TabType) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.colorScheme) private var colorScheme
    
    @Query private var exercises: [Exercise]
    
    @State private var selectedTab: TabType = .exercise
    @State private var previousTab: TabType = .exercise
    @State private var currentTransition: AnyTransition = .identity
    
    @State private var navigationPaths = NavigationPaths()
    @State private var currentWorkout: Workout?
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                tabView(for: selectedTab)
                    .id(selectedTab)
                    .transition(currentTransition)
            }
            .animation(.interactiveSpring(response: 0.2, dampingFraction: 0.7, blendDuration: 0.2), value: selectedTab)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.systemBackground))
            
            ZStack {
                Color(.systemBackground)
                    .ignoresSafeArea(edges: .bottom)
                    .frame(height: 70)
                    .shadow(color: colorScheme == .dark ? .clear : Color.black.opacity(0.05), radius: 4, y: -2)
                
                HStack(alignment: .bottom) {
                    Group {
                        tabButton(icon: "person.fill", name: "Profile", tab: .profile)
                        tabButton(icon: "clock.fill", name: "History", tab: .history)
                        tabButton(icon: "dumbbell", name: "Exercises", tab: .exercise)
                        VStack {} // Center spacer
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding(.horizontal)
                
                HStack {
                    Group {
                        VStack {}
                        VStack {}
                        VStack {}
                        tabButton(icon: "plus", name: "Workout", tab: .workout)
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding(.horizontal)
            }
        }
        .ignoresSafeArea(.keyboard)
        .fontDesign(.rounded)
        .onAppear {
            seedDefaultExercisesIfNeeded()
        }
    }
    
    @ViewBuilder
    private func tabView(for tab: TabType) -> some View {
        Group {
            switch tab {
            case .profile:
                NavigationStack {
                    ProfileTabView()
                }
            case .history:
                NavigationStack {
                    HistoryTabView()
                }
            case .exercise:
                NavigationStack(path: $navigationPaths.exercisePath) {
                    ExerciseTabView()
                        .navigationDestination(for: Exercise.self) { ExerciseDetailView(exercise: $0) }
                        .navigationDestination(for: Workout.self) { WorkoutDetailView(workout: $0) }
                }
                .environment(navigationPaths)
            case .workout:
                NavigationStack(path: $navigationPaths.workoutPath) {
                    WorkoutTabView()
                        .navigationDestination(for: Workout.self) { WorkoutView(workout: $0) }
                }
                .environment(currentWorkout)
                .environment(navigationPaths)
            }
        }
    }
    
    private func tabButton(icon: String, name: String, tab: TabType) -> some View {
        let baseIcon = icon.replacingOccurrences(of: ".fill", with: "")
        let isSelected = selectedTab == tab
        let iconName = isSelected ? "\(baseIcon).fill" : baseIcon
        let isFloating = tab == .workout
        
        return Button {
            GlobalHelpers.performHaptic()
            guard tab != selectedTab else { return }
            
            // Set transition direction before switching tabs
            currentTransition = tab > selectedTab
                ? .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))
                : .asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing))
            
            withAnimation(.easeInOut) {
                previousTab = selectedTab
                selectedTab = tab
            }
        } label: {
            if isFloating {
                VStack(spacing: 4) {
                    Image(systemName: icon)
                        .font(.system(size: 25))
                        .frame(width: 60, height: 60)
                        .background(colorScheme == .dark ? .white : .black)
                        .foregroundColor(colorScheme == .dark ? .black : .white)
                        .clipShape(Circle())
                        .shadow(color: colorScheme == .dark ? .clear : Color.black.opacity(0.2), radius: 6, x: 0, y: 4)
                }
                .offset(y: -20)
            } else {
                ZStack {
                    VStack {
                        Image(systemName: iconName)
                            .font(.system(size: 25, weight: .light))
                        Spacer()
                    }
                    VStack {
                        Spacer()
                        Text(name)
                            .font(.system(size: 12, weight: .semibold))
                    }
                }
                .frame(height: 50)
                .foregroundColor(isSelected ? .primary : .secondary)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    private func seedDefaultExercisesIfNeeded() {
        guard exercises.isEmpty else { return }
        for exercise in DEFAULT_EXERCISES {
            modelContext.insert(exercise)
        }
    }
}

#Preview {
    let workoutConfig = ModelConfiguration(for: Workout.self, isStoredInMemoryOnly: true)
    let exerciseConfig = ModelConfiguration(for: Exercise.self, isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Workout.self, Exercise.self, configurations: workoutConfig, exerciseConfig)
    
    for exercise in DEFAULT_EXERCISES {
        container.mainContext.insert(exercise)
    }
    
    return ContentView()
        .modelContainer(container)
}
