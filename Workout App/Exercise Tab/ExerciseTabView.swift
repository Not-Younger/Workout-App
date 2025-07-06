//
//  WorkoutTab.swift
//  Workout App
//
//  Created by Jonathan Young on 6/28/25.
//

import SwiftUI

struct ExerciseTabView: View {
    @State private var searchString: String = ""
    @State private var isSearchFocused: Bool = false
    @State private var selectedExercises: [Exercise] = []
    
    @State private var equipmentType: EquipmentType?
    @State private var muscleType: MuscleType?
    @State private var sortType: ExerciseSortType = .nameAscending
    
    var body: some View {
        VStack {
            ExerciseFilterView(equipmentType: $equipmentType, muscleType: $muscleType, sortType: $sortType)
                .padding(.horizontal)
            ExerciseListView(selectedExercises: $selectedExercises, searchString: searchString, equipmentType: equipmentType, muscleType: muscleType, sortType: sortType)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.secondarySystemBackground))
        .searchable(text: $searchString, isPresented: $isSearchFocused, prompt: "Find an exercise...")
    }
}

#Preview {
    return NavigationStack {
        ExerciseTabView()
    }
}
