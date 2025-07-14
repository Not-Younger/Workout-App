//
//  WorkoutExerciseRowSetsView.swift
//  Workout App
//
//  Created by Jonathan Young on 6/28/25.
//

import SwiftUI

struct WorkoutExerciseRowSetsView: View {
    @Environment(\.modelContext) private var modelContext
    @Binding var workoutExercises: [WorkoutExercise]
    @Bindable var workoutExercise: WorkoutExercise
    let rowHeight: CGFloat
    let fontSize: CGFloat
    @Binding var isTextFocused: Bool
    
    var body: some View {
        ForEach(workoutExercise.sets.sorted(by: { $0.order < $1.order })) { set in
            WorkoutExerciseSetRow(workoutExercise: workoutExercise, exerciseSet: set, rowHeight: rowHeight, fontSize: fontSize, isTextFocused: $isTextFocused)
                .listRowBackground(set.isCompleted ? Color.green.opacity(0.15) : Color.clear)
                .alignmentGuide(.listRowSeparatorLeading) { _ in
                    return 10
                }
        }
        .onDelete(perform: deleteSet)
        Button {
            withAnimation {
                let index = workoutExercise.sets.count
                if index < workoutExercise.exercise.previousSets.count {
                    let previousSet = workoutExercise.exercise.previousSets.sorted(by: { $0.order < $1.order })[index]
                    let newSet = ExerciseSet(
                        type: previousSet.type,
                        order: index,
                        previousWeight: previousSet.weight,
                        previousDuration: previousSet.duration,
                        previousDistance: previousSet.distance,
                        previousHeight: previousSet.height,
                        previousReps: previousSet.reps,
                        exercise: workoutExercise.exercise,
                        workoutExercise: workoutExercise
                    )
                    workoutExercise.sets.append(newSet)
                } else {
                    let newSet = ExerciseSet(type: .normal, order: index, exercise: workoutExercise.exercise, workoutExercise: workoutExercise)
                    workoutExercise.sets.append(newSet)
                }
            }
        } label: {
            AddSetButtonLabelView(fontSize: fontSize, rowHeight: rowHeight, supersetColor: workoutExercise.supersetColor)
        }
        .moveDisabled(true)
        .deleteDisabled(true)
        .buttonStyle(PlainButtonStyle())
    }
    
    func deleteSet(at offsets: IndexSet) {
        for offset in offsets {
            // find this book in our query
            let set = workoutExercise.sets[offset]

            // delete it from the context
            workoutExercise.sets.remove(at: offset)
            modelContext.delete(set)
            
            resetIndices()
        }
    }
    
    func resetIndices() {
        for i in workoutExercise.sets.indices {
            let set = workoutExercise.sets[i]
            set.order = i
        }
    }
}
