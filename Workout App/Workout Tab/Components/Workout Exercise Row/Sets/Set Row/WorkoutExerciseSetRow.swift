//
//  WorkoutExerciseSetRow.swift
//  Workout App
//
//  Created by Jonathan Young on 7/2/25.
//

import SwiftUI

struct WorkoutExerciseSetRow: View {
    @Environment(\.colorScheme) private var colorScheme
    let exerciseSet: ExerciseSet
    
    @State private var weight: String
    @State private var duration: String
    @State private var distance: String
    @State private var height: String
    @State private var reps: String
    let weightType: WeightUnitType
    let distanceType: DistanceUnitType
    let heightType: HeightUnitType
    
    init(workoutExercise: WorkoutExercise, exerciseSet: ExerciseSet) {
        self.exerciseSet = exerciseSet
        self.weight = exerciseSet.weight == nil ? "" : "\(exerciseSet.weight!)"
        self.duration = exerciseSet.duration == nil ? "" : "\(exerciseSet.duration!)"
        self.distance = exerciseSet.distance == nil ? "" : "\(exerciseSet.distance!)"
        self.height = exerciseSet.height == nil ? "" : "\(exerciseSet.height!)"
        self.reps = exerciseSet.reps == nil ? "" : "\(exerciseSet.reps!)"
        
        self.weightType = workoutExercise.weightType
        self.distanceType = workoutExercise.distanceType
        self.heightType = workoutExercise.heightType
    }
    
