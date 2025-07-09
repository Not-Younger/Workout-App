//
//  ExerciseDetailHowToView.swift
//  Workout App
//
//  Created by Jonathan Young on 7/6/25.
//

import SwiftUI

struct ExerciseDetailHowToView: View {
    let exercise: Exercise
    
    var body: some View {
        ScrollView {
            VStack(spacing: 25) {
                CardView(padding: 0) {
                    SummaryMediaView(exercise: exercise)
                    SummaryHeaderView(exercise: exercise)
                        .padding([.leading, .bottom, .trailing])
                }
                CardView {
                    if exercise.howTo != nil {
                        HStack {
                            Text("Instructions")
                                .font(.system(size: 16, weight: .bold))
                            Spacer()
                        }
                        HowToExerciseStepsView(exercise: exercise)
                    } else {
                        ContentUnavailableView("No Steps Provided...", systemImage: "list.number", description: Text("When you add custom instructions for this exercise, they will appear here."))
                    }
                }
            }
            .padding()
        }
    }
}
