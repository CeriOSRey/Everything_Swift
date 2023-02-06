//
//  AnimationTiming.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-04.
//

import SwiftUI

struct AnimationTiming: View {
    
    @State var isAnimating: Bool = false
    let timing: Double = 10
    
    var body: some View {
        VStack {
            Button("Button") {
                isAnimating.toggle()
            }
            Spacer()
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimating ? 350 : 50,
                       height: 100)
//                .animation(.linear(duration: timing), value: isAnimating)
//                .animation(.spring(), value: isAnimating)
                .animation(.spring(response: 0.5, // timer of spring
                                   dampingFraction: 0.7,  // bound back
                                   blendDuration: 1
                                  ), value: isAnimating)
            
//            RoundedRectangle(cornerRadius: 20)
//                .frame(width: isAnimating ? 350 : 50,
//                       height: 100)
//                .animation(.easeIn(duration: timing), value: isAnimating)
//
//            RoundedRectangle(cornerRadius: 20)
//                .frame(width: isAnimating ? 350 : 50,
//                       height: 100)
//                .animation(.easeInOut(duration: timing), value: isAnimating)
//
//            RoundedRectangle(cornerRadius: 20)
//                .frame(width: isAnimating ? 350 : 50,
//                       height: 100)
//                .animation(.easeOut(duration: timing), value: isAnimating)
        }
    }
}

struct AnimationTiming_Previews: PreviewProvider {
    static var previews: some View {
        AnimationTiming()
    }
}
