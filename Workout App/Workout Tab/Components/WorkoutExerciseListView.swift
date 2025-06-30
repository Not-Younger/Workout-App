//
//  WorkoutExerciseListView.swift
//  Workout App
//
//  Created by Jonathan Young on 6/28/25.
//

import SwiftUI

struct WorkoutExerciseListView: View {
    @Environment(\.editMode) private var editMode
    @Bindable var workout: Workout
    
    @State var hasPressed = false
    
    var body: some View {
        ForEach(workout.exercises) { workoutExercise in
            WorkoutExerciseRowView(workoutExercise: workoutExercise)
                .moveDisabled(editMode?.wrappedValue == .inactive)
        }
        .onMove(perform: move)
        .animation(nil, value: editMode?.wrappedValue)
    }
    
    func move(from source: IndexSet, to destination: Int) {
        workout.exercises.move(fromOffsets: source, toOffset: destination)
    }
}

#Preview {
    WorkoutExerciseListView(workout: Workout())
}
