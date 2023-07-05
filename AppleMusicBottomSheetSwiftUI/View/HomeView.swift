//
//  HomeView.swift
//  AppleMusicBottomSheetSwiftUI
//
//  Created by Yunus Emre Taşdemir on 15.06.2023.
//

import SwiftUI

struct HomeView: View {
    // Animation Properties
    @State private var expandSheet: Bool = false
    @Namespace private var animation
    var body: some View {
        // Tab View
        TabView {
            // Sample Tab's
            ListenNow()
                .tabItem {
                    Image(systemName: "play.circle.fill")
                    Text("Listen Now")
                }
                // Changing Tab Background Color
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(.ultraThickMaterial,for: .tabBar)
                // Hiding Tab Bar When Sheet is Expanded
                .toolbar(expandSheet ? .hidden : .visible, for: .tabBar)
            SampleTabView("Browse", "square.grid.2x2.fill")
            SampleTabView("Radio", "dot.radiowaves.left.and.right")
            SampleTabView("Music", "play.square.stack")
            SampleTabView("Search", "magnifyingglass")
        }
        // Changing Tab Indicator Color
        .tint(.red)
        .safeAreaInset(edge: .bottom) {
            CustomBottomSheet()
        }
        .overlay {
            if expandSheet {
                ExpandedBottomSheet(expandSheet: $expandSheet, animation: animation)
                // Transtion for more fluent Animation
                    .transition(.asymmetric(insertion: .identity, removal: .offset(y: -5)))
            }
        }
    }
    
    // Custom Listen Now View
    @ViewBuilder
    func ListenNow() -> some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    Image("Card 1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    Image("Card 2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .padding()
            }
            .navigationTitle("Listen Now")
        }
    }
    
    // Custom Bottom Sheet
    @ViewBuilder
    func CustomBottomSheet() -> some View {
        // Animating Sheet Background (To Look Like It's Expanding From the Bottom)
        ZStack {
            if expandSheet {
                Rectangle()
                    .fill(.clear)
            } else {
                Rectangle()
                    .fill(.ultraThickMaterial)
                    .overlay {
                        // Music Info
                        MusicInfo(expandSheet: $expandSheet, animation: animation)
                    }
                    .matchedGeometryEffect(id: "BGVİEW", in: animation)
            }
            
        }
        .frame(height: 70)
        // Separator Line
        .overlay(alignment: .bottom, content: {
            Rectangle()
                .fill(.gray.opacity(0.3))
                .frame(height: 1)
                .offset(y: -5)
        })
        // 49: Default Tab Bar Height
        .offset(y: -49)
    }
    
    @ViewBuilder
    func SampleTabView(_ title: String, _ icon: String) -> some View {
        //iOS Bug, It can be Avoided by wrapping the view inside ScrollView
        ScrollView(.vertical, showsIndicators: false, content: {
            Text(title)
                .padding(.top, 25)
        })
            .tabItem {
                Image(systemName: icon)
                Text(title)
            }
            // Changing Tab Background Color
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarBackground(.ultraThickMaterial, for: .tabBar)
            // Hiding Tab Bar When Sheet is Expanded
            .toolbar(expandSheet ? .hidden : .visible, for: .tabBar)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        //HomeView()
    }
}

// Resuable File
struct MusicInfo: View {
    @Binding var expandSheet: Bool
    var animation: Namespace.ID
    var body: some View {
        HStack(spacing: 0) {
            // Adding Matched Geometry Effect (Hero Animation)
            ZStack {
                if !expandSheet {
                    GeometryReader {
                        let size = $0.size
                        
                        Image("Artwork")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: size.width, height: size.height)
                            .clipShape(RoundedRectangle(cornerRadius: expandSheet ? 15 : 5, style: .continuous))
                    }
                    .matchedGeometryEffect(id: "ARTWORK", in: animation)
                }
            }
            .frame(width: 45, height: 45)
            
            Text("Look What You Made Me do")
                .fontWeight(.semibold)
                .lineLimit(1)
                .padding(.horizontal, 15)
            
            Spacer(minLength: 0)
            
            Button {
                
            } label: {
                Image(systemName: "pause.fill")
                    .font(.title2)
            }
            
            Button {
                
            } label: {
                Image(systemName: "forward.fill")
                    .font(.title2)
            }
            .padding(.leading, 25)

        }
        .foregroundColor(.primary)
        .padding(.horizontal)
        .padding(.bottom, 5)
        .frame(height: 70)
        .containerShape(Rectangle())
        .onTapGesture {
            // Expanding Bottom Sheet
            withAnimation(.easeIn(duration: 0.3)) {
                expandSheet = true
            }
        }
    }
}
