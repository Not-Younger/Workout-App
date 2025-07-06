//
//  WorkoutExerciseRowView.swift
//  Workout App
//
//  Created by Jonathan Young on 6/28/25.
//

import SwiftUI

struct WorkoutExerciseRowView: View {
    @Bindable var workoutExercise: WorkoutExercise
    @Binding var editMode: Bool
    
    let rowHeight: CGFloat = 25
    let fontSize: CGFloat = 16
    
    var body: some View {
        HStack {
            Text(workoutExercise.exercise.name)
                .font(.system(size: fontSize))
                .fontWeight(.bold)
            Spacer()
        }
        .moveDisabled(!editMode)
        .deleteDisabled(!editMode)
        .listRowSeparator(.hidden, edges: .all)
        
        if !editMode {
            WorkoutExerciseRowColumnsHeaderView(workoutExercise: workoutExercise, rowHeight: rowHeight, fontSize: fontSize)
                .deleteDisabled(true)
                .moveDisabled(true)
            
            WorkoutExerciseRowSetsView(workoutExercise: workoutExercise, rowHeight: rowHeight, fontSize: fontSize)
                .moveDisabled(true)
        }
    }
}
