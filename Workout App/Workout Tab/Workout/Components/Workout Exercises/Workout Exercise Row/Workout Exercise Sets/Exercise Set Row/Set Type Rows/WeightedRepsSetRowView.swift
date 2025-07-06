//
//  WeightedRepsSetRowView.swift
//  Workout App
//
//  Created by Jonathan Young on 7/5/25.
//

import SwiftUI

struct WeightedRepsSetRowView: View {
    @Environment(\.colorScheme) private var colorScheme
    
    let exerciseSet: ExerciseSet
    @State private var weight: String
    let suggestedWeight: Double?
    @State private var reps: String
    let suggestedReps: Int?
    
    let weightType: WeightUnitType
    
    let rowHeight: CGFloat
    let fontSize: CGFloat
    
    init(workoutExercise: WorkoutExercise, exerciseSet: ExerciseSet, rowHeight: CGFloat, fontSize: CGFloat) {
        self.exerciseSet = exerciseSet
        self.weight = GlobalHelpers.formatDouble(exerciseSet.weight)
        self.suggestedWeight = exerciseSet.getSuggestedWeight()
        self.reps = GlobalHelpers.formatInt(exerciseSet.reps)
        self.suggestedReps = exerciseSet.getSuggestedReps()
        
        self.weightType = workoutExercise.weightType
        
        self.rowHeight = rowHeight
        self.fontSize = fontSize
    }
    
    var body: some View {
        HStack {
            let previousString = exerciseSet.previousString(weightType: weightType)
            HStack {
                SetTypeIconMenuView(exerciseSet: exerciseSet, size: rowHeight)
                Button {
                    if let previousWeight = exerciseSet.previousWeight, let previousReps = exerciseSet.previousReps {
                        exerciseSet.weight = previousWeight
                        weight = GlobalHelpers.formatDouble(previousWeight)
                        exerciseSet.reps = previousReps
                        reps = String(previousReps)
                        exerciseSet.isCompleted = false
                    }
                } label: {
                    Text(previousString ?? "-")
                }
                .buttonStyle(PlainButtonStyle())
                .disabled(disablePreviousButton())
                .frame(maxWidth: .infinity)
                .frame(height: rowHeight)
            }
            .frame(maxWidth: .infinity)
            HStack {
                Group {
                    var suggestedWeightString: String {
                        if let suggestedWeight {
                            return GlobalHelpers.formatDouble(suggestedWeight)
                        }
                        return "-"
                    }
                    TextField(suggestedWeightString, text: $weight)
                        .keyboardType(.numberPad)
                        .foregroundStyle(exerciseSet.weight == nil ? .secondary : .primary)
                        .onChange(of: weight) { _, newValue in
                            if newValue.isEmpty {
                                exerciseSet.weight = nil
                                exerciseSet.isCompleted = false
                            } else {
                                exerciseSet.weight = Double(newValue)
                            }
                        }
                    var suggestedRepsString: String {
                        if let suggestedReps {
                            return GlobalHelpers.formatInt(suggestedReps)
                        }
                        return "-"
                    }
                    TextField(suggestedRepsString, text: $reps)
                        .keyboardType(.numberPad)
                        .foregroundStyle(exerciseSet.reps == nil ? .secondary : .primary)
                        .onChange(of: reps) { _, newValue in
                            if newValue.isEmpty {
                                exerciseSet.reps = nil
                                exerciseSet.isCompleted = false
                            } else {
                                exerciseSet.reps = Int(newValue)
                            }
                        }
                }
                .frame(maxWidth: .infinity)
                .frame(height: rowHeight)
                .multilineTextAlignment(.center)
            }
            .frame(maxWidth: .infinity)
            
            Button {
                if !weight.isEmpty, !reps.isEmpty {
                    exerciseSet.isCompleted.toggle()
                } else if let suggestedWeight, let suggestedReps {
                    weight = GlobalHelpers.formatDouble(suggestedWeight)
                    reps = GlobalHelpers.formatInt(suggestedReps)
                    exerciseSet.isCompleted.toggle()
                }
            } label: {
                CompleteSetButtonLabelView(isComplete: exerciseSet.isCompleted, rowHeight: rowHeight, fontSize: fontSize)
            }
            .buttonStyle(PlainButtonStyle())
        }
        .font(.system(size: fontSize))
    }
    
    func disablePreviousButton() -> Bool {
        if exerciseSet.previousWeight != nil, exerciseSet.previousReps != nil, exerciseSet.weight == exerciseSet.previousWeight, exerciseSet.reps == exerciseSet.previousReps {
            return true
        } else if exerciseSet.previousWeight == nil || exerciseSet.previousReps == nil {
            return true
        }
        return false
    }
}

#Preview {
    let workout = Workout(name: "Test Workout")
    let exercise = DEFAULT_EXERCISES[0]
    let workoutExercise = WorkoutExercise(supersetNumber: nil, order: 0, sets: [], workout: workout, exercise: exercise)
    let exerciseSet = ExerciseSet(type: .normal, order: 0, previousWeight: 225, previousDuration: nil, previousDistance: nil, previousHeight: nil, previousReps: 5, exercise: exercise, workoutExercise: workoutExercise)
    
    WeightedRepsSetRowView(workoutExercise: workoutExercise, exerciseSet: exerciseSet, rowHeight: 25, fontSize: 16)
}
