//
//  EquipmentTypeFilterRowView.swift
//  Workout App
//
//  Created by Jonathan Young on 6/27/25.
//

import SwiftUI

struct EquipmentTypeFilterRowView: View {
    let equipmentType: EquipmentType?
    let isSelected: Bool
    
    init(equipmentType: EquipmentType?, isSelected: Bool = false) {
        self.equipmentType = equipmentType
        self.isSelected = isSelected
    }
    
    var body: some View {
        HStack {
            EquipmentIconView(equipmentType: equipmentType)
            Text(equipmentType?.rawValue ?? "All Equipment")
                .bold()
                .fontDesign(.rounded)
            Spacer()
            if isSelected {
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.green)
            }
        }
        .contentShape(Rectangle())
    }
}

#Preview {
    EquipmentTypeFilterRowView(equipmentType: .barbell, isSelected: true)
}
