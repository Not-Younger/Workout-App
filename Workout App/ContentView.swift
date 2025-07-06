//
//  ContentView.swift
//  Workout App
//
//  Created by Jonathan Young on 6/26/25.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var exercises: [Exercise]
    
    @AppStorage("selectedTab") private var selectedTab: Int = 3
    @State private var navigationPaths = NavigationPaths()
    @State private var currentWorkout: Workout?
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Tab("Profile", systemImage: "person.fill", value: 1) {
                NavigationStack {
                    ProfileTabView()
                }
            }
            Tab("History", systemImage: "clock.fill", value: 2) {
                NavigationStack {
                    HistoryTabView()
                }
            }
            Tab("Workout", systemImage: "plus", value: 3) {
                NavigationStack(path: $navigationPaths.workoutPath) {
                    WorkoutTabView()
                        .navigationDestination(for: Workout.self) { workout in
                            WorkoutView(workout: workout)
                        }
                }
                .environment(currentWorkout)
                .environment(navigationPaths)
            }
            Tab("Exercises", systemImage: "dumbbell", value: 4) {
                NavigationStack(path: $navigationPaths.exercisePath) {
                    ExerciseTabView()
                        .navigationDestination(for: Exercise.self) { exercise in
                            ExerciseDetailView(exercise: exercise)
                        }
                }
                .environment(navigationPaths)
            }
            Tab("Settings", systemImage: "gear", value: 5) {
                NavigationStack {
                    
                }
            }
        }
        .onAppear {
            seedDefaultExercisesIfNeeded()
        }
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
