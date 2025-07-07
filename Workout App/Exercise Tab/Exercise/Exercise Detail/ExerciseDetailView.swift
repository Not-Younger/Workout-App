//
//  ExerciseDetailView.swift
//  Workout App
//
//  Created by Jonathan Young on 6/26/25.
//

import SwiftUI

struct ExerciseDetailView: View {
    let exercise: Exercise
    
    @State private var selectedTab: ExerciseDetailTab = .summary
    
    var body: some View {
        VStack {
            ExerciseDetailTabView(selectedTab: $selectedTab)
            ScrollView {
                switch selectedTab {
                case .summary:
                    ExerciseDetailSummaryView(exercise: exercise)
                case .history:
                    ExerciseDetailHistoryView(exercise: exercise)
                case .howTo:
                    ExerciseDetailHowToView(exercise: exercise)
                case .charts:
                    ExerciseDetailChartsView(exercise: exercise)
                }
            }
        }
        .navigationTitle(exercise.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let exercise = Exercise(name: "Bench Press (Barbell)", note: "Suffered a minor injury during the last workout. Rest for 2 weeks.", exerciseDescription: "A compound chest exercise where you press a barbell upward from a lying position to target the pectorals, triceps, and shoulders.", muscleType: .chest, secondaryMuscleTypes: [.triceps, .shoulders], equipmentType: .barbell, exerciseType: .weightedReps)
    NavigationStack {
        ExerciseDetailView(exercise: exercise)
    }
}
