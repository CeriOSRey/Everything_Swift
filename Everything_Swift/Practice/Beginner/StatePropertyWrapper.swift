//
//  StatePropertyWrapper.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-04.
//

import SwiftUI

// @State tells the view to observe the state of the variable

struct StatePropertyWrapper: View {
    
    @State var backgroundColor: Color = Color.green
    @State var myTitle: String = "My Title"
    @State var count: Int = 0
    
    var body: some View {
        ZStack {
            // Background layer
            backgroundColor
                .ignoresSafeArea()
            
            // Foreground layer
            VStack(spacing: 20) {
                Text(myTitle)
                    .font(.largeTitle)
                Text("Count: \(count)")
                    .font(.title)
                    .underline()
                
                HStack(spacing: 20) {
                    Button("Button 1") {
                        self.backgroundColor = .purple
                        self.myTitle = "Button 1 was pressed"
                        count += 1
                    }
                    
                    Button("Button 2") {
                        self.backgroundColor = .orange
                        self.myTitle = "Pressed Button 2"
                        count -= 1

                    }
                }
            }
            .foregroundColor(.white) // change all the text color to white
        }
    }
}

struct StatePropertyWrapper_Previews: PreviewProvider {
    static var previews: some View {
        StatePropertyWrapper()
    }
}
