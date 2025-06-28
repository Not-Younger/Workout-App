//
//  EquipmentTypeFilterView.swift
//  Workout App
//
//  Created by Jonathan Young on 6/27/25.
//

import SwiftUI

struct EquipmentTypeFilterView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var equipmentType: EquipmentType?
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 8)
                .frame(width: 50, height: 5)
                .padding(.vertical, 8)
            Text("Equipment")
                .bold()
                .padding(.bottom)
            List {
                Button {
                    equipmentType = nil
                    dismiss()
                } label: {
                    EquipmentTypeFilterRowView(equipmentType: nil, isSelected: equipmentType == nil)
                }
                .buttonStyle(PlainButtonStyle())
                ForEach(EquipmentType.allCases, id: \.self) { type in
                    Button {
                        equipmentType = type
                        dismiss()
                    } label: {
                        EquipmentTypeFilterRowView(equipmentType: type, isSelected: equipmentType == type)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .listStyle(.inset)
        }
        .navigationTitle("Equipment")
        .fontDesign(.rounded)
    }
}

#Preview {
    @Previewable @State var equipmentType: EquipmentType? = .barbell
    EquipmentTypeFilterView(equipmentType: $equipmentType)
}
