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
                .onLongPressGesture(minimumDuration: 0, maximumDistance: 100, pressing: { pressing in
                    self.hasPressed = pressing
                    if pressing {print("pressing")}
                    if !pressing {print("not presing")}
                }, perform: {
                    withAnimation {
                        if editMode?.wrappedValue == .active {
                            editMode?.wrappedValue = .inactive
                        } else {
                            editMode?.wrappedValue = .active
                        }
                    }
                })
        }
        .onMove { indices, newOffset in
            workout.exercises.move(fromOffsets: indices, toOffset: newOffset)
        }
    }
    
    func move(from source: IndexSet, to destination: Int) {
        workout.exercises.move(fromOffsets: source, toOffset: destination)
    }
}

#Preview {
    WorkoutExerciseListView(workout: Workout())
}
