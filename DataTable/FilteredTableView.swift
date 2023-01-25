//
//  FilteredTableView.swift
//  DataTable
//
//  Created by Fred on 25.01.23.
//

import SwiftUI

struct FilteredTableView: View {
    
    @Environment(\.managedObjectContext) private var viewContext

    // https://stackoverflow.com/a/69355662/2742007
    // https://developer.apple.com/documentation/swiftui/environmentvalues/issearching
    // This environment property is only set in the view that has been modified by .searchable
    // hence, the .searchable is set in the parent of this view
    @Environment(\.isSearching) private var isSearching
        
    @AppStorage private var savedSortKey: String
    @AppStorage private var savedSortOrder: String
    
    @FetchRequest private var items: FetchedResults<Item>
    
    
    
    init(searchText: String) {
        
        _savedSortKey = AppStorage(wrappedValue: "title", "itemsSortKey")
        _savedSortOrder = AppStorage(wrappedValue: "forward", "itemsSortOrder")


        // https://www.hackingwithswift.com/books/ios-swiftui/dynamically-filtering-fetchrequest-with-swiftui
        _items = FetchRequest<Item>(
            sortDescriptors: getSortDescriptorsWith(sortKeyString: _savedSortKey.wrappedValue, sortOderString: _savedSortOrder.wrappedValue),
            predicate: searchText.isEmpty ? nil : NSPredicate(format: "title CONTAINS[cd] %@", searchText),
            animation: .default
        )
        
        print("FilteredTableView: init")
    }
    

    var body: some View {
        List {
            Section(header: HeaderView(savedSortKey: $savedSortKey, savedSortOrder: $savedSortOrder)) {
                ForEach(items) { item in
                    NavigationLink {
                        DetailView(item: item)
//                        SheeterView()
                    } label: {
                        ItemRowView(item: item)
                    }
                }
                .onDelete(perform: deleteItems)
            }
        }
        .onChange(of: savedSortKey) { newSortKey in
            // https://www.kodeco.com/27201015-dynamic-core-data-with-swiftui-tutorial-for-ios
            items.sortDescriptors = getSortDescriptorsWith(sortKeyString: newSortKey, sortOderString: savedSortOrder)
        }
        .onChange(of: savedSortOrder) { newSortOrder in
            // https://www.kodeco.com/27201015-dynamic-core-data-with-swiftui-tutorial-for-ios
            items.sortDescriptors = getSortDescriptorsWith(sortKeyString: savedSortKey, sortOderString: newSortOrder)
        }

    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
}

//struct FilteredTableView_Previews: PreviewProvider {
//    static var previews: some View {
//        FilteredTableView()
//    }
//}


/*
 ==================================================================================================
 
 ==================================================================================================
 */


struct HeaderView: View {
    
    @Binding var savedSortKey: String
    @Binding var savedSortOrder: String

    var body: some View {
//        Text("Header")
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                ColumnHeaderView(title: "Title", sortKeyValue: "title", sortKeyString: $savedSortKey, sortOrderString: $savedSortOrder)
                    .frame(maxWidth: columnWidth(0, maxWidth: geometry.size.width), alignment: .leading)
                    .offset(CGSize(width: columnOffset(0, maxWidth: geometry.size.width), height: 0))

                ColumnHeaderView(title: "Timestamp", sortKeyValue: "timestamp", sortKeyString: $savedSortKey, sortOrderString: $savedSortOrder)
                    .frame(maxWidth: columnWidth(1, maxWidth: geometry.size.width), alignment: .trailing)
                    .offset(CGSize(width: columnOffset(1, maxWidth: geometry.size.width), height: 0))

            }
            .frame(maxHeight: .infinity)
        }
        .font(.system(size: 15, weight: .regular, design: .default))
        .padding([.bottom], 5)
        .padding([.trailing], 20)
        .listRowSeparator(.hidden) // https://stackoverflow.com/questions/56553672/how-to-remove-the-line-separators-from-a-list-in-swiftui-without-using-foreach

    }
}

private enum SortOrderString: String {
    case forward = "forward"
    case reverse = "reverse"
    
    func toggled() -> SortOrderString {
        if self == .forward {
            return .reverse
        }
        return .forward
    }
}



///
///
private func toSortOrder(_ order: String) -> SortOrder {
    if order == "forward" {
        return .forward
    }
    return .reverse
}




