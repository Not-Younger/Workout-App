//
//  AddExerciseView.swift
//  Workout App
//
//  Created by Jonathan Young on 6/28/25.
//

import SwiftUI

struct AddWorkoutExerciseView: View {
    @Environment(\.dismiss) private var dismiss
    @Bindable var workout: Workout
    @Binding var workoutExercises: [WorkoutExercise]
    
    @State private var searchString: String = ""
    @State private var isSearchFocused: Bool = false
    @State private var equipmentType: EquipmentType?
    @State private var muscleType: MuscleType?
    @State private var sortType: ExerciseSortType = .nameAscending
    
    @State private var selectedExercises: [Exercise] = []
    
    var body: some View {
        VStack(spacing: 0) {
            ExerciseFilterView(searchString: $searchString, equipmentType: $equipmentType, muscleType: $muscleType, sortType: $sortType)
            ExerciseListView(selectedExercises: $selectedExercises, searchString: searchString, equipmentType: equipmentType, muscleType: muscleType, sortType: sortType, selectable: true)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.secondarySystemBackground))
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Close") {
                    dismiss()
                }
                .tint(.primary)
            }
            ToolbarItemGroup(placement: .topBarTrailing) {
                HStack(spacing: 5) {
                    Button("Superset") {
                        var currentExerciseIndex = workoutExercises.count
                        let currentSupersetIndex = getMaxSuperSetNumber()
                        for exercise in selectedExercises {
                            // Create workout exerise
                            let workoutExercise = WorkoutExercise(
                                supersetNumber: currentSupersetIndex,
                                order: currentExerciseIndex,
                                workout: workout,
                                exercise: exercise
                            )
                            // Add any preivous set data to sets
                            let previousSets = exercise.previousSets.sorted { $0.order < $1.order }
                            for previousSet in previousSets {
                                let newPreviousSet = ExerciseSet(
                                    type: previousSet.type,
                                    order: previousSet.order,
                                    previousWeight: previousSet.weight,
                                    previousDuration: previousSet.duration,
                                    previousDistance: previousSet.distance,
                                    previousHeight: previousSet.height,
                                    previousReps: previousSet.reps,
                                    exercise: workoutExercise.exercise,
                                    workoutExercise: workoutExercise
                                )
                                workoutExercise.sets.append(newPreviousSet)
                            }
                            
                            if workoutExercise.sets.isEmpty {
                                let emptySet = ExerciseSet(
                                    type: .normal,
                                    order: 0,
                                    exercise: workoutExercise.exercise,
                                    workoutExercise: workoutExercise
                                )
                                workoutExercise.sets.append(emptySet)
                            }
                            
                            // Add to workout
                            workoutExercises.append(workoutExercise)
                            workout.workoutExercises.append(workoutExercise)
                            print("Superset number: \(workoutExercise.supersetNumber ?? -1)")
                            print("Order: \(workoutExercise.order)")
                            currentExerciseIndex += 1
                        }
                        dismiss()
                    }
                    .disabled(selectedExercises.count < 2)
                    Button("Add") {
                        var currentExerciseIndex = workoutExercises.count
                        for exercise in selectedExercises {
                            // Create workout exercise
                            let workoutExercise = WorkoutExercise(
                                order: currentExerciseIndex,
                                workout: workout,
                                exercise: exercise
                            )
                            // Add any preivous set data to sets
                            let previousSets = exercise.previousSets.sorted { $0.order < $1.order }
                            for previousSet in previousSets {
                                let newPreviousSet = ExerciseSet(
                                    type: previousSet.type,
                                    order: previousSet.order,
                                    previousWeight: previousSet.weight,
                                    previousDuration: previousSet.duration,
                                    previousDistance: previousSet.distance,
                                    previousHeight: previousSet.height,
                                    previousReps: previousSet.reps,
                                    exercise: workoutExercise.exercise,
                                    workoutExercise: workoutExercise
                                )
                                workoutExercise.sets.append(newPreviousSet)
                            }
                            
                            if workoutExercise.sets.isEmpty {
                                let emptySet = ExerciseSet(
                                    type: .normal,
                                    order: 0,
                                    exercise: workoutExercise.exercise,
                                    workoutExercise: workoutExercise
                                )
                                workoutExercise.sets.append(emptySet)
                            }
                            
                            // Add to workout
                            workoutExercises.append(workoutExercise)
                            workout.workoutExercises.append(workoutExercise)
                            print(workoutExercise.order)
                            currentExerciseIndex += 1
                        }
                        dismiss()
                    }
                    .bold()
                    .disabled(selectedExercises.isEmpty)
                }
                .tint(.primary)
            }
        }
    }
    
    func getMaxSuperSetNumber() -> Int {
        var maxSupersetNumber = 0
        for exercise in workoutExercises {
            if let supersetNumber = exercise.supersetNumber {
                maxSupersetNumber = max(supersetNumber, maxSupersetNumber)
            }
        }
        return maxSupersetNumber + 1
    }
}

