//
//  WorkoutExerciseRowView.swift
//  Workout App
//
//  Created by Jonathan Young on 6/28/25.
//

import SwiftUI

struct WorkoutExerciseRowView: View {
    @Environment(\.editMode) private var editMode
    @Bindable var workoutExercise: WorkoutExercise
    
    var body: some View {
        HStack(spacing: 5) {
            RoundedRectangle(cornerRadius: 8)
                .frame(width: 5)
                .foregroundStyle(workoutExercise.superSetColor)
            
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text(workoutExercise.exercise.name)
                        .fontWeight(.bold)
                    Spacer()
                }
                
                if editMode?.wrappedValue == .inactive {
                    WorkoutExerciseRowColumnsHeaderView(workoutExercise: workoutExercise)
                    
                    WorkoutExerciseRowSetsView(workoutExercise: workoutExercise)
                }
            }
            RoundedRectangle(cornerRadius: 8)
                .frame(width: 5)
                .foregroundStyle(.clear)
        }
        .fontDesign(.rounded)
        .listRowInsets(EdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 5))
    }
}

#Preview {
    let workout = Workout(name: "Test Workout")
    let exercise = DEFAULT_EXERCISES[0]
    let workoutExercise = WorkoutExercise(order: 0, supersetNumber: nil, sets: [], workout: workout, exercise: exercise)
    
    WorkoutExerciseRowView(workoutExercise: workoutExercise)
}
