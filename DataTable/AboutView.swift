//
//  AboutView.swift
//  DataTable
//
//  Created by Fred on 25.01.23.
//

import SwiftUI

struct AboutView: View {
    
    @Environment(\.isPresented) private var isPresented

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Demonstrate CoreData, NavigationView and Sheets")
            Text("also a custom made simple table with sortable columns")
        }
        .navigationTitle("About")
        .navigationBarTitleDisplayMode(.inline)
        .onChange(of: isPresented) { newIsPresented in
            if newIsPresented {
                print("AboutView isPresented")
            }
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
