//
//  WorkoutAddCancelButtonsView.swift
//  Workout App
//
//  Created by Jonathan Young on 6/28/25.
//

import SwiftUI

struct WorkoutAddCancelButtonsView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @Environment(ContentView.ViewModel.self) private var VM: ContentView.ViewModel
    
    @Bindable var workout: Workout
    @State private var isShowingCancelWorkoutAlert: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Button {
                
            } label: {
                Text("Add Exercises")
                    .fontDesign(.rounded)
                    .bold()
                    .padding(.vertical, 5)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(BorderedProminentButtonStyle())
            .tint(.primary)
            Button {
                isShowingCancelWorkoutAlert = true
            } label: {
                Text("Cancel Workout")
                    .padding(.vertical, 5)
                    .frame(maxWidth: .infinity)
                    .fontDesign(.rounded)
                    .bold()
            }
            .buttonStyle(BorderedProminentButtonStyle())
            .tint(.red)
            .alert("Cancel Workout?", isPresented: $isShowingCancelWorkoutAlert) {
                Button("Cancel Workout", role: .destructive) {
                    modelContext.delete(workout)
                    VM.currentWorkout = nil
                    print("Deleted workout: \(workout.name)")
                    dismiss()
                }
                Button("Resume", role: .cancel) {}
            } message: {
                Text("Are you sure you want to cancel this workout? All progress will be lost.")
            }
        }
        .listRowSeparator(.hidden)
        .padding(.top, 30)
    }
}

#Preview {
    WorkoutAddCancelButtonsView(workout: Workout())
}
