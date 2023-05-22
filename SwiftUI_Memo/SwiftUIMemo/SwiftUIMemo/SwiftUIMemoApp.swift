//
//  SwiftUIMemoApp.swift
//  SwiftUIMemo
//
//  Created by USER on 2023/05/22.
//

import SwiftUI

@main
struct SwiftUIMemoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
