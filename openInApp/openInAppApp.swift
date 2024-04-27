//
//  openInAppApp.swift
//  openInApp
//
//  Created by hemanth on 4/27/24.
//

import SwiftUI

@main
struct openInAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
