//
//  ExerciseFilterView.swift
//  Workout App
//
//  Created by Jonathan Young on 6/27/25.
//

import SwiftUI

struct ExerciseFilterView: View {
    @Binding var equipmentType: EquipmentType?
    @Binding var muscleType: MuscleType?
    
    @State private var isShowingEquipmentFilter: Bool = false
    @State private var isShowingMuscleFilter: Bool = false
    
    var body: some View {
        HStack(spacing: 15) {
            Button {
                isShowingEquipmentFilter = true
            } label: {
                if let equipmentType {
                    FilterButtonLabel(equipmentType.rawValue)
                } else {
                    FilterButtonLabel("All Equipment")
                }
            }
            .buttonStyle(BorderedProminentButtonStyle())
            .tint(equipmentType == nil ? Color(.systemGray5) : Color.primary)
            .foregroundStyle(equipmentType == nil ? .black : .white)
            .sheet(isPresented: $isShowingEquipmentFilter) {
                EquipmentTypeFilterView(equipmentType: $equipmentType)
            }
            Button {
                isShowingMuscleFilter = true
            } label: {
                if let muscleType {
                    FilterButtonLabel(muscleType.rawValue)
                } else {
                    FilterButtonLabel("All Muscles")
                }
            }
            .buttonStyle(BorderedProminentButtonStyle())
            .tint(muscleType == nil ? Color(.systemGray5) : Color.primary)
            .foregroundStyle(muscleType == nil ? .black : .white)
            .sheet(isPresented: $isShowingMuscleFilter) {
                MuscleTypeFilterView(muscleType: $muscleType)
            }
            if equipmentType != nil || muscleType != nil {
                Button {
                    withAnimation {
                        equipmentType = nil
                        muscleType = nil
                    }
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 20)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}

#Preview {
    @Previewable @State var equipmentType: EquipmentType?
    @Previewable @State var muscleType: MuscleType?
    ExerciseFilterView(equipmentType: $equipmentType, muscleType: $muscleType)
}
