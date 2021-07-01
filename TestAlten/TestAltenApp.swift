//
//  TestAltenApp.swift
//  TestAlten
//
//  Created by Jose Fumanal Quintana on 2/7/21.
//

import SwiftUI

@main
struct TestAltenApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
