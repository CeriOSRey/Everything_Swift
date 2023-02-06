//
//  Badges.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-06.
//

import SwiftUI

// Badges are only displayed in Lists and TabBars items

struct Badges: View {
    var body: some View {
//        TabView {
//            Color.red
//                .tabItem {
//                    Image(systemName: "heart.fill")
//                    Text("Hello")
//                }
//                .badge("New")
//
//            Color.blue
//                .tabItem {
//                    Image(systemName: "heart.fill")
//                    Text("Hello")
//                }
//                .badge(99)
//
//            Color.yellow
//                .tabItem {
//                    Image(systemName: "heart.fill")
//                    Text("Hello")
//                }
//        }
        List {
            Text("Hello")
                .badge(5)
            Text("Hello")
            Text("Hello")
            Text("Hello")
            Text("Hello")
        }
        
    }
}

struct Badges_Previews: PreviewProvider {
    static var previews: some View {
        Badges()
    }
}
