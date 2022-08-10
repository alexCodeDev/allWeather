//
//  weatherApp2App.swift
//  weatherApp2
//
//  Created by Aleksandr on 10/08/22.
//

import SwiftUI

@main
struct weatherApp2App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
