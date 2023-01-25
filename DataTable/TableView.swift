//
//  TableView.swift
//  DataTable
//
//  Created by Fred on 24.01.23.
//

import SwiftUI

struct TableView: View {
    
    @Environment(\.managedObjectContext) private var viewContext

    @State var searchText: String = ""


    var body: some View {
        FilteredTableView(searchText: searchText)
            .searchable(text: $searchText)
        .toolbar {
            ToolbarItem {
                Button(action: addItem) {
                    Label("Add Item", systemImage: "plus")
                }
            }
            ToolbarItem {
                EditButton()
            }
        }
        .navigationTitle("Items")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    
    private func search() {
        
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }


}



//
//struct TableView_Previews: PreviewProvider {
//    static var previews: some View {
//        TableView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}



