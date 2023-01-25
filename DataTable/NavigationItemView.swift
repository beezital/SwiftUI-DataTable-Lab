//
//  NavigationItemView.swift
//  DataTable
//
//  Created by Fred on 25.01.23.
//

import SwiftUI

// https://stackoverflow.com/questions/56833659/what-is-content-in-swiftui
struct NavigationItemView<Content:View>: View {
    
    @EnvironmentObject var navigationState: NavigationState
    
    private let V_PADDING: Double = 12
    private let ICON_SIZE: Double = 25

    var selection: NavigationState.Selection
    var destination: () -> Content
    @Binding var isActive: Bool
    var title: String
    var systemImage: String
    var label: (() -> Content)?

    var body: some View {
        NavigationLink(destination: destination(), isActive: $isActive) { EmptyView() }
        Button {
            navigationState.select(selection)
        } label: {
            if let labelView = label {
                HStack {
                    labelView()
                        .foregroundColor(navigationState.selection == selection ? .white : Color(UIColor.label))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .contentShape(Rectangle())
                }
            } else {
                HStack(spacing: 10) {
                    Image(systemName: systemImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: ICON_SIZE, maxHeight: ICON_SIZE, alignment: .center)
                        .foregroundColor(navigationState.selection == selection ? .white : Color.accentColor)
                    Text(title)
                        .font(.title3)
                        .foregroundColor(navigationState.selection == selection ? .white : Color(UIColor.label))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .contentShape(Rectangle())
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(V_PADDING)
        .background(navigationState.selection == selection ? Color.accentColor : .clear)
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: V_PADDING, height: V_PADDING)))
    }
}

//struct NavigationItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationListItemView()
//    }
//}
