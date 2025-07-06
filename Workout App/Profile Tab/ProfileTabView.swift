//
//  ProfileTabView.swift
//  Workout App
//
//  Created by Jonathan Young on 7/6/25.
//

import SwiftUI

struct ProfileTabView: View {
    @State private var isShowingSettingsView: Bool = false
    @State private var isShowingMeasurementsView: Bool = false
    
    var body: some View {
        ScrollView {
            Text("Jonathan Young")
        }
        .navigationTitle("Profile")
        .toolbar {
            ToolbarItemGroup(placement: .topBarLeading) {
                Button {
                    isShowingSettingsView = true
                } label: {
                    Image(systemName: "gearshape.fill")
                }
                .sheet(isPresented: $isShowingSettingsView) {
                    SettingsView()
                }
                Button {
                    isShowingMeasurementsView = true
                } label: {
                    Image(systemName: "ruler.fill")
                        .rotationEffect(.degrees(90))
                }
                .sheet(isPresented: $isShowingMeasurementsView) {
                    MeasurementsView()
                }
            }
        }
    }
}

#Preview {
    ProfileTabView()
}
