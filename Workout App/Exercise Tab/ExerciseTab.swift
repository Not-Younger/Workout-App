//
//  WorkoutTab.swift
//  Workout App
//
//  Created by Jonathan Young on 6/28/25.
//

import SwiftUI

struct ExerciseTab: View {
    @Environment(ContentView.ViewModel.self) private var VM: ContentView.ViewModel
    
    @State private var searchString: String = ""
    @State private var isSearchFocused: Bool = false
    
    var body: some View {
        @Bindable var VM = VM
        VStack {
            ExerciseFilterView(equipmentType: $VM.equipmentType, muscleType: $VM.muscleType, sortType: $VM.sortType)
                .padding(.horizontal)
            ExerciseListView(searchString: searchString, equipmentType: VM.equipmentType, muscleType: VM.muscleType, sortType: VM.sortType)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.secondarySystemBackground))
        .searchable(text: $searchString, isPresented: $isSearchFocused, prompt: "Find an exercise...")
    }
}

#Preview {
    @Previewable @State var VM = ContentView.ViewModel()
    return NavigationStack {
        ExerciseTab()
    }
    .environment(VM)
}
