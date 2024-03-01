//
//  waterApp.swift
//  water
//
//  Created by Pedro Prado on 01/03/24.
//

import SwiftUI

@main
struct waterApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
