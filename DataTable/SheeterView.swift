//
//  SheeterView.swift
//  DataTable
//
//  Created by Fred on 25.01.23.
//

import SwiftUI

struct SheeterView: View {
    
    @State private var isShowingSheet = false
    
    var body: some View {
        VStack {
            Text("SheeterView")
            Button("Show Sheet") {
                isShowingSheet.toggle()
            }
            .padding()
        }
        .sheet(isPresented: $isShowingSheet) {
            Text("Sheet")
        }
    }
}

struct SheeterView_Previews: PreviewProvider {
    static var previews: some View {
        SheeterView()
    }
}
