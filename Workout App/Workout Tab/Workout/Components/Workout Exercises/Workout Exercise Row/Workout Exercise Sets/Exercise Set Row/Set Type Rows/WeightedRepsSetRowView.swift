//
//  WeightedRepsSetRowView.swift
//  Workout App
//
//  Created by Jonathan Young on 7/5/25.
//

import SwiftUI

struct WeightedRepsSetRowView: View {
    @Environment(\.colorScheme) private var colorScheme
    
    let workoutExercise: WorkoutExercise
    let exerciseSet: ExerciseSet
    @State private var weight: String
    let suggestedWeight: Double?
    @State private var reps: String
    let suggestedReps: Int?
    
    let weightType: WeightUnitType
    
    let rowHeight: CGFloat
    let fontSize: CGFloat
    @Binding var isTextFocused: Bool
    
    @FocusState private var isFocused: Bool
    
    init(workoutExercise: WorkoutExercise, exerciseSet: ExerciseSet, rowHeight: CGFloat, fontSize: CGFloat, isTextFocused: Binding<Bool>) {
        self.workoutExercise = workoutExercise
        self.exerciseSet = exerciseSet
        self.weight = GlobalHelpers.formatDouble(exerciseSet.weight)
        self.suggestedWeight = exerciseSet.getSuggestedWeight()
        self.reps = GlobalHelpers.formatInt(exerciseSet.reps)
        self.suggestedReps = exerciseSet.getSuggestedReps()
        
        self.weightType = workoutExercise.weightType
        
        self.rowHeight = rowHeight
        self.fontSize = fontSize
        _isTextFocused = isTextFocused
    }
    
    var body: some View {
        HStack {
            Rectangle()
                .frame(width: 3)
                .foregroundStyle(workoutExercise.supersetColor)
            let previousString = exerciseSet.previousString(weightType: weightType)
            HStack {
                SetTypeIconMenuView(workoutExercise: workoutExercise, exerciseSet: exerciseSet, fontSize: fontSize, size: rowHeight)
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
                        .keyboardType(.decimalPad)
                        .foregroundStyle(exerciseSet.weight == nil ? .secondary : .primary)
                        .onChange(of: weight) { _, newValue in
                            if newValue.isEmpty {
                                exerciseSet.weight = nil
                                exerciseSet.isCompleted = false
                            } else {
                                updateWeight(newValue)
                            }
                        }
                        .focused($isFocused)
                        .onChange(of: isFocused) { _, newValue in
                            if newValue {
                                isTextFocused = newValue
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
                                updateReps(newValue)
                            }
                        }
                        .focused($isFocused)
                        .onChange(of: isFocused) { _, newValue in
                            if newValue {
                                isTextFocused = newValue
                            }
                        }
                }
                .frame(maxWidth: .infinity)
                .frame(height: rowHeight)
                .multilineTextAlignment(.center)
            }
            .frame(maxWidth: .infinity)
            
            Button {
                withAnimation {
                    if !weight.isEmpty, !reps.isEmpty {
                        exerciseSet.isCompleted.toggle()
                    } else if let suggestedWeight, let suggestedReps {
                        weight = GlobalHelpers.formatDouble(suggestedWeight)
                        reps = GlobalHelpers.formatInt(suggestedReps)
                        exerciseSet.isCompleted.toggle()
                    }
                }
            } label: {
                CompleteSetButtonLabelView(isComplete: exerciseSet.isCompleted, rowHeight: rowHeight, fontSize: fontSize)
            }
            .buttonStyle(PlainButtonStyle())
            .disabled(disableCompleteButton())
            Rectangle()
                .frame(width: 3)
                .foregroundStyle(Color.clear)
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
    
    func disableCompleteButton() -> Bool {
        if !weight.isEmpty, !reps.isEmpty {
            return false
        }
        if suggestedWeight != nil, suggestedReps != nil {
            return false
        }
        return true
    }
    
    func updateWeight(_ newValue: String) {
        // Filter to allow only digits and at most one decimal point
        let filtered = newValue.filter { "0123456789.".contains($0) }
        let components = filtered.split(separator: ".", maxSplits: 2, omittingEmptySubsequences: false)
        
        // Helper function to sanitize and handle leading zeros
        func sanitize(_ string: String) -> String {
            var result = string
            
            // Prepend 0 if it starts with "."
            if result.first == "." {
                result = "0" + result
            }
            
            // If it starts with "0" but not "0." (e.g. "007", "0008"), remove leading zeros
            if result.hasPrefix("0") && !result.hasPrefix("0.") {
                result = String(result.drop(while: { $0 == "0" }))
                if result.isEmpty {
                    result = "0"
                }
            }
            
            return result
        }
        
        if components.count > 2 {
            let sanitized = components.prefix(2).joined(separator: ".")
            weight = sanitize(sanitized)
        } else {
            let cleaned = sanitize(filtered)
            if cleaned != newValue {
                weight = cleaned
            } else {
                weight = newValue
            }
        }

        if let doubleValue = Double(weight) {
            exerciseSet.weight = doubleValue
        } else {
            exerciseSet.weight = nil
        }
    }


    
    func updateReps(_ newValue: String) {
        // Allow only digits
        let filtered = newValue.filter { "0123456789".contains($0) }
        
        // Remove leading zeros
        let cleaned = String(filtered.drop(while: { $0 == "0" }))
        
        // Avoid empty string if user deletes everything or enters only zeros
        reps = cleaned.isEmpty ? "0" : cleaned

        if let intValue = Int(reps) {
            exerciseSet.reps = intValue
        } else {
            exerciseSet.reps = nil
        }
    }
}

#Preview {
    @Previewable @State var isTextFocused: Bool = false
    let workout = Workout(name: "Test Workout")
    let exercise = DEFAULT_EXERCISES[0]
    let workoutExercise = WorkoutExercise(supersetNumber: nil, order: 0, sets: [], workout: workout, exercise: exercise)
    let exerciseSet = ExerciseSet(type: .normal, order: 0, previousWeight: 225, previousDuration: nil, previousDistance: nil, previousHeight: nil, previousReps: 5, exercise: exercise, workoutExercise: workoutExercise)
    
    WeightedRepsSetRowView(workoutExercise: workoutExercise, exerciseSet: exerciseSet, rowHeight: 25, fontSize: 16, isTextFocused: $isTextFocused)
}
