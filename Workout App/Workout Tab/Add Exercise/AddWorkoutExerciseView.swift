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
    
    @State private var searchString: String = ""
    @State private var isSearchFocused: Bool = false
    @State private var equipmentType: EquipmentType?
    @State private var muscleType: MuscleType?
    @State private var sortType: ExerciseSortType = .nameAscending
    
    @State private var selectedExercises: [Exercise] = []
    
    var body: some View {
        NavigationStack {
            VStack {
                ExerciseFilterView(equipmentType: $equipmentType, muscleType: $muscleType, sortType: $sortType)
                    .padding(.horizontal)
                ExerciseListView(selectedExercises: $selectedExercises, searchString: searchString, equipmentType: equipmentType, muscleType: muscleType, sortType: sortType, selectable: true)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.secondarySystemBackground))
            .searchable(text: $searchString, isPresented: $isSearchFocused, prompt: "Find an exercise...")
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
                            var currentExerciseIndex = workout.exercises.count
                            var currentSupersetIndex = getMaxSuperSetNumber()
                            for exercise in selectedExercises {
                                let workoutExercise = WorkoutExercise(
                                    order: currentExerciseIndex,
                                    supersetNumber: currentSupersetIndex,
                                    workout: workout,
                                    exercise: exercise)
                                workout.exercises.append(workoutExercise)
                                print("Superset number: \(workoutExercise.supersetNumber ?? -1)")
                                print("Order: \(workoutExercise.order)")
                                currentExerciseIndex += 1
                            }
                            dismiss()
                        }
                        .disabled(selectedExercises.count < 2)
                        Button("Add") {
                            var currentExerciseIndex = workout.exercises.count
                            for exercise in selectedExercises {
                                let workoutExercise = WorkoutExercise(
                                    order: currentExerciseIndex,
                                    workout: workout,
                                    exercise: exercise)
                                workout.exercises.append(workoutExercise)
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
    }
    
    func getMaxSuperSetNumber() -> Int {
        var maxSupersetNumber = 0
        for exercise in workout.exercises {
            if let supersetNumber = exercise.supersetNumber {
                maxSupersetNumber = max(supersetNumber, maxSupersetNumber)
            }
        }
        return maxSupersetNumber + 1
    }
}

#Preview {
    AddWorkoutExerciseView(workout: Workout())
}
