//
//  AppleMusicBottomSheetSwiftUIApp.swift
//  AppleMusicBottomSheetSwiftUI
//
//  Created by Yunus Emre Taşdemir on 27.04.2023.
//

import SwiftUI

@main
struct AppleMusicBottomSheetSwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                //.environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
