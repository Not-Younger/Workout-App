//
//  ExerciseIcon.swift
//  Workout App
//
//  Created by Jonathan Young on 6/26/25.
//

import SwiftUI

struct ExerciseIconView: View {
    let exercise: Exercise
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .foregroundStyle(Color(.systemGray6))
            Image(systemName: "figure.strengthtraining.traditional")
                .resizable()
                .scaledToFit()
                .padding(10)
            // Add image later
            
        }
        .frame(width: 50, height: 50)
    }
}

#Preview {
    let exercise = Exercise(name: "Bench Press (Barbell)", exerciseDescription: "A compound chest exercise where you press a barbell upward from a lying position to target the pectorals, triceps, and shoulders.", muscleType: .chest, equipmentType: .barbell, exerciseType: .weightedReps)
    ExerciseIconView(exercise: exercise)
}
