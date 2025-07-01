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
    @State private var VM = ContentView.ViewModel()
    
    var body: some View {
        @Bindable var VM = VM
        TabView(selection: $VM.selectedTab) {
            Tab("Profile", systemImage: "person.fill", value: 1) {
                NavigationStack {
                    
                }
                .environment(VM)
            }
            Tab("History", systemImage: "clock.fill", value: 2) {
                NavigationStack {
                    HistoryTab()
                }
                .environment(VM)
            }
            Tab("Workout", systemImage: "plus", value: 3) {
                NavigationStack(path: $VM.workoutPath) {
                    WorkoutTab(modelContext: modelContext, VM: VM)
                        .navigationDestination(for: Workout.self) { workout in
                            WorkoutView(workout: workout)
                        }
                }
                .environment(VM)
            }
            Tab("Exercises", systemImage: "dumbbell", value: 4) {
                NavigationStack(path: $VM.exercisePath) {
                    ExerciseTab()
                        .navigationDestination(for: Exercise.self) { exercise in
                            ExerciseDetailView(exercise: exercise)
                        }
                }
                .environment(VM)
            }
            Tab("Settings", systemImage: "gear", value: 5) {
                NavigationStack {
                    
                }
                .environment(VM)
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
