//
//  SetTypeIconMenuView.swift
//  Workout App
//
//  Created by Jonathan Young on 7/2/25.
//

import SwiftUI

struct SetTypeIconMenuView: View {
    @Environment(\.colorScheme) private var colorScheme
    let workoutExercise: WorkoutExercise
    let exerciseSet: ExerciseSet
    let fontSize: CGFloat
    let size: CGFloat
    let numberOfPriorSpecialSets: Int
    
    init(workoutExercise: WorkoutExercise, exerciseSet: ExerciseSet, fontSize: CGFloat, size: CGFloat) {
        self.workoutExercise = workoutExercise
        self.exerciseSet = exerciseSet
        self.fontSize = fontSize
        self.size = size
        
        var numberOfPriorSpecialSets: Int = 0
        for priorSet in workoutExercise.sets.sorted(by: { $0.order < $1.order })[..<exerciseSet.order] {
            if priorSet.type == .warmup || priorSet.type == .dropSet {
                numberOfPriorSpecialSets += 1
            }
        }
        self.numberOfPriorSpecialSets = numberOfPriorSpecialSets
    }
    
    @State private var isShowingMoreInfo: Bool = false
    
    var body: some View {
        Menu {
            Button {
                exerciseSet.type = exerciseSet.type == .warmup ? .normal : .warmup
            } label: {
                Text("Warm Up")
                if exerciseSet.type == .warmup {
                    Image(systemName: "checkmark")
                }
            }
            Button {
                exerciseSet.type = exerciseSet.type == .dropSet ? .normal : .dropSet
            } label: {
                Text("Drop Set")
                if exerciseSet.type == .dropSet {
                    Image(systemName: "checkmark")
                }
            }
            Button {
                exerciseSet.type = exerciseSet.type == .failure ? .normal : .failure
            } label: {
                Text("Failure")
                if exerciseSet.type == .failure {
                    Image(systemName: "checkmark")
                }
            }
            Button {
                isShowingMoreInfo = true
            } label: {
                Label("More Info", systemImage: "questionmark")
            }
        } label: {
            SetTypeIconView(isCompleted: exerciseSet.isCompleted, order: exerciseSet.order - numberOfPriorSpecialSets, setType: exerciseSet.type, fontSize: fontSize, size: size)
        }
        .buttonStyle(PlainButtonStyle())
        .sheet(isPresented: $isShowingMoreInfo) {
            SetTypeInfoView()
        }
    }
}
