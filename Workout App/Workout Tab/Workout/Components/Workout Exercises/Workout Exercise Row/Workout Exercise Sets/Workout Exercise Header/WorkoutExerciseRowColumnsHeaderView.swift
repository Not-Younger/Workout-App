//
//  WeightedRepsHeaderView.swift
//  Workout App
//
//  Created by Jonathan Young on 6/28/25.
//

import SwiftUI

struct WorkoutExerciseRowColumnsHeaderView: View {
    let workoutExercise: WorkoutExercise
    
    let rowHeight: CGFloat
    let fontSize: CGFloat
    
    var body: some View {
        HStack {
            Rectangle()
                .frame(width: 3)
                .foregroundStyle(workoutExercise.supersetColor)
            HStack {
                Group {
                    Text("Set")
                        .frame(width: rowHeight)
                    Text("Previous")
                        .frame(maxWidth: .infinity)
                }
                .frame(height: rowHeight)
                .multilineTextAlignment(.center)
            }
            .frame(maxWidth: .infinity)
            HStack {
                Group {
                    Text(workoutExercise.firstHeader)
                    if let secondHeader = workoutExercise.secondHeader {
                        Text(secondHeader)
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: rowHeight)
                .multilineTextAlignment(.center)
            }
            .frame(maxWidth: .infinity)
            Image(systemName: "checkmark")
                .frame(width: rowHeight, height: rowHeight)
            Rectangle()
                .frame(width: 3)
                .foregroundStyle(Color.clear)
        }
        .font(.system(size: fontSize))
        .fontWeight(.medium)
    }
}

#Preview {
    let workout = Workout(name: "Test Workout")
    let exercise = DEFAULT_EXERCISES[0]
    let workoutExercise = WorkoutExercise(supersetNumber: nil, order: 0, sets: [], workout: workout, exercise: exercise)
    WorkoutExerciseRowColumnsHeaderView(workoutExercise: workoutExercise, rowHeight: 25, fontSize: 12)
}
