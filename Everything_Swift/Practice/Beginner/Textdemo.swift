//
//  Textdemo.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-04.
//

import SwiftUI

struct Textdemo: View {
    var body: some View {
        Text("Placeholder Placeholder Placeholder Placeholder Placeholder".capitalized)
//            .font(.title)
//            .fontWeight(.bold)
//            .bold()
//            .underline()
//            .strikethrough()
//            .font(.system(size: 24, weight: .semibold, design: .serif))
            .multilineTextAlignment(.center)
//            .baselineOffset(50) // space between lines
//            .kerning(5)      // space between letters
            .foregroundColor(.red)
            .frame(width: 200, height:  100, alignment: .center)
            .minimumScaleFactor(0.1)  // resize text to fit inside frame
    }
}

struct Textdemo_Previews: PreviewProvider {
    static var previews: some View {
        Textdemo()
    }
}
