//
//  WorkoutTab.swift
//  Workout App
//
//  Created by Jonathan Young on 6/28/25.
//

import SwiftUI

struct ExerciseTabView: View {
    @Environment(\.colorScheme) private var colorScheme
    
    @State private var searchString: String = ""
    @State private var isSearchFocused: Bool = false
    @State private var selectedExercises: [Exercise] = []
    
    @State private var equipmentType: EquipmentType?
    @State private var muscleType: MuscleType?
    @State private var sortType: ExerciseSortType = .nameAscending
    
    var body: some View {
        VStack(spacing: 0) {
            ExerciseFilterView(searchString: $searchString, equipmentType: $equipmentType, muscleType: $muscleType, sortType: $sortType)
            ExerciseListView(selectedExercises: $selectedExercises, searchString: searchString, equipmentType: equipmentType, muscleType: muscleType, sortType: sortType)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.secondarySystemBackground))
        .background(.white)
        .navigationTitle("Exercises")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("New") {
                    
                }
                .buttonStyle(PlainButtonStyle())
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Menu {
                    Button {
                        
                    } label: {
                        Label("Show Archived", systemImage: "archivebox")
                    }
                } label: {
                    Image(systemName: "ellipsis")
                        .font(.system(size: 16))
                        .foregroundStyle(colorScheme == .dark ? .white : .black)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}

#Preview {
    return NavigationStack {
        ExerciseTabView()
    }
}
