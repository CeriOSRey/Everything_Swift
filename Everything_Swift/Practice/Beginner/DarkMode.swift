//
//  DarkMode.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-05.
//

import SwiftUI

struct DarkMode: View {
    
    @Environment(\.colorScheme) var colorscheme
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 30, content: {
                    Text("This text is Primary")
                        .foregroundColor(.primary)
                    Text("This text is secondary")
                        .foregroundColor(.secondary)
                    Text("This text is black")
                        .foregroundColor(.black)
                    Text("This text is White")
                        .foregroundColor(.white)
                    Text("This text is Red")
                        .foregroundColor(.red)
                    Text("This text is globally adaptive")
                    // create a color scheme in assets, change appearance to Any, Dark and pick 2 colors for any and dark
                        .foregroundColor(Color("AdaptiveColor"))
                    Text("This text is locally adaptive")
                        .foregroundColor(colorscheme == .light ? .green : .yellow)
                })
            }
            .navigationTitle("Dark Mode")
        }
    }
}

struct DarkMode_Previews: PreviewProvider {
    static var previews: some View {
        DarkMode()
    }
}