    var body: some View {
        HStack {
            let previousString = exerciseSet.previousString(weightType: weightType, distanceType: distanceType, heightType: heightType)
            HStack {
                SetTypeIconMenuView(exerciseSet: exerciseSet)
                Group {
                    if let previousString {
                        Button {
                            withAnimation {
//                                fillPreviousValues()
                            }
                        } label: {
                            Text(previousString)
                        }
                        .buttonStyle(PlainButtonStyle())
                    } else {
                        Text("--")
                    }
                }
                .frame(maxWidth: .infinity)
                .background(.gray.opacity(0.3))
            }
            .frame(maxWidth: .infinity)
            HStack {
                Group {
                    switch exerciseSet.workoutExercise?.exercise.exerciseType {
                    case .weightedReps:
                        TextField("", text: $weight)
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
//                        if let secondPlaceholder = getSecondPlaceholderValueString() {
//                            TextField(secondPlaceholder, text: $reps)
//                                .keyboardType(.numberPad)
//                                .foregroundStyle(exerciseSet.reps == nil ? .secondary : .primary)
//                                .onChange(of: reps) { _, newValue in
//                                    if newValue.isEmpty {
//                                        exerciseSet.reps = nil
//                                        exerciseSet.isCompleted = false
//                                    } else {
//                                        exerciseSet.reps = Int(newValue)
//                                    }
//                                }
//                        }
                    case .bodyweightReps:
                        TextField("", text: $weight)
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
//                        if let secondPlaceholder = getSecondPlaceholderValueString() {
//                            TextField(secondPlaceholder, text: $reps)
//                                .keyboardType(.numberPad)
//                                .foregroundStyle(exerciseSet.reps == nil ? .secondary : .primary)
//                                .onChange(of: reps) { _, newValue in
//                                    if newValue.isEmpty {
//                                        exerciseSet.reps = nil
//                                        exerciseSet.isCompleted = false
//                                    } else {
//                                        exerciseSet.reps = Int(newValue)
//                                    }
//                                }
//                        }
                    case .timeBased:
                        TextField("", text: $weight)
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
//                        if let secondPlaceholder = getSecondPlaceholderValueString() {
//                            TextField(secondPlaceholder, text: $duration)
//                                .keyboardType(.numberPad)
//                                .foregroundStyle(exerciseSet.duration == nil ? .secondary : .primary)
//                                .onChange(of: duration) { _, newValue in
//                                    if newValue.isEmpty {
//                                        exerciseSet.duration = nil
//                                        exerciseSet.isCompleted = false
//                                    } else {
//                                        exerciseSet.duration = TimeInterval(newValue)
//                                    }
//                                }
//                        }
                    case .distanceTime:
                        TextField("", text: $distance)
                            .keyboardType(.numberPad)
                            .foregroundStyle(exerciseSet.distance == nil ? .secondary : .primary)
                            .onChange(of: distance) { _, newValue in
                                if newValue.isEmpty {
                                    exerciseSet.distance = nil
                                    exerciseSet.isCompleted = false
                                } else {
                                    exerciseSet.distance = Double(newValue)
                                }
                            }
//                        if let secondPlaceholder = getSecondPlaceholderValueString() {
//                            TextField(secondPlaceholder, text: $duration)
//                                .keyboardType(.numberPad)
//                                .foregroundStyle(exerciseSet.duration == nil ? .secondary : .primary)
//                                .onChange(of: duration) { _, newValue in
//                                    if newValue.isEmpty {
//                                        exerciseSet.duration = nil
//                                        exerciseSet.isCompleted = false
//                                    } else {
//                                        exerciseSet.duration = TimeInterval(newValue)
//                                    }
//                                }
//                        }
                    case .distanceOnly:
                        TextField("", text: $distance)
                            .keyboardType(.numberPad)
                            .foregroundStyle(exerciseSet.distance == nil ? .secondary : .primary)
                            .onChange(of: distance) { _, newValue in
                                if newValue.isEmpty {
                                    exerciseSet.distance = nil
                                    exerciseSet.isCompleted = false
                                } else {
                                    exerciseSet.distance = Double(newValue)
                                }
                            }
                    case .timeOnly:
                        TextField("", text: $duration)
                            .keyboardType(.numberPad)
                            .foregroundStyle(exerciseSet.duration == nil ? .secondary : .primary)
                            .onChange(of: duration) { _, newValue in
                                if newValue.isEmpty {
                                    exerciseSet.duration = nil
                                    exerciseSet.isCompleted = false
                                } else {
                                    exerciseSet.duration = TimeInterval(newValue)
                                }
                            }
                    case .repsOnly:
                        TextField("", text: $reps)
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
                    case .heightReps:
                        TextField("", text: $height)
                            .keyboardType(.numberPad)
                            .foregroundStyle(exerciseSet.height == nil ? .secondary : .primary)
                            .onChange(of: height) { _, newValue in
                                if newValue.isEmpty {
                                    exerciseSet.height = nil
                                    exerciseSet.isCompleted = false
                                } else {
                                    exerciseSet.height = Double(newValue)
                                }
                            }
//                        if let secondPlaceholder = getSecondPlaceholderValueString() {
//                            TextField(secondPlaceholder, text: $reps)
//                                .keyboardType(.numberPad)
//                                .foregroundStyle(exerciseSet.reps == nil ? .secondary : .primary)
//                                .onChange(of: reps) { _, newValue in
//                                    if newValue.isEmpty {
//                                        exerciseSet.reps = nil
//                                        exerciseSet.isCompleted = false
//                                    } else {
//                                        exerciseSet.reps = Int(newValue)
//                                    }
//                                }
//                        }
                    case .heightOnly:
                        TextField("", text: $height)
                            .keyboardType(.numberPad)
                            .foregroundStyle(exerciseSet.height == nil ? .secondary : .primary)
                            .onChange(of: height) { _, newValue in
                                if newValue.isEmpty {
                                    exerciseSet.height = nil
                                    exerciseSet.isCompleted = false
                                } else {
                                    exerciseSet.height = Double(newValue)
                                }
                            }
                    default:
                        Text("-")
                    }
                }
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
                .background(.gray.opacity(0.3))
            }
            .frame(maxWidth: .infinity)
            
            Button {
                
            } label: {
                Image(systemName: "checkmark")
                    .font(.subheadline)
//                    .foregroundStyle(getCheckMarkForegroundColor())
                    .frame(width: 25, height: 25)
//                    .background(getCheckmarkBackgroundColor())
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            .buttonStyle(PlainButtonStyle())
        }
        .font(.subheadline)
    }
}
