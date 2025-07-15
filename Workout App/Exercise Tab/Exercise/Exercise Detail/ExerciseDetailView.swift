//
//  ExerciseDetailView.swift
//  Workout App
//
//  Created by Jonathan Young on 6/26/25.
//

import SwiftUI

struct ExerciseDetailView: View {
    @Environment(\.dismiss) private var dismiss
    
    let exercise: Exercise
    let isShownInSheet: Bool
    
    @State private var selectedTab: ExerciseDetailTab = .howTo
    
    init(exercise: Exercise, isShownInSheet: Bool = false) {
        self.exercise = exercise
        self.isShownInSheet = isShownInSheet
    }
    
    var body: some View {
        VStack {
            ExerciseDetailTabView(selectedTab: $selectedTab)
            TabView(selection: $selectedTab) {
                ExerciseDetailSummaryView(exercise: exercise)
                    .tag(ExerciseDetailTab.summary)
                
                ExerciseDetailHistoryView(exercise: exercise)
                    .tag(ExerciseDetailTab.history)
                
                ExerciseDetailHowToView(exercise: exercise)
                    .tag(ExerciseDetailTab.howTo)
                
                ExerciseDetailChartsView(exercise: exercise)
                    .tag(ExerciseDetailTab.charts)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
        .navigationTitle(exercise.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if isShownInSheet {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Close") {
                        dismiss()
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var navigationPaths = NavigationPaths()
    let exercise = Exercise(name: "Bench Press (Barbell)", note: "Suffered a minor injury during the last workout. Rest for 2 weeks.", exerciseDescription: "A compound chest exercise where you press a barbell upward from a lying position to target the pectorals, triceps, and shoulders.", howTo: ["Lie on the bench", "Extend your arms and grab the bar evenly, having your hands slightly wider than shoulder-width apart.", "Bring your shoulder blades back and dig them into the bench.", "Arch you lower back and plant your feet flat on the floor.", "Take a breath, unrack the bar, and bring it over your chest.", "Inhale again and lower the barbell to your lwer chest, tapping it slightly.", "Hold for a moment and press the bar until your elbows are straight. Exhale."], muscleType: .chest, secondaryMuscleTypes: [.triceps, .shoulders], equipmentType: .barbell, exerciseType: .weightedReps)
    return NavigationStack {
        ExerciseDetailView(exercise: exercise)
    }
    .environment(navigationPaths)
}
