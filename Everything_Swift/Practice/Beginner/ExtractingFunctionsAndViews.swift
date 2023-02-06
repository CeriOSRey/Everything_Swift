//
//  ExtractingFunctionsAndViews.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-04.
//

import SwiftUI

struct ExtractingFunctionsAndViews: View {
    
    @State var backgroundColor: Color = Color.pink
    
    var body: some View {
        ZStack {
            // Background
            backgroundColor
                .ignoresSafeArea()
            
            // Content
            contentLayer
        }
    }
    
    var contentLayer: some View {
        VStack(spacing: 20) {
            Text("Title")
                .font(.largeTitle)
            Button {
                buttonPressed()
            } label: {
                Text("Press Me")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
            }

        }
    }
    
    func buttonPressed() {
        backgroundColor = Color.yellow
    }
}

struct ExtractingFunctionsAndViews_Previews: PreviewProvider {
    static var previews: some View {
        ExtractingFunctionsAndViews()
    }
}
