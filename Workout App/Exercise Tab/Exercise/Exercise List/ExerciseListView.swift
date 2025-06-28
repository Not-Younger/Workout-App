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
    let equipmentType: EquipmentType?
    let muscleType: MuscleType?
    let sortType: ExerciseSortType

    private let alphabet = (65...90).map { String(UnicodeScalar($0)) }

    var body: some View {
        let matchingExercises = exercises.filter { exercise in
            return matchesSearchString(exercise) && matchesEquipementType(exercise) && matchesMuscleType(exercise)
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
    
    func matchesSearchString(_ exercise: Exercise) -> Bool {
        if searchString.isEmpty {
            return true
        } else {
            return exercise.name.localizedStandardContains(searchString)
            || exercise.muscleType.rawValue.localizedStandardContains(searchString)
            || exercise.equipmentType.rawValue.localizedStandardContains(searchString)
            || matchesSecondaryMuscleTypeSearchString(exercise)
        }
    }
    
    func matchesSecondaryMuscleTypeSearchString(_ exercise: Exercise) -> Bool {
        for muscleType in exercise.secondaryMuscleTypes {
            if muscleType.rawValue.localizedStandardContains(searchString) {
                return true
            }
        }
        return false
    }
    
    func matchesEquipementType(_ exercise: Exercise) -> Bool {
        guard equipmentType != nil else {
            return true
        }
        return exercise.equipmentType == equipmentType
    }
    
    func matchesMuscleType(_ exercise: Exercise) -> Bool {
        guard muscleType != nil else {
            return true
        }
        return exercise.muscleType == muscleType
    }
}


#Preview {
    ExerciseListView(searchString: "", equipmentType: nil, muscleType: nil, sortType: .nameAscending)
}
