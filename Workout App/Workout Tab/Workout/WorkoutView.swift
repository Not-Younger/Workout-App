//
//  WorkoutView.swift
//  Workout App
//
//  Created by Jonathan Young on 6/28/25.
//

import SwiftData
import SwiftUI

struct WorkoutView: View {
    @Environment(\.editMode) private var editMode
    @Environment(\.dismiss) private var dismiss
    
    @Bindable var workout: Workout
    
    var body: some View {
        GeometryReader { geometry in
            List {
                WorkoutHeaderView(workout: workout)
                    .listRowInsets(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
                
                WorkoutExerciseListView(workout: workout)
                
                WorkoutAddCancelButtonsView(workout: workout)
                    .listRowInsets(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
            }
            .listStyle(.inset)
            .scrollIndicators(.hidden)
        }
        .fontDesign(.rounded)
        .toolbar {
            ToolbarItemGroup(placement: .topBarTrailing) {
                Button {
                    
                } label: {
                    Image(systemName: "timer")
                }
                .buttonStyle(BorderedProminentButtonStyle())
                .tint(.secondary)
                Button("Finish") {
                    workout.finishDate = Date()
                    print("Finished workout: \(workout.name) at \(workout.finishDate!)")
                    
                    // Update exercise previous sets
                    for workoutExercise in workout.exercises {
                        var previousSets: [ExerciseSet] = []
                        for set in workoutExercise.sets.sorted(by: { $0.order < $1.order }) {
                            let previousSet = ExerciseSet(
                                weight: set.weight,
                                duration: set.distance,
                                distance: set.duration,
                                height: set.height,
                                reps: set.reps,
                                type: set.type,
                                order: set.order,
                                previousWeight: set.previousWeight,
                                previousDuration: set.previousDuration,
                                previousDistance: set.previousDistance,
                                previousHeight: set.previousHeight,
                                previousReps: set.previousReps,
                                exercise: workoutExercise.exercise
                            )
                            previousSets.append(previousSet)
                        }
                        workoutExercise.exercise.previousSets = previousSets
                    }
                    dismiss()
                }
                .buttonStyle(BorderedProminentButtonStyle())
                .tint(.primary)
            }
        }
    }
}
