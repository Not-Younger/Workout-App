//
//  HistoryWorkoutExerciseCardView.swift
//  Workout App
//
//  Created by Jonathan Young on 7/8/25.
//

import SwiftUI

struct HistoryWorkoutExerciseCardSetsPerformedView: View {
    let workoutExercise: WorkoutExercise
    
    var body: some View {
        VStack(spacing: 5) {
            HStack {
                Text("Sets Performed")
                Spacer()
                Text("1RM")
            }
            .bold()
            .padding(.bottom, 5)
            let sets = workoutExercise.sets.sorted(by: { $0.order < $1.order })
            ForEach(Array(sets.enumerated()), id: \.offset) { i, exerciseSet in
                HStack(spacing: 15) {
                    Group {
                        switch exerciseSet.type {
                        case .warmup:
                            Text("W")
                        case .normal:
                            Text("\(i - getNumberOfPriorSpecialSets(exerciseSet) + 1)")
                        case .failure:
                            Text("F")
                        case .dropSet:
                            Text("D")
                        }
                    }
                    .frame(width: 25)
                    Text(exerciseSet.currentString(weightType: workoutExercise.weightType, distanceType: workoutExercise.distanceType, heightType: workoutExercise.heightType) ?? "No Data")
                    Spacer()
                    if let max1RM = exerciseSet.get1RepMaxString(weightType: workoutExercise.weightType) {
                        Text(max1RM, format: .number)
                    }
                }
                .font(.system(size: 14))
                .foregroundStyle(getSetForegroundStyle(exerciseSet))
            }
        }
        .font(.system(size: 16))
        .fontDesign(.rounded)
    }
    
    func getNumberOfPriorSpecialSets(_ exerciseSet: ExerciseSet) -> Int {
        var count = 0
        for priorSet in workoutExercise.sets.sorted(by: { $0.order < $1.order })[..<exerciseSet.order] {
            if priorSet.type == .warmup || priorSet.type == .dropSet {
                count += 1
            }
        }
        return count
    }
    
    func getSetForegroundStyle(_ exerciseSet: ExerciseSet) -> Color {
        switch exerciseSet.type {
        case .warmup:
            return .orange
        case .normal:
            return .primary
        case .failure:
            return .red
        case .dropSet:
            return .purple
        }
    }
}

#Preview {
    let workout = Workout(name: "Test Workout")
    let exercise = Exercise(name: "Bench Press (Barbell)", note: "Suffered a minor injury during the last workout. Rest for 2 weeks.", exerciseDescription: "A compound chest exercise where you press a barbell upward from a lying position to target the pectorals, triceps, and shoulders.", howTo: ["Lie on the bench", "Extend your arms and grab the bar evenly, having your hands slightly wider than shoulder-width apart.", "Bring your shoulder blades back and dig them into the bench.", "Arch you lower back and plant your feet flat on the floor.", "Take a breath, unrack the bar, and bring it over your chest.", "Inhale again and lower the barbell to your lwer chest, tapping it slightly.", "Hold for a moment and press the bar until your elbows are straight. Exhale."], muscleType: .chest, secondaryMuscleTypes: [.triceps, .shoulders], equipmentType: .barbell, exerciseType: .weightedReps)
    let workoutExercise = WorkoutExercise(order: 0, workout: workout, exercise: exercise)
    let sets: [ExerciseSet] = [
        ExerciseSet(weight: 135, reps: 15, type: .warmup, order: 0, exercise: exercise, workoutExercise: workoutExercise),
        ExerciseSet(weight: 185, reps: 10, type: .normal, order: 1, exercise: exercise, workoutExercise: workoutExercise),
        ExerciseSet(weight: 225, reps: 5, type: .normal, order: 2, exercise: exercise, workoutExercise: workoutExercise),
        ExerciseSet(weight: 225, reps: 5, type: .normal, order: 3, exercise: exercise, workoutExercise: workoutExercise),
        ExerciseSet(weight: 225, reps: 4, type: .failure, order: 4, exercise: exercise, workoutExercise: workoutExercise),
        ExerciseSet(weight: 135, reps: 10, type: .dropSet, order: 5, exercise: exercise, workoutExercise: workoutExercise),
    ]
    workoutExercise.sets = sets
    
    return NavigationStack {
        HistoryWorkoutExerciseCardSetsPerformedView(workoutExercise: workoutExercise)
    }
}
