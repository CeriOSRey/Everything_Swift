//
//  SwiftUIView.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-05.
//

import SwiftUI

struct SwiftUIView: View {
    
    @State var value: Double = 0
    @State var backgroundColor: Color = .red
    
    var body: some View {
        
        ZStack {
            
            backgroundColor
                .ignoresSafeArea()
            
            VStack {
                Text("Rating")
    //            Text("\(value)")
                Text (
                    String(format: "%.0f", value)
                )
    //            Slider(value: $value, in: 1...5)
    //            Slider(value: $value, in: 1...5, step: 1.0)
                Slider(value: $value, in: 1...5) {
                    Text("Title")
                } minimumValueLabel: {
                    Text("1")
                } maximumValueLabel: {
                    Text("5")
                } onEditingChanged: { _ in
                    backgroundColor = .green
                }

            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
