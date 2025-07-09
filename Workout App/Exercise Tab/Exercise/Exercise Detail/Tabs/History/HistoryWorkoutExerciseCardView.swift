//
//  HistoryWorkoutExerciseCardView1.swift
//  Workout App
//
//  Created by Jonathan Young on 7/8/25.
//

import SwiftUI

struct HistoryWorkoutExerciseCardView: View {
    @Environment(\.colorScheme) private var colorScheme
    
    let workout: Workout
    let exercise: Exercise
    
    var body: some View {
        CardView {
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text(workout.name)
                        .font(.system(size: 16, weight: .bold))
                    Text(GlobalHelpers.formattedLongDate(from: workout.date)).foregroundStyle(.secondary)
                        .font(.system(size: 14))
                }
                Spacer()
            }
            ForEach(workout.workoutExercises.filter { $0.exercise == exercise }) { workoutExercise in
                HistoryWorkoutExerciseCardSetsPerformedView(workoutExercise: workoutExercise)
            }
        }
    }
}

#Preview {
    let workout = Workout(name: "Test Workout")
    let exercise = Exercise(name: "Bench Press (Barbell)", note: "Suffered a minor injury during the last workout. Rest for 2 weeks.", exerciseDescription: "A compound chest exercise where you press a barbell upward from a lying position to target the pectorals, triceps, and shoulders.", howTo: ["Lie on the bench", "Extend your arms and grab the bar evenly, having your hands slightly wider than shoulder-width apart.", "Bring your shoulder blades back and dig them into the bench.", "Arch you lower back and plant your feet flat on the floor.", "Take a breath, unrack the bar, and bring it over your chest.", "Inhale again and lower the barbell to your lwer chest, tapping it slightly.", "Hold for a moment and press the bar until your elbows are straight. Exhale."], muscleType: .chest, secondaryMuscleTypes: [.triceps, .shoulders], equipmentType: .barbell, exerciseType: .weightedReps)
    let workoutExercise = WorkoutExercise(order: 0, workout: workout, exercise: exercise)
    workout.workoutExercises = [workoutExercise]
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
        HistoryWorkoutExerciseCardView(workout: workout, exercise: exercise)
    }
}
