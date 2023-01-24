//
//  SheetView.swift
//  DataTable
//
//  Created by Fred on 24.01.23.
//

import SwiftUI

struct NavigationInSheetView: View {

    @Environment(\.dismiss) var dismiss

    @ObservedObject var item: Item

    var body: some View {
        NavigationView {
            VStack {
                Text("Sheet hosting its own NavigationView")
                    .font(.title2)
                Spacer()
                VStack {
                    Text(item.title ?? "")
                    Text("\(item.timestamp!, formatter: itemFormatter)")
                }
                .padding()
                NavigationLink("Edit") {
                    EditView(item: item)
                }
                .padding()
                Spacer()
            }
            .navigationBarTitle(Text("Details in Sheet"), displayMode: .inline)
            .toolbar() {
                ToolbarItem {
                    Button("Close") {
                        dismiss()
                    }
                }
            }
        }
    }
}

//struct SheetView_Previews: PreviewProvider {
//    static var previews: some View {
//        SheetView()
//    }
//}
