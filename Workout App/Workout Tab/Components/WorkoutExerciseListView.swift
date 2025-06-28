//
//  WorkoutExerciseListView.swift
//  Workout App
//
//  Created by Jonathan Young on 6/28/25.
//

import SwiftUI

struct WorkoutExerciseListView: View {
    @Bindable var workout: Workout
    @State private var isEditing = false
    
    var body: some View {
        ForEach(workout.exercises) { workoutExercise in
            HStack {
                Image(systemName: "circle.fill")
                    .foregroundStyle(workoutExercise.superSetColor)
                Text(workoutExercise.exercise.name)
            }
            .onLongPressGesture {
                withAnimation {
                    isEditing = true
                }
            }
        }
        .onMove { indices, newOffset in
            workout.exercises.move(fromOffsets: indices, toOffset: newOffset)
        }
        .environment(\.editMode, .constant(isEditing ? .active : .inactive))
    }
}

#Preview {
    WorkoutExerciseListView(workout: Workout())
}
