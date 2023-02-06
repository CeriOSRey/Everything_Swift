//
//  Shapesdemo.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-04.
//

import SwiftUI

struct Shapesdemo: View {
    var body: some View {
//        Circle()
//        Ellipse()
//        Capsule()
//        Rectangle()
        RoundedRectangle(cornerRadius: 50)
//            .fill(Color.blue)
//            .foregroundColor(.pink)
//            .stroke(Color.red, lineWidth: 30)
//            .stroke(Color.orange, style: StrokeStyle(lineWidth: 30, lineCap: .round, dash: [30]))
//            .trim(from: 0.5, to: 1.0)
//            .stroke(Color.purple, lineWidth: 50)
            .frame().frame(width: 200, height: 100)
            
    }
}

struct Shapesdemo_Previews: PreviewProvider {
    static var previews: some View {
        Shapesdemo()
    }
}
