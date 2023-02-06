//
//  SystemIconsdemo.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-04.
//

import SwiftUI

/// http://developer.apple.com/design/resources
/// Apple Design Resource
/// download SF Symbols app

struct SystemIconsdemo: View {
    var body: some View {
        Image(systemName: "heart.fill")
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

struct SystemIconsdemo_Previews: PreviewProvider {
    static var previews: some View {
        SystemIconsdemo()
    }
}
