//
//  SetTypeInfoSetIconView.swift
//  Workout App
//
//  Created by Jonathan Young on 7/2/25.
//

import SwiftUI

struct SetTypeIconView: View {
    @Environment(\.colorScheme) private var colorScheme
    let isCompleted: Bool
    let order: Int
    let setType: SetType
    let fontSize: CGFloat
    let size: CGFloat
    
    init(isCompleted: Bool = false, order: Int, setType: SetType, fontSize: CGFloat, size: CGFloat) {
        self.isCompleted = isCompleted
        self.order = order
        self.setType = setType
        self.fontSize = fontSize
        self.size = size
    }
    
    var body: some View {
        Group {
            switch setType {
            case .warmup:
                Text("W")
                    .foregroundStyle(.orange)
            case .normal:
                Text("\(order + 1)")
                    .foregroundStyle(.primary)
            case .dropSet:
                Text("D")
                    .foregroundStyle(.purple)
            case .failure:
                Text("F")
                    .foregroundStyle(.red)
            }
        }
        .font(.system(size: fontSize, weight: .semibold))
        .frame(width: size, height: size)
        .background(getBackgroundColor())
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
    
    func getBackgroundColor() -> Color {
        if isCompleted { return .clear }
        switch  setType {
        case .warmup:
            return .orange.opacity(0.4)
        case .normal:
            return colorScheme == .dark ? Color(.systemGray5) : Color(.systemGray6)
        case .dropSet:
            return .purple.opacity(0.4)
        case .failure:
            return .red.opacity(0.4)
        }
    }
}

#Preview {
    SetTypeIconView(order: 1, setType: .normal, fontSize: 16, size: 25)
}
