//
//  WorkoutView.swift
//  Workout App
//
//  Created by Jonathan Young on 6/28/25.
//

import SwiftData
import SwiftUI

struct WorkoutView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(ContentView.ViewModel.self) private var VM: ContentView.ViewModel
    
    @Bindable var workout: Workout
    
    var body: some View {
        List {
            WorkoutHeaderView(workout: workout)
            
            WorkoutExerciseListView(workout: workout)
            
            WorkoutAddCancelButtonsView(workout: workout)
        }
        .listStyle(.inset)
        .fontDesign(.rounded)
        .toolbar {
            ToolbarItemGroup(placement: .topBarTrailing) {
                Button {
                    
                } label: {
                    Image(systemName: "timer")
                }
                .buttonStyle(BorderedProminentButtonStyle())
                .tint(.secondary)
                Button("Finish") {
                    workout.finishDate = Date()
                    VM.currentWorkout = nil
                    print("Finished workout: \(workout.name) at \(workout.finishDate!)")
                    dismiss()
                }
                .buttonStyle(BorderedProminentButtonStyle())
                .tint(.primary)
            }
        }
    }
}

#Preview {
    @Previewable @State var VM = ContentView.ViewModel()
    let workoutConfig = ModelConfiguration(for: Workout.self, isStoredInMemoryOnly: true)
    let exerciseConfig = ModelConfiguration(for: Exercise.self, isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Workout.self, Exercise.self, configurations: workoutConfig, exerciseConfig)
    
    for exercise in DEFAULT_EXERCISES {
        container.mainContext.insert(exercise)
    }

    return NavigationStack {
        WorkoutView(workout: Workout())
    }
    .modelContainer(container)
    .environment(VM)
}
