//
//  WorkoutExerciseRowSetsView.swift
//  Workout App
//
//  Created by Jonathan Young on 6/28/25.
//

import SwiftUI

struct WorkoutExerciseRowSetsView: View {
    @Bindable var workoutExercise: WorkoutExercise
    
    var body: some View {
        ForEach(workoutExercise.sets) { set in
            WorkoutExerciseSetRow(exerciseSet: set)
        }
        Button {
            let index = workoutExercise.sets.count
            let newSet = ExerciseSet(type: .normal, order: index, workoutExercise: workoutExercise)
            workoutExercise.sets.append(newSet)
        } label: {
            Text("Add Set")
                
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    let workout = Workout(name: "Test Workout")
    let exercise = DEFAULT_EXERCISES[0]
    exercise.exerciseType = .weightedReps
    let workoutExercise = WorkoutExercise(supersetNumber: nil, sets: [], order: 0, workout: workout, exercise: exercise)
    return WorkoutExerciseRowSetsView(workoutExercise: workoutExercise)
}
