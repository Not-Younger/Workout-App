//
//  WorkoutExerciseListView.swift
//  Workout App
//
//  Created by Jonathan Young on 6/28/25.
//

import SwiftUI

struct WorkoutExerciseListView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.editMode) private var editMode
    @Bindable var workout: Workout
    
    @State var hasPressed = false
    
    var body: some View {
        ForEach(workout.exercises) { workoutExercise in
            WorkoutExerciseRowView(workoutExercise: workoutExercise)
                .moveDisabled(editMode?.wrappedValue == .inactive)
                .deleteDisabled(editMode?.wrappedValue == .inactive)
        }
        .onMove(perform: move)
        .onDelete(perform: deleteWorkoutExercise)
        .animation(nil, value: editMode?.wrappedValue)
        .onAppear() {
            workout.exercises.sort { $0.order < $1.order }
        }
    }
    
    func move(from source: IndexSet, to destination: Int) {
        workout.exercises.move(fromOffsets: source, toOffset: destination)
        resetIndices()
    }
    
    func deleteWorkoutExercise(at offsets: IndexSet) {
        for offset in offsets {
            // find this book in our query
            let workoutExercise = workout.exercises[offset]

            // delete it from the context
            workout.exercises.remove(at: offset)
            modelContext.delete(workoutExercise)
            
            resetIndices()
        }
    }
    
    func resetIndices() {
        for i in workout.exercises.indices {
            let workoutExercise = workout.exercises[i]
            workoutExercise.order = i
        }
    }
}
