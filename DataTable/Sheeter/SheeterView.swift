//
//  SheeterView.swift
//  DataTable
//
//  Created by Fred on 25.01.23.
//

import SwiftUI

struct SheeterView: View {
    
    @State private var isShowingSheet = false
    
    init() {
        print("SheeterView: init")
    }
    
    
    var body: some View {
        VStack {
            Text("SheeterView")
            Button("Show Sheet") {
                isShowingSheet.toggle()
            }
            .padding()
        }
        .sheet(isPresented: $isShowingSheet) {
            NavigationInSheeterView()
        }
    }
}

struct SheeterView_Previews: PreviewProvider {
    static var previews: some View {
        SheeterView()
    }
}
