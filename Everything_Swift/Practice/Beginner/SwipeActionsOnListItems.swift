//
//  SwipeActionsOnListItems.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-05.
//

import SwiftUI

struct SwipeActionsOnListItems: View {
    
    @State var fruits: [String] = [
        "apple", "oranges", "banana", "peach"
    ]
    
    var body: some View {
        List {
            ForEach(fruits, id: \.self) {
                Text($0.capitalized)
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button("Archive") {
                            
                        }
                        .tint(.green)
                        Button("Save") {
                            
                        }
                        .tint(.blue)
                        Button("Junk") {
                            
                        }
                        .tint(.black)
                    }
            }
        }
    }
    
    
}

struct SwipeActions_Previews: PreviewProvider {
    static var previews: some View {
        SwipeActionsOnListItems()
    }
}
