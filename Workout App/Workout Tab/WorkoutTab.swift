//
//  WorkoutTab.swift
//  Workout App
//
//  Created by Jonathan Young on 6/28/25.
//

import SwiftData
import SwiftUI

struct WorkoutTab: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(ContentView.ViewModel.self) private var VM: ContentView.ViewModel
    @State private var isExistingWorkout: Bool
    
    init(modelContext: ModelContext, VM: ContentView.ViewModel) {
        let descriptor = FetchDescriptor<Workout>(
            predicate: #Predicate { $0.finishDate == nil }
        )
        if let currentWorkout = VM.currentWorkout {
            VM.currentWorkout = currentWorkout
            self.isExistingWorkout = true
            print("Found existing unsaved VM workout: \(currentWorkout.name) from \(currentWorkout.date)")
        } else if !VM.skipSwiftDataCurrentWorkout, let finishedWorkouts = try? modelContext.fetch(descriptor), let currentWorkout = finishedWorkouts.first {
            VM.currentWorkout = currentWorkout
            self.isExistingWorkout = true
            print("Found existing SwiftData workout: \(currentWorkout.name) from \(currentWorkout.date)")
        } else {
            self.isExistingWorkout = false
            print("No existing workout.")
        }
    }
    
    @State private var isShowingWorkoutView: Bool = false
    @State private var isShowingExistingWorkoutAlert: Bool = false
    
    var body: some View {
        ScrollView {
            if let currentWorkout = VM.currentWorkout {
                // Continue existing workout
                Button("Start New Workout") {
                    isShowingExistingWorkoutAlert = true
                    print("Can't start workout, existing one in progress.")
                }
                .alert("Workout in Progress", isPresented: $isShowingExistingWorkoutAlert) {
                    Button("Start New Workout", role: .destructive) {
                        modelContext.delete(currentWorkout) // Delete current
                        VM.skipSwiftDataCurrentWorkout = true
                        VM.currentWorkout = Workout() // Create new workout
                        VM.workoutPath.append(currentWorkout)
                        print("Deleting existing workout, setting skip Swift Data tag to true, and starting new workout.")
                    }
                    Button("Resume Current Workout") {
                        VM.workoutPath.append(currentWorkout)
                        print("Resuming existing workout.")
                    }
                    Button("Do Nothing", role: .cancel) {}
                } message: {
                    Text("You already have a workout in progress. If you start a new one, this will discard your current workout.")
                }
            } else {
                // Start a new workout
                Button("Start New Workout") {
                    let newWorkout = Workout()
                    VM.currentWorkout = newWorkout
                    modelContext.insert(newWorkout)
                    try? modelContext.save()
                    VM.workoutPath.append(newWorkout)
                    print("No workout in progress, starting new one.")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
