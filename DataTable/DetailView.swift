//
//  DetailView.swift
//  DataTable
//
//  Created by Fred on 24.01.23.
//

import SwiftUI

struct DetailView: View {
    
    @ObservedObject var item: Item
    
    @State private var isShowingSheet = false
    
    var body: some View {
        VStack {
            Text(item.title ?? "")
            Text("\(item.timestamp!, formatter: itemFormatter)")
            Button("Show Sheet") {
                isShowingSheet.toggle()
            }
            .padding()
        }
        .sheet(isPresented: $isShowingSheet) {
            NavigationInSheetView(item: item)
        }
    }
}

let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()


//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
