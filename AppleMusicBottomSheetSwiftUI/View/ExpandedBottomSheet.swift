//
//  ExpandedBottomSheet.swift
//  AppleMusicBottomSheetSwiftUI
//
//  Created by Yunus Emre Taşdemir on 16.06.2023.
//

import SwiftUI

struct ExpandedBottomSheet: View {
    @Binding var expandSheet: Bool
    var animation: Namespace.ID
    // View Properties
    @State private var animationContent: Bool = false
    var body: some View {
        GeometryReader {
            let size = $0.size
            let safeArea = $0.safeAreaInsets
            
            ZStack {
                Rectangle()
                    .fill(.ultraThickMaterial)
                    .overlay(content: {
                        Rectangle()
                            .fill(Color("BG"))
                            .opacity(animationContent ? 0 : 1)
                    })
                    .overlay(alignment: .top) {
                        MusicInfo(expandSheet: $expandSheet, animation: animation)
                        // Disabling Interaction (Since It's not Necessary Here)
                            .allowsHitTesting(false)
                            .opacity(animationContent ? 0 : 1)
                    }
                    .matchedGeometryEffect(id: "BGVIEW", in: animation)
                
                VStack(spacing: 15) {
                    // Grap Indicator
                    Capsule()
                        .fill(.gray)
                        .frame(width: 40, height: 5)
                        .opacity(animationContent ? 1 : 0)
                    
                    // Artwork Hero View
                    GeometryReader {
                        let size = $0.size
                        
                        Image("Artwork")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: size.width, height: size.height)
                            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                        
                    }
                    .matchedGeometryEffect(id: "ARTWORK", in: animation)
                    // For Square Artwork Image
                    .frame(height: size.width - 50)
                }
                .padding(.top, safeArea.top + (safeArea.bottom == 0 ? 10 : 0))
                .padding(.bottom, safeArea.bottom == 0 ? 10 : safeArea.bottom)
                .padding(.horizontal, 25)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                // For Testing UI
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        expandSheet = false
                        animationContent = false
                    }
                }
            
            }
            .ignoresSafeArea(.container, edges: .all)
        }
        .onAppear {
            withAnimation(.easeOut(duration: 0.35)) {
                animationContent = true
            }
        }
    }
}

struct ExpandedBottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        //ExpandedBottomSheet()
    }
}
