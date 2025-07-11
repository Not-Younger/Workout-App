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
    @Binding var selectedExercises: [Exercise]
    let searchString: String
    let equipmentType: EquipmentType?
    let muscleType: MuscleType?
    let sortType: ExerciseSortType
    let selectable: Bool
    
    init(selectedExercises: Binding<[Exercise]>, searchString: String, equipmentType: EquipmentType?, muscleType: MuscleType?, sortType: ExerciseSortType, selectable: Bool = false) {
        _selectedExercises = selectedExercises
        self.searchString = searchString
        self.equipmentType = equipmentType
        self.muscleType = muscleType
        self.sortType = sortType
        self.selectable = selectable
    }

    private let alphabet = (65...90).map { String(UnicodeScalar($0)) }

    var body: some View {
        let matchingExercises = exercises.filter { exercise in
            return matchesSearchString(exercise) && matchesEquipementType(exercise) && matchesMuscleType(exercise)
        }
        
        AlphabetScrollView(
            collectionDisplayMode: CollectionDisplayMode.asList,
            collection:  matchingExercises,
            sectionHeaderFont: .system(size: 16),
            sectionHeaderForegroundColor: .secondary,
            resultAnchor: .top) { exercise in
                if selectable {
                    ExerciseRowWorkoutView(selectedExercises: $selectedExercises, exercise: exercise)
                } else {
                    ExerciseRowView(selectedExercises: $selectedExercises, exercise: exercise)
                }
        }
        .listStyle(.plain)
        .scrollIndicators(.hidden)
        .background(.background)
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
        if exercise.muscleType == muscleType {
            return true
        } else if let muscleType, exercise.secondaryMuscleTypes.contains(muscleType) {
            return true
        }
        return false
    }
}


#Preview {
    @Previewable @State var selectedExercises: [Exercise] = []
    ExerciseListView(selectedExercises: $selectedExercises, searchString: "", equipmentType: nil, muscleType: nil, sortType: .nameAscending)
}
