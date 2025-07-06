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
    @Environment(NavigationPaths.self) private var navigationPaths: NavigationPaths
    
    @Bindable var workout: Workout
    @Binding var workoutExercises: [WorkoutExercise]
    
    @State private var isAddingExercises: Bool = false
    @State private var isShowingCancelWorkoutAlert: Bool = false
    
    var body: some View {
        @Bindable var navigationPaths = navigationPaths
        VStack(spacing: 20) {
            Button {
                isAddingExercises = true
            } label: {
                Text("Add Exercises")
                    .fontDesign(.rounded)
                    .bold()
                    .padding(.vertical, 5)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(BorderedProminentButtonStyle())
            .tint(.primary)
            .sheet(isPresented: $isAddingExercises) {
                NavigationStack(path: $navigationPaths.workoutExercisePath) {
                    AddWorkoutExerciseView(workout: workout, workoutExercises: $workoutExercises)
                        .navigationDestination(for: Exercise.self) { exercise in
                            ExerciseDetailView(exercise: exercise)
                        }
                }
            }
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
                    do {
                        try modelContext.save()
                    } catch {
                        print("Error saving after deleting existing workout: \(error)")
                    }
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
