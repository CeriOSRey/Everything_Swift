//
//  BindingPropertyWrapper.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-04.
//

import SwiftUI

/// @Binding var will connect with a @State var in the caller view
/// need to bind using $ sign

struct BindingPropertyWrapper: View {
    
    @State var backgroundColor: Color = Color.green
    @State var title: String = "Title"
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            
            VStack {
                Text(title)
                ForegroundLayer(backgroundColor: $backgroundColor, title: $title)
            }

        }
    }
}

struct ForegroundLayer: View {
    
    @Binding var backgroundColor: Color
    @State var buttonColor: Color = .blue
    @Binding var title: String
    
    var body: some View {
        Button {
            backgroundColor = Color.orange
            buttonColor = .pink
            title = "Button Was Press."
        } label: {
            Text("Button")
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal)
                .background(buttonColor)
                .cornerRadius(10)
        }
    }
}

struct BindingPropertyWrapper_Previews: PreviewProvider {
    static var previews: some View {
        BindingPropertyWrapper()
    }
}
