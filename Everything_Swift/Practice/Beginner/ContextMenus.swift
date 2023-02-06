//
//  ContextMenus.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-05.
//

import SwiftUI

// to access the context menu. click and hold on the item.

struct ContextMenus: View {
    
    @State var backgroundColor: Color = .yellow
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            Image(systemName: "house.fill")
                .font(.title)
            Text("Swiftful Thinking")
                .font(.headline)
            Text("How to use Context Menu")
                .font(.subheadline)
        }
        .foregroundColor(.white)
        .padding(30)
        .background(backgroundColor.cornerRadius(30))
        .contextMenu {
            Button {
                backgroundColor = .red
            } label: {
                Label {
                    Text("Button 1")
                } icon: {
                    Image(systemName: "flame")
                }

            }
            
            Button {
                backgroundColor = .purple
            } label: {
                Label {
                    Text("Button 2")
                } icon: {
                    Image(systemName: "flame")
                }

            }


    
        }
    }
}

struct ContextMenus_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenus()
    }
}
