//
//  ClearableTextField.swift
//  DataTable
//
//  Created by Fred on 21.11.22.
//

import SwiftUI

struct ClearableTextField: View {
    
    var title: String
    @Binding var text: String
    
    // https://www.kodeco.com/31569019-focus-management-in-swiftui-getting-started
    @FocusState private var isFocused: Bool
    
    init(_ title: String, text: Binding<String>) {
        self.title = title
        _text = text
    }
    
    var body: some View {
        ZStack(alignment: .trailing) {
            TextField(title, text: $text)
                .focused($isFocused)
            Image(systemName: "xmark.circle.fill")
            .foregroundColor(.secondary)
            .opacity(text.isEmpty ? 0.2 : 0.5)
            .onTapGesture {
                text = ""
                isFocused = true
            }
        }
    }
}

struct ClearableTextField_Previews: PreviewProvider {
    
    @State static var text = "some value"
    
    static var previews: some View {
        Form {
            ClearableTextField("Clear me", text: $text)
        }
    }
}
