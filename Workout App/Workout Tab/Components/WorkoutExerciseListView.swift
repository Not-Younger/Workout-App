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
            Text(workoutExercise.exercise.name)
        }
    }
}

#Preview {
    WorkoutExerciseListView(workout: Workout())
}
