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
                    .frame(width: 25)
                    .multilineTextAlignment(.center)
                    .background(Color.gray.opacity(0.3))
                Text("Previous")
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .background(Color.gray.opacity(0.3))
            }
            .frame(maxWidth: .infinity)
            HStack {
                Text(workoutExercise.firstHeader)
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .background(Color.gray.opacity(0.3))
                if let secondHeader = workoutExercise.secondHeader {
                    Text(secondHeader)
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                        .background(Color.gray.opacity(0.3))
                }
            }
            .frame(maxWidth: .infinity)
            Image(systemName: "checkmark")
                .font(.subheadline)
                .frame(width: 25, height: 25)
                .background(Color.gray.opacity(0.3))
        }
        .font(.subheadline)
        .fontWeight(.medium)
    }
}

#Preview {
    let workout = Workout(name: "Test Workout")
    let exercise = DEFAULT_EXERCISES[0]
    let workoutExercise = WorkoutExercise(supersetNumber: nil, order: 0, sets: [], workout: workout, exercise: exercise)
    WorkoutExerciseRowColumnsHeaderView(workoutExercise: workoutExercise)
}
