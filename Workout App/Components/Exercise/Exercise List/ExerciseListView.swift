//
//  ExerciseListView.swift
//  Workout App
//
//  Created by Jonathan Young on 6/26/25.
//

import SwiftUI
import SwiftData

struct ExerciseListView: View {
    @Query private var exercises: [Exercise]
    let searchString: String

    private let alphabet = (65...90).map { String(UnicodeScalar($0)) }

    var body: some View {
        let matchingExercises = exercises.filter { exercise in
            if searchString.isEmpty {
                return true
            } else {
                return exercise.name.localizedStandardContains(searchString)
                || exercise.muscleType.rawValue.localizedStandardContains(searchString)
                || exercise.equipmentType.rawValue.localizedStandardContains(searchString)
            }
        }
        
        AlphabetScrollView(
            collectionDisplayMode: CollectionDisplayMode.asList,
            collection:  matchingExercises,
            sectionHeaderFont: .headline.bold(),
            sectionHeaderForegroundColor: .primary,
            resultAnchor: .top) { exercise in
               ExerciseRowView(exercise: exercise)
        }
        .listStyle(.plain)
        .scrollIndicators(.hidden)
        .navigationDestination(for: Exercise.self) { exercise in
            ExerciseDetailView(exercise: exercise)
        }
    }
}


#Preview {
    ExerciseListView(searchString: "")
}
