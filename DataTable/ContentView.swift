//
//  ContentView.swift
//  DataTable
//
//  Created by Fred on 24.01.23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    private let V_PADDING: Double = 12
    private let ICON_SIZE: Double = 25

    @EnvironmentObject var navigationState: NavigationState

    var body: some View {
        NavigationView {
            ScrollView {
                
//                VStack(spacing: 20) {
//                    NavigationLink("Table") {
////                        NavigationStepView()
//                        TableView()
//                    }
//                    NavigationLink("About") {
//                        AboutView()
//                    }
//                }
                
                
                
                
//                VStack {
//                    NavigationLink(destination: TableView(), isActive: $navigationState.isSelectionTable) { EmptyView() }
//                    Button {
//                        navigationState.select(.table)
//                    } label: {
//                        HStack(spacing: 10) {
//                            Image(systemName: "tablecells")
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .frame(maxWidth: ICON_SIZE, maxHeight: ICON_SIZE, alignment: .center)
//                                .foregroundColor(navigationState.selection == .table ? .white : Color.accentColor)
//                            Text("Table")
//                                .font(.title3)
//                                .foregroundColor(navigationState.selection == .table ? .white : Color(UIColor.label))
//                        }
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .contentShape(Rectangle())
//                    }
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .padding(V_PADDING)
//                    .background(navigationState.selection == .table ? Color.accentColor : .clear)
//                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: V_PADDING, height: V_PADDING)))
//
//
//                    NavigationLink(destination: AboutView(), isActive: $navigationState.isSelectionAbout) { EmptyView() }
//                    Button {
//                        navigationState.select(.about)
//                    } label: {
//                        HStack(spacing: 10) {
//                            Image(systemName: "questionmark.bubble.fill")
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .frame(maxWidth: ICON_SIZE, maxHeight: ICON_SIZE, alignment: .center)
//                                .foregroundColor(navigationState.selection == .about ? .white : Color.accentColor)
//                            Text("About")
//                                .font(.title3)
//                                .foregroundColor(navigationState.selection == .about ? .white : Color(UIColor.label))
//                        }
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .contentShape(Rectangle())
//                    }
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .padding(V_PADDING)
//                    .background(navigationState.selection == .about ? Color.accentColor : .clear)
//                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: V_PADDING, height: V_PADDING)))
//
//                }
//                .padding(.horizontal)
                
                
                
                VStack {
                    // Section like
                    VStack(alignment: .leading) {
                        NavigationItemView(
                            selection: .table,
                            destination: {
                                TableView()
                            },
                            isActive: $navigationState.isSelectionTable,
                            title: "Table",
                            systemImage: "tablecells"
                        )

                        NavigationItemView(
                            selection: .about,
                            destination: {
                                AboutView()
                            },
                            isActive: $navigationState.isSelectionAbout,
                            title: "About",
                            systemImage: "questionmark.bubble.fill")

                    }
                    .padding(.vertical, 10)
                }
                .padding(.horizontal)
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
