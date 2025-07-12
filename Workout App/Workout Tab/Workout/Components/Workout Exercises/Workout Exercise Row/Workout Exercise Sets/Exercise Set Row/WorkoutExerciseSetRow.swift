//
//  WorkoutExerciseSetRow.swift
//  Workout App
//
//  Created by Jonathan Young on 7/2/25.
//

import SwiftUI

struct WorkoutExerciseSetRow: View {
    @Environment(\.colorScheme) private var colorScheme
    let workoutExercise: WorkoutExercise
    let exerciseSet: ExerciseSet
    let rowHeight: CGFloat
    let fontSize: CGFloat
    @Binding var isTextFocused: Bool
    
    var body: some View {
        switch exerciseSet.exercise.exerciseType {
        case .weightedReps:
            WeightedRepsSetRowView(workoutExercise: workoutExercise, exerciseSet: exerciseSet, rowHeight: rowHeight, fontSize: fontSize, isTextFocused: $isTextFocused)
        case .bodyweightReps:
            BodyweightRepsSetRowView()
        case .timeBased:
            TimeBasedSetRowView()
        case .distanceTime:
            DistanceTimeSetRowView()
        case .distanceOnly:
            DistanceOnlySetRowView()
        case .timeOnly:
            TimeOnlySetRowView()
        case .repsOnly:
            RepsOnlySetRowView()
        case .heightReps:
            HeightRepsSetRowView()
        case .heightOnly:
            HeightOnlySetRowView()
        }
    }
}
