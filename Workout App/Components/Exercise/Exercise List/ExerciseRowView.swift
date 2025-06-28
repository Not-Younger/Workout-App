//
//  ExerciseRowView.swift
//  Workout App
//
//  Created by Jonathan Young on 6/26/25.
//

import SwiftUI

struct ExerciseRowView: View {
    @Environment(ContentView.ViewModel.self) private var VM: ContentView.ViewModel
    let exercise: Exercise
    
    var body: some View {
        HStack {
            ExerciseIconView(exercise: exercise)
            VStack(alignment: .leading) {
                Text(exercise.name)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(2)
                Text(exercise.muscleType.rawValue)
                    .font(.subheadline)
            }
            Spacer()
            Button {
                VM.workoutPath.append(exercise)
            } label: {
                Image(systemName: "chart.line.text.clipboard")
            }
            .buttonStyle(PlainButtonStyle())
            .padding(.trailing, 8)
        }
        .fontDesign(.rounded)
        .alignmentGuide(.listRowSeparatorLeading) { _ in
            return 0
        }
    }
}

#Preview {
    let exercise = Exercise(name: "Bench Press (Barbell)", exerciseDescription: "A compound chest exercise where you press a barbell upward from a lying position to target the pectorals, triceps, and shoulders.", muscleType: .chest, equipmentType: .barbell)
    ExerciseRowView(exercise: exercise)
}
