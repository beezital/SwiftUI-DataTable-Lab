//
//  EditView.swift
//  DataTable
//
//  Created by Fred on 24.01.23.
//

import SwiftUI

struct EditView: View {
    
    @Environment(\.isPresented) private var isPresented
    @Environment(\.managedObjectContext) private var viewContext

    @ObservedObject var item: Item
    
    @State private var newTitle: String = ""
    @State private var newTimestamp: Date = Date()

    var body: some View {
        Form {
            HStack {
                Text("Title")
                    .foregroundColor(.secondary)
                    .frame(maxWidth: 100, alignment: .trailing)
                ClearableTextField("Title", text: $newTitle)
            }
            HStack {
                Text("Timestamp")
                    .foregroundColor(.secondary)
                    .frame(maxWidth: 100, alignment: .trailing)
                Text("\(newTimestamp, formatter: itemFormatter)")
                Spacer()
                Button("Set to now") {
                    newTimestamp = Date()
                }
            }
        }
        .onChange(of: isPresented) { newIsPresented in
            print("EditView: onChange of isPresented to \(newIsPresented)")
            if !newIsPresented { // The view got actively dismissed (e.g. hit "back" in navigation toolbar)
                item.title = newTitle
                item.timestamp = newTimestamp
                if viewContext.hasChanges {
                    do {
                        try viewContext.save()
                    } catch {
                        print("EditView: ERROR \(error)")
                    }
                }
            }
        }
        .onAppear() {
            newTitle = item.title ?? ""
            newTimestamp = item.timestamp ?? Date()
        }
    }
}

//struct EditView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditView()
//    }
//}
