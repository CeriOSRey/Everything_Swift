//
//  Gradientdemo.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-04.
//

import SwiftUI

struct Gradientdemo: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(
//                Color.red
//                LinearGradient(gradient: Gradient(colors: [.red, .blue]), startPoint: .leading, endPoint: .trailing)
//                RadialGradient(gradient: Gradient(colors: [.blue, .red]), center: .topLeading, startRadius: 5, endRadius: 200)
                AngularGradient(gradient: Gradient(colors: [.blue, .red]), center: .topLeading, angle: .degrees(180 + 45))

            )
            .frame(width: 300, height: 200)
    }
}

struct Gradientdemo_Previews: PreviewProvider {
    static var previews: some View {
        Gradientdemo()
    }
}
