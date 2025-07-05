//
//  SetTypeInfoSetIconView.swift
//  Workout App
//
//  Created by Jonathan Young on 7/2/25.
//

import SwiftUI

struct SetTypeIconView: View {
    @Environment(\.colorScheme) private var colorScheme
    let order: Int
    let setType: SetType
    let size: CGFloat
    
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
        .font(.subheadline)
        .frame(width: size, height: size)
        .background(getBackgroundColor())
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
    
    func getBackgroundColor() -> Color {
        switch  setType {
        case .warmup:
            return .orange.opacity(0.2)
        case .normal:
            return colorScheme == .dark ? Color(.systemGray4).opacity(0.2) : Color(.systemGray5).opacity(0.2)
        case .dropSet:
            return .purple.opacity(0.2)
        case .failure:
            return .red.opacity(0.2)
        }
    }
}

#Preview {
    SetTypeIconView(order: 1, setType: .normal, size: 25)
}
