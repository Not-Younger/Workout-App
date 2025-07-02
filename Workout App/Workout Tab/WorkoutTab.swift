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
    @Environment(NavigationPaths.self) private var navigationPaths: NavigationPaths
    
    @Query(filter: #Predicate<Workout> {
        $0.finishDate == nil
    }, sort: \.date, order: .reverse) private var currentWorkouts: [Workout]
    
    @State private var isShowingWorkoutView: Bool = false
    @State private var isShowingExistingWorkoutAlert: Bool = false
    
    var body: some View {
        ScrollView {
            let currentWorkout = currentWorkouts.first
            Button {
                if currentWorkout != nil {
                    isShowingExistingWorkoutAlert = true
                } else {
                    let newWorkout = Workout()
                    modelContext.insert(newWorkout)
                    navigationPaths.workoutPath.append(newWorkout)
                }
            } label: {
                Text("+ Start New Workout")
            }
            .alert("Workout in Progress", isPresented: $isShowingExistingWorkoutAlert) {
                if let currentWorkout {
                    Button("Start New Workout", role: .destructive) {
                        let newWorkout = Workout()
                        modelContext.insert(newWorkout)
                        navigationPaths.workoutPath.append(newWorkout)
                        modelContext.delete(currentWorkout)
                        do {
                            try modelContext.save()
                        } catch {
                            print("Error saving after deleting existing workout: \(error)")
                        }
                        print("Deleting existing workout and starting new workout.")
                    }
                    Button("Resume Current Workout") {
                        navigationPaths.workoutPath.append(currentWorkout)
                        print("Resuming existing workout.")
                    }
                    Button("Do Nothing", role: .cancel) {}
                }
            } message: {
                Text("You already have a workout in progress. If you start a new one, this will discard your current workout.")
            }
        }
    }
}

#Preview {
    ContentView()
}
