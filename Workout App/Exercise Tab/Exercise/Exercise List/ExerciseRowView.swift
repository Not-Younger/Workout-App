//
//  ExerciseRowView.swift
//  Workout App
//
//  Created by Jonathan Young on 6/26/25.
//

import SwiftUI

struct ExerciseRowView: View {
    @Environment(\.colorScheme) private var colorScheme
    @Environment(NavigationPaths.self) private var navigationPaths: NavigationPaths
    
    @Binding var selectedExercises: [Exercise]
    let exercise: Exercise
    
    var body: some View {
        Button {
            navigationPaths.exercisePath.append(exercise)
        } label: {
            HStack {
                ExerciseIconView(exercise: exercise)
                VStack(alignment: .leading, spacing: 5) {
                    Text(exercise.name)
                        .font(.system(size: 16, weight: .bold))
                        .lineLimit(2)
                    Text(exercise.muscleType.rawValue)
                        .font(.system(size: 16))
                        .foregroundStyle(.secondary)
                }
                Spacer()
            }
            .contentShape(Rectangle())
            .fontDesign(.rounded)
            .alignmentGuide(.listRowSeparatorLeading) { _ in
                return 0
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    @ViewBuilder
    func getRowBackground(isSelected: Bool) -> some View {
        let baseColor = colorScheme == .dark ? Color.black : Color.white
        ZStack {
            baseColor
            if isSelected {
                let greenOpacity = colorScheme == .dark ? 0.3: 0.1
                Color.green.opacity(greenOpacity)
            }
        }
    }
}

#Preview {
    @Previewable @State var selectedExercises: [Exercise] = []
    let exercise = Exercise(name: "Bench Press (Barbell)", exerciseDescription: "A compound chest exercise where you press a barbell upward from a lying position to target the pectorals, triceps, and shoulders.", muscleType: .chest, equipmentType: .barbell, exerciseType: .weightedReps)
    ExerciseRowView(selectedExercises: $selectedExercises, exercise: exercise)
}
