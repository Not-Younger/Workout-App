//
//  WorkoutView.swift
//  Workout App
//
//  Created by Jonathan Young on 6/28/25.
//

import SwiftData
import SwiftUI

struct WorkoutView: View {
    @Environment(\.editMode) private var editMode
    @Environment(\.dismiss) private var dismiss
    
    @Bindable var workout: Workout
    
    var body: some View {
        GeometryReader { geometry in
            List {
                WorkoutHeaderView(workout: workout)
                    .listRowInsets(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
                
                WorkoutExerciseListView(workout: workout)
                
                if editMode?.wrappedValue == .inactive {
                    WorkoutAddCancelButtonsView(workout: workout)
                        .listRowInsets(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
                }
            }
            .listStyle(.inset)
            .scrollIndicators(.hidden)
        }
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
}
