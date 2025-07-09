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
        ScrollView {
            VStack(spacing: 25) {
                CardView(padding: 0) {
                    SummaryMediaView(exercise: exercise)
                    VStack(spacing: 15) {
                        SummaryHeaderView(exercise: exercise)
                        SummaryExerciseDetailsView(exercise: exercise)
                    }
                    .padding([.leading, .bottom, .trailing])
                }
                CardView {
                    SummaryPersonalRecordsView(exercise: exercise)
                }
            }
            .padding()
        }
    }
}
