//
//  ExerciseRowView.swift
//  Workout App
//
//  Created by Jonathan Young on 6/26/25.
//

import SwiftUI

struct ExerciseRowView: View {
    @Environment(NavigationPaths.self) private var navigationPaths: NavigationPaths
    
    @Binding var selectedExercises: [Exercise]
    let exercise: Exercise
    let selectable: Bool
    
    var body: some View {
        let isSelected = selectedExercises.contains(exercise)
        HStack {
            if isSelected {
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: 5)
                    .foregroundStyle(Color.green)
                    .transition(.move(edge: .leading).combined(with: .opacity))
            }
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
                if selectable {
                    navigationPaths.workoutExercisePath.append(exercise)
                } else {
                    navigationPaths.exercisePath.append(exercise)
                }
            } label: {
                Image(systemName: "chart.line.text.clipboard")
            }
            .buttonStyle(PlainButtonStyle())
            .padding(.trailing, 8)
        }
        .contentShape(Rectangle())
        .fontDesign(.rounded)
        .listRowBackground(isSelected ? Color.green.opacity(0.1) : Color.clear)
        .alignmentGuide(.listRowSeparatorLeading) { _ in
            return 0
        }
        .onTapGesture {
            withAnimation {
                if selectable, !selectedExercises.contains(exercise) {
                    selectedExercises.append(exercise)
                } else {
                    selectedExercises.removeAll(where: { $0.id == exercise.id })
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var selectedExercises: [Exercise] = []
    let exercise = Exercise(name: "Bench Press (Barbell)", exerciseDescription: "A compound chest exercise where you press a barbell upward from a lying position to target the pectorals, triceps, and shoulders.", muscleType: .chest, equipmentType: .barbell, exerciseType: .weightedReps)
    ExerciseRowView(selectedExercises: $selectedExercises, exercise: exercise, selectable: false)
}
