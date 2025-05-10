//
//  LankaBusRideSwiftUIApp.swift
//  LankaBusRideSwiftUI
//
//  Created by ranCreation on 2025-05-10.
//

import SwiftUI

@main
struct LankaBusRideSwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
