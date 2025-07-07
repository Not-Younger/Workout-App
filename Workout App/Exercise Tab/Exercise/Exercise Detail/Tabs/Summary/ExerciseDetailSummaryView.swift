//
//  ExerciseDetailSummaryView.swift
//  Workout App
//
//  Created by Jonathan Young on 7/6/25.
//

import SwiftUI

struct ExerciseDetailSummaryView: View {
    let exercise: Exercise
    
    var body: some View {
        VStack(spacing: 25) {
            SummaryMediaView(exercise: exercise)
            VStack(spacing: 10) {
                SummaryHeaderView(exercise: exercise)
                SummaryExerciseDetailsView(exercise: exercise)
            }
            SummaryPersonalRecordsView(exercise: exercise)
        }
    }
}
