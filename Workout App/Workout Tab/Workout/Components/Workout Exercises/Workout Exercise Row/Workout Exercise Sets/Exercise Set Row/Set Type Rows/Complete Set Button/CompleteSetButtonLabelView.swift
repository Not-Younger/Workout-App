//
//  CompleteSetButtonView.swift
//  Workout App
//
//  Created by Jonathan Young on 7/5/25.
//

import SwiftUI

struct CompleteSetButtonLabelView: View {
    @Environment(\.colorScheme) private var colorScheme
    
    let isComplete: Bool
    let rowHeight: CGFloat
    let fontSize: CGFloat
    
    var body: some View {
        Image(systemName: "checkmark")
            .font(.system(size: fontSize))
            .frame(width: rowHeight, height: rowHeight)
            .foregroundStyle(getForegroundColor())
            .background(getBackgroundColor())
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
    
    func getBackgroundColor() -> Color {
        if isComplete { return Color.green }
        return colorScheme == .dark ? Color(.systemGray5) : Color(.systemGray6)
    }
    
    func getForegroundColor() -> Color {
        if isComplete { return Color.white }
        return Color.primary
    }
}

#Preview {
    @Previewable @State var isComplete: Bool = false
    
    Button {
        isComplete.toggle()
    } label: {
        CompleteSetButtonLabelView(isComplete: isComplete, rowHeight: 25, fontSize: 16)
    }
    .buttonStyle(PlainButtonStyle())
}
