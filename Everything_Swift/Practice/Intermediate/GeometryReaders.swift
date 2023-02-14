//
//  GeometryReaders.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-14.
//

import SwiftUI

struct GeometryReaders: View {
    
    private func getPercentage(_ geo: GeometryProxy) -> Double {
        let maxDistance = UIScreen.main.bounds.width / 2
        let currentX = geo.frame(in: .global).midX
        return Double(1 - (currentX / maxDistance))
    }
    
    var body: some View {
        
        
        
        ScrollView (.horizontal, showsIndicators: false, content: {
            HStack {
                ForEach(0..<20) { index in
                    GeometryReader { geo in
                        RoundedRectangle(cornerRadius: 20)
                            .rotation3DEffect(Angle(degrees: getPercentage(geo) * 40), axis: (x: 0, y: 1.0, z: 0.0))
                    }
                    .frame(width: 300, height: 250)
                    .padding()
                }
            }
        })
        
//        GeometryReader { geo in
//            HStack(spacing: 0) {
//                Rectangle()
//                    .fill(Color.red)
//                    .frame(width: geo.size.width * 0.6666)
//                Rectangle().fill(Color.blue)
//            }
//            .ignoresSafeArea()
//        }
    }
}

struct GeometryReaders_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaders()
    }
}
