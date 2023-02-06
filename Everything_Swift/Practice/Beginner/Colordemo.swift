//
//  Colordemo.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-04.
//

import SwiftUI

struct Colordemo: View {
    var body: some View {
//        var red = #colorLiteral(    // type this to get the pallete to pop up #imageLiteral( for image
        RoundedRectangle(cornerRadius: 25)
            .fill(
//                Color.primary
                Color(UIColor.systemRed) // UIColor to get the system colors. does not exist in Color
            )
            .frame().frame(width: 300, height: 200)
            .shadow(radius: 10)
        
    }
}

struct Colordemo_Previews: PreviewProvider {
    static var previews: some View {
        Colordemo()
    }
}
