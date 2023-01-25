//
//  NavigationStepView.swift
//  DataTable
//
//  Created by Fred on 25.01.23.
//

import SwiftUI

struct NavigationStepView: View {

    init() {
        print("NavigationStepView: init")
    }
    
    var body: some View {
        VStack {
            NavigationLink {
                SheeterView()
            } label: {
                Text("Next step")
            }
        }
        .navigationBarTitle(Text("NavigationStepView"), displayMode: .inline)
    }
}

struct NavigationStepView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStepView()
    }
}
