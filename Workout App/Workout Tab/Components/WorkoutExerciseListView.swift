//
//  WorkoutExerciseListView.swift
//  Workout App
//
//  Created by Jonathan Young on 6/28/25.
//

import SwiftUI

struct WorkoutExerciseListView: View {
    @Bindable var workout: Workout
    
    var body: some View {
        ForEach(workout.exercises) { workoutExercise in
            WorkoutExerciseRowView(workoutExercise: workoutExercise)
        }
        .onMove { indices, newOffset in
            workout.exercises.move(fromOffsets: indices, toOffset: newOffset)
        }
    }
}

#Preview {
    WorkoutExerciseListView(workout: Workout())
}
