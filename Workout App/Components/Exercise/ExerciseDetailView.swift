//
//  ExerciseDetailView.swift
//  Workout App
//
//  Created by Jonathan Young on 6/26/25.
//

import SwiftUI

struct ExerciseDetailView: View {
    let exercise: Exercise
    
    var body: some View {
        Text(exercise.name)
    }
}

#Preview {
    let exercise = Exercise(name: "Bench Press (Barbell)", exerciseDescription: "A compound chest exercise where you press a barbell upward from a lying position to target the pectorals, triceps, and shoulders.", muscleType: .chest, equipmentType: .barbell)
    ExerciseDetailView(exercise: exercise)
}
