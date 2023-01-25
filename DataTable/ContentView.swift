//
//  ContentView.swift
//  DataTable
//
//  Created by Fred on 24.01.23.
//

import SwiftUI
import CoreData

struct ContentView: View {

    var body: some View {
        NavigationView {
            List {
                NavigationLink("Table") {
                    TableView()
                }
                NavigationLink("About") {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Demonstrate CoreData, NavigationView and Sheets")
                        Text("also a custom made simple table with sortable columns")
                    }
                    .navigationTitle("About")
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
            .navigationTitle("DataTable App")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
