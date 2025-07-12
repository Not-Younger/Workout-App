//
//  WorkoutView.swift
//  Workout App
//
//  Created by Jonathan Young on 6/28/25.
//

import SwiftData
import SwiftUI

struct WorkoutView: View {
    @Environment(\.dismiss) private var dismiss
    
    @Bindable var workout: Workout
    @State private var workoutExercises: [WorkoutExercise]
    
    @State private var editMode: Bool = false
    @State private var isTextFocused: Bool = false
    
    init(workout: Workout) {
        self.workout = workout
        self.workoutExercises = workout.workoutExercises.sorted { $0.order < $1.order }
    }
    
    var body: some View {
        List {
            WorkoutHeaderView(workout: workout, workoutExercises: $workoutExercises, editMode: $editMode, isTextFocused: $isTextFocused)
                .listRowInsets(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
                .deleteDisabled(true)
                .moveDisabled(true)
            
            WorkoutExerciseListView(workout: workout, workoutExercises: $workoutExercises, editMode: $editMode, isTextFocused: $isTextFocused)
            
            WorkoutAddCancelButtonsView(workout: workout, workoutExercises: $workoutExercises)
                .listRowInsets(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
                .deleteDisabled(true)
                .moveDisabled(true)
        }
        .listStyle(.inset)
        .scrollIndicators(.hidden)
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
                    for workoutExercise in workout.workoutExercises {
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
        .safeAreaInset(edge: .bottom) {
            if isTextFocused {
                HStack {
                    Spacer()
                    HideKeyboardButtonView(isTextFocused: $isTextFocused)
                }
                .padding(.trailing)
                .padding(.bottom, 10)
            }
        }
    }
}
