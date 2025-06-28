//
//  EquipmentIconView.swift
//  Workout App
//
//  Created by Jonathan Young on 6/27/25.
//

import SwiftUI

struct EquipmentIconView: View {
    let equipmentType: EquipmentType?
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .foregroundStyle(Color(.systemGray5))
            Image(systemName: "dumbbell.fill")
                .resizable()
                .scaledToFit()
                .padding(10)
            // Add image later
            
        }
        .frame(width: 50, height: 50)
    }
}

#Preview {
    EquipmentIconView(equipmentType: .barbell)
}