private func getSortDescriptorsWith(sortKeyString: String, sortOderString: String) -> [SortDescriptor<Item>]  {
//        print("RecordingsViewModel: updateSortDescriptors: \(sortKeyString) \(sortOderString)")
    var sortDescriptors: [SortDescriptor<Item>] = []

    switch sortKeyString {
    case "title":
        sortDescriptors = [ SortDescriptor<Item>(\Item.title, order: toSortOrder(sortOderString)) ]
    case "timestamp":
        sortDescriptors = [ SortDescriptor<Item>(\Item.timestamp, order: toSortOrder(sortOderString)) ]
    default:
        sortDescriptors = [ SortDescriptor<Item>(\Item.title, order: toSortOrder(sortOderString)) ]
    }
    
    return sortDescriptors
}




///
///
private struct ColumnHeaderView: View {
    
    var title: String
    var sortKeyValue: String
    @Binding var sortKeyString: String
    @Binding var sortOrderString: String
    
    var body: some View {
        Button() {
            if sortKeyString == sortKeyValue {
                if sortOrderString == "reverse" {
                    sortOrderString = "forward"
                } else {
                    sortOrderString = "reverse"
                }
            }
            sortKeyString = sortKeyValue
        } label: {
            HStack(spacing: 3) {
                Text(title)
                if sortKeyString == sortKeyValue {
                    SortOrderImage(sortOrder: toSortOrder(sortOrderString))
                }
            }
        }
    }
}


///
///
private struct SortOrderImage: View {
    
    var sortOrder: SortOrder
    
    var body: some View {
        if sortOrder == .reverse {
            Image(systemName: "arrow.down")
                .font(.footnote.weight(.bold))
        } else {
            Image(systemName: "arrow.up")
                .font(.footnote.weight(.bold))
        }
    }
}



///
///
///
private struct ItemRowView: View {
    
    @ObservedObject var item: Item
    
    var body: some View {
//        Text("row")
//        Text("\(item.title ?? "")")
        
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Text(item.title ?? "")
                    .frame(maxWidth: columnWidth(0, maxWidth: geometry.size.width), alignment: .leading)
                    .offset(CGSize(width: columnOffset(0, maxWidth: geometry.size.width), height: 0))

                Text("\(item.timestamp ?? Date(), formatter: itemFormatter)")
                    .frame(maxWidth: columnWidth(1, maxWidth: geometry.size.width), alignment: .trailing)
                    .offset(CGSize(width: columnOffset(1, maxWidth: geometry.size.width), height: 0))
            }
            .frame(maxHeight: .infinity)
        }
    }

}


let COLUMN_COUNT = 2
let COLUMN_GAP = 20.0
let DURATION_COLUMN_WIDTH = 180.0


private func columnWidth(_ index: Int, maxWidth: Double) -> Double {
    switch index {
    case 0:
        return (maxWidth - (Double(COLUMN_COUNT - 1) * COLUMN_GAP) - DURATION_COLUMN_WIDTH) * 1.0
    case 1:
//        return (maxWidth - (Double(COLUMN_COUNT - 1) * COLUMN_GAP) - DURATION_COLUMN_WIDTH) * 0.66
//    case 2:
//        return (maxWidth - (Double(COLUMN_COUNT - 1) * COLUMN_GAP) - DURATION_COLUMN_WIDTH) * 0.33
//    case 3:
        return DURATION_COLUMN_WIDTH
    default:
        return 0.0
    }
}


private func columnOffset(_ index: Int, maxWidth: Double) -> Double {
    switch index {
    case 0:
        return 0.0
    case 1:
//        return (maxWidth - (Double(COLUMN_COUNT - 1) * COLUMN_GAP) - DURATION_COLUMN_WIDTH) * 0.33 + (COLUMN_GAP * 1)
//    case 2:
//        return (maxWidth - (Double(COLUMN_COUNT - 1) * COLUMN_GAP) - DURATION_COLUMN_WIDTH) * 0.66 + (COLUMN_GAP * 2)
//    case 3:
        return (maxWidth - (Double(COLUMN_COUNT - 1) * COLUMN_GAP) - DURATION_COLUMN_WIDTH) * 1.0 + (COLUMN_GAP * 1)
    default:
        return 0.0
    }
}
