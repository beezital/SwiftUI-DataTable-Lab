//
//  ContentView.swift
//  DataTable
//
//  Created by Fred on 24.01.23.
//

import SwiftUI
import CoreData

struct ContentView: View {

    @EnvironmentObject var navigationState: NavigationState

    var body: some View {
        NavigationView {
            ScrollView {
                
                VStack(spacing: 20) {
                    NavigationLink("Table") {
//                        NavigationStepView()
                        TableView()
                    }
                    NavigationLink("About") {
                        AboutView()
                    }
                }
                
//                VStack {
//                    // Section like
//                    VStack(alignment: .leading) {
//                        NavigationItemView(
//                            selection: .table,
//                            destination: NavigationStepView(),
//                            isActive: $navigationState.isSelectionTable,
//                            title: "Table",
//                            systemImage: "tablecells"
//                        )
//
//                        NavigationItemView(
//                            selection: .about,
//                            destination: AboutView(),
//                            isActive: $navigationState.isSelectionAbout,
//                            title: "About",
//                            systemImage: "questionmark.bubble.fill")
//
//                    }
//                    .padding(.vertical, 10)
//                }
//                .padding(.horizontal)
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
