//
//  apiTestApp.swift
//  apiTest
//
//  Created by HoHocompany on 2023/02/02.
//

import SwiftUI

@main
struct apiTestApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
