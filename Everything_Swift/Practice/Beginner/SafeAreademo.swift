//
//  SafeAreademo.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-04.
//

import SwiftUI

// By default background() ignores safe area
// Generally only background should ignores safe areas

struct SafeAreademo: View {
    var body: some View {
        ScrollView {
            Text("Title goes here")
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
            ForEach(0..<10) { _ in
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(Color.white)
                    .frame(height: 150)
                    .shadow(radius: 10)
                    .padding(20)
            }
        }
        .background(Color.red)
        
        
        
//        ZStack {
//            ///**best approach to have background ignore safeArea
//
//            // background
//            Color.blue
//                .ignoresSafeArea()
//
//            // foreground
//            VStack {
//                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//                Spacer()
//
//            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(Color.red)
//        }
    }
}

struct SafeAreademo_Previews: PreviewProvider {
    static var previews: some View {
        SafeAreademo()
    }
}
