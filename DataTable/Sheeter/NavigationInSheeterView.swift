//
//  NavigationInSheeterView.swift
//  DataTable
//
//  Created by Fred on 25.01.23.
//

import SwiftUI

struct NavigationInSheeterView: View {

    @Environment(\.dismiss) var dismiss

    var body: some View {
//        NavigationView {
            VStack {
                Text("Sheeter hosting its own NavigationView")
                    .font(.title2)
                Spacer()
                VStack {
                    Text("some text")
                }
                .padding()
//                NavigationLink("Next") {
//                    Text("end")
//                }
//                .padding()
                Spacer()
            }
//            .navigationBarTitle(Text("Details in Sheet"), displayMode: .inline)
//            .toolbar() {
//                ToolbarItem {
//                    Button("Close") {
//                        dismiss()
//                    }
//                }
//            }
//        }
    }
}

struct NavigationInSheeterView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationInSheeterView()
    }
}
