//
//  HowToExerciseStepsView.swift
//  Workout App
//
//  Created by Jonathan Young on 7/7/25.
//

import SwiftUI

struct HowToExerciseStepsView: View {
    let exercise: Exercise
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 20) {
                if let instructions = exercise.howTo {
                    ForEach(Array(instructions.enumerated()), id: \.offset) { index, item in
                        HStack(alignment: .top) {
                            Text("\(index + 1).").bold()
                            Text(item)
                        }
                    }
                }
            }
            Spacer()
        }
        .font(.system(size: 16))
        .fontDesign(.rounded)
    }
}
