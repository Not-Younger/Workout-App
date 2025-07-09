//
//  ExerciseDetailHistoryView.swift
//  Workout App
//
//  Created by Jonathan Young on 7/6/25.
//

import SwiftData
import SwiftUI

struct ExerciseDetailHistoryView: View {
    @Environment(NavigationPaths.self) private var navigationPaths: NavigationPaths
    
    let exercise: Exercise

    @Query(sort: [SortDescriptor(\Workout.date, order: .reverse)]) private var allWorkouts: [Workout]

    var filteredWorkouts: [Workout] {
        allWorkouts.filter { workout in
            workout.workoutExercises.contains(where: { $0.exercise == exercise })
        }
    }

    var body: some View {
        if filteredWorkouts.isEmpty {
            ContentUnavailableView("No Exercise History", systemImage: "clock.arrow.trianglehead.counterclockwise.rotate.90", description: Text("When you log a workout with this exercise, your history will appear here."))
        } else {
            ScrollView {
                LazyVStack(spacing: 25) {
                    ForEach(filteredWorkouts) { workout in
                        Button {
                            navigationPaths.exercisePath.append(workout)
                        } label: {
                            HistoryWorkoutExerciseCardView(workout: workout, exercise: exercise)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.horizontal)
                    }
                }
                .safeAreaPadding(.vertical)
            }
        }
    }
}
