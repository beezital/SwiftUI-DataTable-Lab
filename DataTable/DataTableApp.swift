//
//  DataTableApp.swift
//  DataTable
//
//  Created by Fred on 24.01.23.
//

import SwiftUI

@main
struct DataTableApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
