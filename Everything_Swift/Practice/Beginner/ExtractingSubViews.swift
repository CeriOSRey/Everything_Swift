//
//  ExtractingSubViews.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-04.
//

import SwiftUI

struct ExtractingSubViews: View {
    
    var body: some View {
        ZStack {
            // Background
            Color.blue
                .ignoresSafeArea()
            
            // Content Layer
            contentLayer
        }
    }
    
    var contentLayer: some View {
        HStack {
            MyItem(title: "Orange", count: 55, color: .orange)
            MyItem(title: "Apple", count: 10, color: .red)
            MyItem(title: "Banana", count: 15, color: .yellow)
        }
    }
}

struct ExtractingSubViews_Previews: PreviewProvider {
    static var previews: some View {
        ExtractingSubViews()
    }
}

struct MyItem: View {
    
    let title: String
    let count: Int
    let color: Color
    
    var body: some View {
        VStack(spacing: 10) {
            Text("\(count)")
            Text(title)
        }
        .padding()
        .background(color)
        .cornerRadius(10)
    }
}
