//
//  LazyVGriddemo.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-04.
//

import SwiftUI

struct LazyVGriddemo: View {
    
    let columnsFixed: [GridItem] = [
        GridItem(.fixed(50)),
        GridItem(.fixed(50)),
        GridItem(.fixed(50)),
        GridItem(.fixed(50)),
        GridItem(.fixed(50)),
        GridItem(.fixed(50))
    ]
    
    let columnFlexible: [GridItem] = [
        GridItem(.flexible(), spacing: 6),
        GridItem(.flexible(), spacing: 6),
        GridItem(.flexible(), spacing: 6)
    ]
    
    let columnAdaptive: [GridItem] = [
        GridItem(.adaptive(minimum: 50, maximum: 300)),
        GridItem(.adaptive(minimum: 50, maximum: 300))
    ]
    
    var body: some View {
        ScrollView {
            Rectangle()
                .fill(Color.white)
                .frame().frame(height: 400)
            LazyVGrid(
                columns: columnFlexible,
                alignment: .center,
                spacing: 6,
                pinnedViews: [.sectionHeaders],        // pin the header title when scrolling
                content: {
                    Section {
                        ForEach(0..<20) { _ in
                            Rectangle()
                                .frame(height: 150)
                        }
                    } header: {
                        Text("Section 1")
                            .foregroundColor(.white)
                            .font(.title)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.blue)
                            .padding()
                    }
                    Section {
                        ForEach(0..<20) { _ in
                            Rectangle()
                                .frame(height: 150)
                        }
                    } header: {
                        Text("Section 2")
                            .foregroundColor(.white)
                            .font(.title)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.green)
                            .padding()
                    }
                })
//            LazyVGrid(columns: columnFlexible) {
//                ForEach(0..<50) { _ in
//                    Rectangle()
//                        .frame(height: 150)
//                }
//            }
        }
    }
}

struct LazyVGriddemo_Previews: PreviewProvider {
    static var previews: some View {
        LazyVGriddemo()
    }
}
