//
//  WorkoutExerciseSetRow.swift
//  Workout App
//
//  Created by Jonathan Young on 7/2/25.
//

import SwiftUI

struct WorkoutExerciseSetRow: View {
    let exerciseSet: ExerciseSet
    
    @State private var weight: String
    @State private var duration: String
    @State private var distance: String
    @State private var height: String
    @State private var reps: String
    
    init(exerciseSet: ExerciseSet) {
        self.exerciseSet = exerciseSet
        self.weight = exerciseSet.weight == nil ? "" : "\(exerciseSet.weight!)"
        self.duration = exerciseSet.duration == nil ? "" : "\(exerciseSet.duration!)"
        self.distance = exerciseSet.distance == nil ? "" : "\(exerciseSet.distance!)"
        self.height = exerciseSet.height == nil ? "" : "\(exerciseSet.height!)"
        self.reps = exerciseSet.reps == nil ? "" : "\(exerciseSet.reps!)"
    }
    
    var body: some View {
        HStack {
            HStack {
                SetTypeIconMenuView(exerciseSet: exerciseSet)
                Group {
                    
                }
            }
            HStack {
                Group {
                    switch exerciseSet.workoutExercise.exercise.exerciseType {
                    case .weightedReps:
                        TextField("Weight", text: $weight)
                            .keyboardType(.numberPad)
                            .foregroundStyle(exerciseSet.weight == nil ? .secondary : .primary)
                            .onChange(of: weight) { _, newValue in
                                if newValue.isEmpty {
                                    exerciseSet.weight = nil
                                } else {
                                    exerciseSet.weight = Double(newValue)
                                }
                            }
                        TextField("Reps", text: $reps)
                            .keyboardType(.numberPad)
                            .foregroundStyle(exerciseSet.reps == nil ? .secondary : .primary)
                            .onChange(of: reps) { _, newValue in
                                if newValue.isEmpty {
                                    exerciseSet.reps = nil
                                } else {
                                    exerciseSet.reps = Int(newValue)
                                }
                            }
                    case .bodyweightReps:
                        TextField("Weight", text: $weight)
                            .keyboardType(.numberPad)
                            .foregroundStyle(exerciseSet.weight == nil ? .secondary : .primary)
                            .onChange(of: weight) { _, newValue in
                                if newValue.isEmpty {
                                    exerciseSet.weight = nil
                                } else {
                                    exerciseSet.weight = Double(newValue)
                                }
                            }
                        TextField("Reps", text: $reps)
                            .keyboardType(.numberPad)
                            .foregroundStyle(exerciseSet.reps == nil ? .secondary : .primary)
                            .onChange(of: reps) { _, newValue in
                                if newValue.isEmpty {
                                    exerciseSet.reps = nil
                                } else {
                                    exerciseSet.reps = Int(newValue)
                                }
                            }
                    case .timeBased:
                        TextField("Weight", text: $weight)
                            .keyboardType(.numberPad)
                            .foregroundStyle(exerciseSet.weight == nil ? .secondary : .primary)
                            .onChange(of: weight) { _, newValue in
                                if newValue.isEmpty {
                                    exerciseSet.weight = nil
                                } else {
                                    exerciseSet.weight = Double(newValue)
                                }
                            }
                        TextField("Duration", text: $duration)
                            .keyboardType(.numberPad)
                            .foregroundStyle(exerciseSet.duration == nil ? .secondary : .primary)
                            .onChange(of: duration) { _, newValue in
                                if newValue.isEmpty {
                                    exerciseSet.duration = nil
                                } else {
                                    exerciseSet.duration = TimeInterval(newValue)
                                }
                            }
                    case .distanceTime:
                        TextField("Distance", text: $distance)
                            .keyboardType(.numberPad)
                            .foregroundStyle(exerciseSet.distance == nil ? .secondary : .primary)
                            .onChange(of: distance) { _, newValue in
                                if newValue.isEmpty {
                                    exerciseSet.distance = nil
                                } else {
                                    exerciseSet.distance = Double(newValue)
                                }
                            }
                        TextField("Duration", text: $duration)
                            .keyboardType(.numberPad)
                            .foregroundStyle(exerciseSet.duration == nil ? .secondary : .primary)
                            .onChange(of: duration) { _, newValue in
                                if newValue.isEmpty {
                                    exerciseSet.duration = nil
                                } else {
                                    exerciseSet.duration = TimeInterval(newValue)
                                }
                            }
                    case .distanceOnly:
                        TextField("Distance", text: $distance)
                            .keyboardType(.numberPad)
                            .foregroundStyle(exerciseSet.distance == nil ? .secondary : .primary)
                            .onChange(of: distance) { _, newValue in
                                if newValue.isEmpty {
                                    exerciseSet.distance = nil
                                } else {
                                    exerciseSet.distance = Double(newValue)
                                }
                            }
                    case .timeOnly:
                        TextField("Duration", text: $duration)
                            .keyboardType(.numberPad)
                            .foregroundStyle(exerciseSet.duration == nil ? .secondary : .primary)
                            .onChange(of: duration) { _, newValue in
                                if newValue.isEmpty {
                                    exerciseSet.duration = nil
                                } else {
                                    exerciseSet.duration = TimeInterval(newValue)
                                }
                            }
                    case .repsOnly:
                        TextField("Reps", text: $reps)
                            .keyboardType(.numberPad)
                            .foregroundStyle(exerciseSet.reps == nil ? .secondary : .primary)
                            .onChange(of: reps) { _, newValue in
                                if newValue.isEmpty {
                                    exerciseSet.reps = nil
                                } else {
                                    exerciseSet.reps = Int(newValue)
                                }
                            }
                    case .heightReps:
                        TextField("Height", text: $height)
                            .keyboardType(.numberPad)
                            .foregroundStyle(exerciseSet.height == nil ? .secondary : .primary)
                            .onChange(of: height) { _, newValue in
                                if newValue.isEmpty {
                                    exerciseSet.height = nil
                                } else {
                                    exerciseSet.height = Double(newValue)
                                }
                            }
                        TextField("Reps", text: $reps)
                            .keyboardType(.numberPad)
                            .foregroundStyle(exerciseSet.reps == nil ? .secondary : .primary)
                            .onChange(of: reps) { _, newValue in
                                if newValue.isEmpty {
                                    exerciseSet.reps = nil
                                } else {
                                    exerciseSet.reps = Int(newValue)
                                }
                            }
                    case .heightOnly:
                        TextField("Height", text: $height)
                            .keyboardType(.numberPad)
                            .foregroundStyle(exerciseSet.height == nil ? .secondary : .primary)
                            .onChange(of: height) { _, newValue in
                                if newValue.isEmpty {
                                    exerciseSet.height = nil
                                } else {
                                    exerciseSet.height = Double(newValue)
                                }
                            }
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
    }
}

#Preview {
    let workout = Workout(name: "Test Workout")
    let exercise = DEFAULT_EXERCISES[0]
    let workoutExercise = WorkoutExercise(supersetNumber: nil, sets: [], order: 0, workout: workout, exercise: exercise)
    let exerciseSet = ExerciseSet(type: .normal, order: 0, workoutExercise: workoutExercise)
    NavigationStack {
        WorkoutExerciseSetRow(exerciseSet: exerciseSet)
    }
}
