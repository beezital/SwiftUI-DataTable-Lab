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
    @StateObject private var navigationState = NavigationState(selection: .table)

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(navigationState)
        }
    }
}




class NavigationState: NSObject, ObservableObject {
    
    enum Selection {
        case table
        case about
    }
    
    @Published var selection: Selection
    
    @Published var isSelectionTable = false
    @Published var isSelectionAbout = false
  
    init(selection: Selection) {
        self.selection = selection
        super.init()
        select(selection)
    }

    func select(_ newSelection: Selection) {
        selection = newSelection
        switch (selection) {
        case .table:
            isSelectionTable = true
        case .about:
            isSelectionAbout = true
        }
    }
}

