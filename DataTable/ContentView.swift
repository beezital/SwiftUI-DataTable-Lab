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
//                    TableView()
                    NavigationStepView()
                }
                NavigationLink("About") {
                    AboutView()
                }
            }
            .navigationTitle("DataTable App")

//            TableView()
//            NavigationStepView()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
