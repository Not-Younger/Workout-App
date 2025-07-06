//
//  WorkoutExerciseListView.swift
//  Workout App
//
//  Created by Jonathan Young on 6/28/25.
//

import SwiftUI

struct WorkoutExerciseListView: View {
    @Environment(\.modelContext) private var modelContext
    
    @Bindable var workout: Workout
    @Binding var workoutExercises: [WorkoutExercise]
    @Binding var editMode: Bool
    
    @State var hasPressed = false
    
    var body: some View {
        ForEach(workoutExercises) { workoutExercise in
            WorkoutExerciseRowView(workoutExercise: workoutExercise, editMode: $editMode)
                .listRowInsets(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
        }
        .onMove(perform: moveWorkoutExercise)
        .onDelete(perform: deleteWorkoutExercise)
        .animation(nil, value: editMode)
    }
    
    func moveWorkoutExercise(from source: IndexSet, to destination: Int) {
        workoutExercises.move(fromOffsets: source, toOffset: destination)
        // Update order
        resetIndices()
    }
    
    func deleteWorkoutExercise(at offsets: IndexSet) {
        for offset in offsets {
            // find this book in our query
            let workoutExercise = workoutExercises[offset]
            // Delete it from local state, workout state, and the context
            workoutExercises.remove(at: offset)
            workout.workoutExercises.removeAll(where: { $0.id == workoutExercise.id })
            modelContext.delete(workoutExercise)
            // Update order
            resetIndices()
        }
    }
    
    func resetIndices() {
        for i in workoutExercises.indices {
            let workoutExercise = workoutExercises[i]
            workoutExercise.order = i
        }
    }
}
