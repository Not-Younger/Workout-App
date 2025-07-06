//
//  AddSetButtonLabelView.swift
//  Workout App
//
//  Created by Jonathan Young on 7/6/25.
//

import SwiftUI

struct AddSetButtonLabelView: View {
    @Environment(\.colorScheme) private var colorScheme
    let fontSize: CGFloat
    let rowHeight: CGFloat
    
    var body: some View {
        Text("+ Add Set")
            .font(.system(size: fontSize))
            .frame(maxWidth: .infinity)
            .frame(height: rowHeight)
            .background(colorScheme == .dark ? Color(.systemGray4) : Color(.systemGray5))
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    Button {
        
    } label: {
        AddSetButtonLabelView(fontSize: 16, rowHeight: 25)
    }
    .buttonStyle(PlainButtonStyle())
}
