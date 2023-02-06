//
//  AnimationsDemo.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-04.
//

import SwiftUI

struct AnimationsDemo: View {
    
    @State var isAnimated: Bool = false
    
    var body: some View {
        VStack {
            Button("Button") {
                // May have to be Animation.default.delay() incase it somehow throws an compile error
//                withAnimation(
//                    .default
////                    .delay(2.0))
////                    .repeatCount(5, autoreverses: true)
////                    .repeatForever()
//                ){
//                    isAnimated.toggle()  // since its inside this closure, anything affected by this state variable will be animated
//                }
                isAnimated.toggle()
            }
            Spacer()
            RoundedRectangle(cornerRadius: isAnimated ? 50 : 25)
                .fill(isAnimated ? Color.red : Color.green)
                .frame(
                    width: isAnimated ? 100 : 300,
                    height: isAnimated ? 300 : 100)
                .rotationEffect(Angle(degrees: isAnimated ? 360 : -360))
                .offset(y: isAnimated ? 300 : 0)
            // we can also omit the withAnimation block and call it down here so its code is isolated to the RoundedRectangle View.
            // Put the value that triggers the animation inside Value ie. isAnimated
                .animation(.default.repeatCount(5, autoreverses: true), value: isAnimated)
            Spacer()
        }
    }
}

struct AnimationsDemo_Previews: PreviewProvider {
    static var previews: some View {
        AnimationsDemo()
    }
}
