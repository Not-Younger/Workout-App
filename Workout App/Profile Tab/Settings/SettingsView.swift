//
//  SettingsView.swift
//  Workout App
//
//  Created by Jonathan Young on 7/6/25.
//

import SwiftUI

struct SettingsView: View {
    @State private var fontSize: CGFloat
    
    init() {
        self.fontSize = {
            if UserDefaults.standard.object(forKey: "fontSize") == nil {
                return 16
            }
            return CGFloat(UserDefaults.standard.integer(forKey: "fontSize"))
        }()
    }
    
    var body: some View {
        Form {
            Section("Font Size") {
                VStack(alignment: .leading) {
                    Slider(value: $fontSize, in: 12...18, step: 1) {
                        Text("Font Size: \(Int(fontSize))")
                    }
                    .padding(.horizontal, 10)
                    .onChange(of: fontSize) { _, newValue in
                        UserDefaults.standard.set(Int(newValue), forKey: "fontSize")
                    }
                    
                    // Simulated tick marks
                    HStack {
                        ForEach(12...18, id: \.self) { value in
                            Text("\(value)")
                                .font(.caption2)
                                .frame(maxWidth: .infinity)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}
