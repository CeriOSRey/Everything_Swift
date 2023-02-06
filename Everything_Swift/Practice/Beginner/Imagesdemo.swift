//
//  Imagesdemo.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-04.
//

import SwiftUI

struct Imagesdemo: View {
    var body: some View {
        Image("hmmm")
            .resizable() // to resize the image to scale with frame
//            .aspectRatio(contentMode: .fill)
            .scaledToFill() // instead of aspect ratio
//            .font(.caption)
//            .font(.system(size: 200))
            .foregroundColor(.green)
            .frame().frame(width: 300, height: 300)
//            .clipped()
    }
}

struct Imagesdemo_Previews: PreviewProvider {
    static var previews: some View {
        Imagesdemo()
    }
}
