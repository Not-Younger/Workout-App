//
//  ExerciseDetailHistoryView.swift
//  Workout App
//
//  Created by Jonathan Young on 7/6/25.
//

import SwiftUI

struct ExerciseDetailHistoryView: View {
    let exercise: Exercise
    
    var body: some View {
        VStack(spacing: 25) {
            SummaryMediaView(exercise: exercise)
            
        }
    }
}
