//
//  WeightedRepsHeaderView.swift
//  Workout App
//
//  Created by Jonathan Young on 6/28/25.
//

import SwiftUI

struct WorkoutExerciseRowColumnsHeaderView: View {
    let workoutExercise: WorkoutExercise
    
    var body: some View {
        HStack {
            HStack {
                Text("Set")
                Text("Previous")
                    .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity)
            HStack {
                Text(workoutExercise.firstHeader)
                    .frame(maxWidth: .infinity)
                if let secondHeader = workoutExercise.secondHeader {
                    Text(secondHeader)
                        .frame(maxWidth: .infinity)
                }
                Image(systemName: "checkmark")
            }
            .frame(maxWidth: .infinity)
        }
        .fontWeight(.medium)
    }
}

#Preview {
    let workout = Workout(name: "Test Workout")
    let exercise = DEFAULT_EXERCISES[0]
    let workoutExercise = WorkoutExercise(order: 0, supersetNumber: nil, sets: [], workout: workout, exercise: exercise)
    WorkoutExerciseRowColumnsHeaderView(workoutExercise: workoutExercise)
}
