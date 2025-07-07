//
//  SummaryExerciseDetailsView.swift
//  Workout App
//
//  Created by Jonathan Young on 7/6/25.
//

import SwiftUI

struct SummaryExerciseDetailsView: View {
    let exercise: Exercise
    
    var body: some View {
        if let exerciseDescription = exercise.exerciseDescription {
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(exerciseDescription)
                        .font(.system(size: 16))
                }
                Spacer()
            }
            .fontDesign(.rounded)
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
        }
    }
}
