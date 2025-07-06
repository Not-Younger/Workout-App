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
    let supersetColor: Color?
    
    init(fontSize: CGFloat, rowHeight: CGFloat, supersetColor: Color? = nil) {
        self.fontSize = fontSize
        self.rowHeight = rowHeight
        self.supersetColor = supersetColor
    }
    
    var body: some View {
        HStack {
            ZStack {
                Rectangle()
                    .frame(width: 3)
                    .foregroundStyle(supersetColor ?? Color.clear)
                    .padding(.bottom, 10)
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: 3)
                    .foregroundStyle(supersetColor ?? Color.clear)
                    .padding(.bottom, 5)
            }
            Text("+ Add Set")
                .font(.system(size: fontSize))
                .frame(maxWidth: .infinity)
                .frame(height: rowHeight)
                .background(colorScheme == .dark ? Color(.systemGray5) : Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 8))
            Rectangle()
                .frame(width: 3)
                .foregroundStyle(Color.clear)
        }
    }
}

#Preview {
    Button {
        
    } label: {
        AddSetButtonLabelView(fontSize: 16, rowHeight: 25)
    }
    .buttonStyle(PlainButtonStyle())
}
