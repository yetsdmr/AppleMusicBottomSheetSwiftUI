//
//  HomeView.swift
//  AppleMusicBottomSheetSwiftUI
//
//  Created by Yunus Emre Taşdemir on 15.06.2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        // Tab View
        TabView {
            // Sample Tab's
            SampleTabView("Listen Now", "play.circle.fill")
            SampleTabView("Browse", "square.grid.2x2.fill")
            SampleTabView("Radio", "dot.radiowaves.left.and.right")
            SampleTabView("Music", "play.square.stack")
            SampleTabView("Search", "magnifyingglass")
        }
        // Changing Tab Indicator Color
        .tint(.red)
        .safeAreaInset(edge: .bottom) {
            
        }
    }
    
    @ViewBuilder
    func SampleTabView(_ title: String, _ icon: String) -> some View {
        Text(title)
            .tabItem {
                Image(systemName: icon)
                Text(title)
            }
            // Changing Tab Background Color
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarBackground(.ultraThickMaterial, for: .tabBar)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        //HomeView()
    }
}
