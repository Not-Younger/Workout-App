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

    private var groupedWorkouts: [(key: String, value: [Workout])] {
        let workouts = allWorkouts.filter { workout in
            workout.workoutExercises.contains(where: { $0.exercise == exercise })
        }

        let formatter = DateFormatter()
        formatter.dateFormat = "LLLL yyyy" // Example: July 2025

        let grouped = Dictionary(grouping: workouts) { workout in
            formatter.string(from: workout.date).uppercased()
        }

        return grouped
            .sorted { lhs, rhs in
                // Convert back to Date for sorting descending
                guard
                    let lhsDate = formatter.date(from: lhs.key),
                    let rhsDate = formatter.date(from: rhs.key)
                else { return false }
                return lhsDate > rhsDate
            }
    }

    var body: some View {
        if groupedWorkouts.isEmpty {
            ContentUnavailableView(
                "No Exercise History",
                systemImage: "clock.arrow.trianglehead.counterclockwise.rotate.90",
                description: Text("When you log a workout with this exercise, your history will appear here.")
            )
        } else {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 25) {
                    ForEach(groupedWorkouts, id: \.key) { (month, workouts) in
                        Section {
                            ForEach(workouts) { workout in
                                Button {
                                    navigationPaths.exercisePath.append(workout)
                                } label: {
                                    HistoryWorkoutExerciseCardView(workout: workout, exercise: exercise)
                                }
                                .buttonStyle(PlainButtonStyle())
                                .padding(.horizontal)
                            }
                        } header: {
                            Text(month)
                                .font(.system(size: 14))
                                .foregroundStyle(.secondary)
                                .padding(.horizontal)
                                .padding(.top)
                        }
                    }
                }
                .safeAreaPadding(.vertical)
            }
        }
    }
}

