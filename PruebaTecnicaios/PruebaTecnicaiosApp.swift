//
//  PruebaTecnicaiosApp.swift
//  PruebaTecnicaios
//
//  Created by Hazel Alain on 11/07/24.
//

import SwiftUI

@main
struct PruebaTecnicaiosApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
