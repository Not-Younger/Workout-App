//
//  ExerciseFilterView.swift
//  Workout App
//
//  Created by Jonathan Young on 6/27/25.
//

import SwiftUI

struct ExerciseFilterView: View {
    @Environment(\.colorScheme) private var colorScheme
    @Binding var equipmentType: EquipmentType?
    @Binding var muscleType: MuscleType?
    @Binding var sortType: ExerciseSortType
    
    @State private var isShowingEquipmentFilter: Bool = false
    @State private var isShowingMuscleFilter: Bool = false
    
    var body: some View {
        HStack(spacing: 10) {
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
            .tint(getEquipmentLabelBackgroundColor(equipmentType))
            .foregroundStyle(getEquipmentLabelFontColor(equipmentType))
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
            .tint(getMuscleLabelBackgroundColor(muscleType))
            .foregroundStyle(getMuscleLabelFontColor(muscleType))
            .sheet(isPresented: $isShowingMuscleFilter) {
                MuscleTypeFilterView(muscleType: $muscleType)
            }
            Menu {
                Button {
                    if sortType == .nameAscending {
                        sortType = .nameDescending
                    } else {
                        sortType = .nameAscending
                    }
                } label: {
                    Label("Name", systemImage: sortType == .nameAscending ? "arrow.down" : "arrow.up")
                }
                Button {
                    if sortType == .frequencyAscending {
                        sortType = .frequencyDescending
                    } else {
                        sortType = .frequencyAscending
                    }
                } label: {
                    Label("Frequency", systemImage: sortType == .frequencyAscending ? "arrow.down" : "arrow.up")
                }
                Button {
                    if sortType == .lastPerformedAscending {
                        sortType = .lastPerformedDescending
                    } else {
                        sortType = .lastPerformedAscending
                    }
                } label: {
                    Label("Last Performed", systemImage: sortType == .lastPerformedAscending ? "arrow.down" : "arrow.up")
                }
            } label: {
                Image(systemName: "arrow.up.arrow.down")
                    .font(.subheadline)
                    .frame(maxHeight: .infinity)
            }
            .menuStyle(.automatic)
            .buttonStyle(BorderedProminentButtonStyle())
            .tint(getSortLabelBackgroundColor(sortType))
            .foregroundStyle(getSortLabelFontColor(sortType))
            
        }
        .frame(height: 40)
    }
    
    func getEquipmentLabelFontColor(_ equipmentType: EquipmentType? = nil) -> Color {
        (colorScheme == .dark) == (equipmentType == nil) ? .white : .black
    }
    
    func getEquipmentLabelBackgroundColor(_ equipmentType: EquipmentType? = nil) -> Color {
        if colorScheme == .dark {
            if equipmentType != nil {
                return .white
            } else {
                return Color(.systemGray4)
            }
        } else {
            if equipmentType != nil {
                return .black
            } else {
                return Color(.systemGray5)
            }
        }
    }
    
    func getMuscleLabelFontColor(_ muscleType: MuscleType? = nil) -> Color {
        (colorScheme == .dark) == (muscleType == nil) ? .white : .black
    }
    func getMuscleLabelBackgroundColor(_ muscleType: MuscleType? = nil) -> Color {
        if colorScheme == .dark {
            if muscleType != nil {
                return .white
            } else {
                return Color(.systemGray4)
            }
        } else {
            if muscleType != nil {
                return .black
            } else {
                return Color(.systemGray5)
            }
        }
    }
    
    func getSortLabelFontColor(_ sortType: ExerciseSortType) -> Color {
        (colorScheme == .dark) == (sortType == .nameAscending) ? .white : .black
    }
    func getSortLabelBackgroundColor(_ sortType: ExerciseSortType? = nil) -> Color {
        if colorScheme == .dark {
            if sortType != .nameAscending {
                return .white
            } else {
                return Color(.systemGray4)
            }
        } else {
            if sortType != .nameAscending {
                return .black
            } else {
                return Color(.systemGray5)
            }
        }
    }
}

#Preview {
    @Previewable @State var equipmentType: EquipmentType?
    @Previewable @State var muscleType: MuscleType?
    @Previewable @State var sortType: ExerciseSortType = .nameAscending
    ExerciseFilterView(equipmentType: $equipmentType, muscleType: $muscleType, sortType: $sortType)
}
