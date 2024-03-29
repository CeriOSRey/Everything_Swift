//
//  CustomAnyTransitions.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-17.
//

import SwiftUI

struct RotateViewModifier: ViewModifier {
    
    let rotation: Double
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle(degrees: rotation))
            .offset(
                x: rotation != 0 ? UIScreen.main.bounds.width : 0,
                y: rotation != 0 ? UIScreen.main.bounds.width : 0
            )
    }
}

extension AnyTransition {
    
    static var rotating: AnyTransition {
        // active means animation state, identity is the origin state
        /// DONT NEED THIS `return AnyTransition.` because its a 1 liner
        modifier(active: RotateViewModifier(rotation: 180), identity: RotateViewModifier(rotation: 0))
    }
    
    static func rotating(rotation: Double) -> AnyTransition {
        // active means animation state, identity is the origin state
        /// DONT NEED THIS `return AnyTransition.` because its a 1 liner
        modifier(
            active: RotateViewModifier(rotation: rotation),
            identity: RotateViewModifier(rotation: 0))
    }
    
    static var rotateOn: AnyTransition {
        asymmetric(
            insertion: .rotating,
            removal: .move(edge: .leading))
    }
}


struct CustomAnyTransitions: View {
    
    @State private var showRectangle: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            
            if showRectangle {
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 250, height: 350, alignment: .center)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .transition(.rotateOn)
//                    .transition(.rotating(rotation: 1080))
//                    .transition(AnyTransition.rotating.animation(.easeInOut))
//                    .transition(.move(edge: .leading))
//                    .transition(AnyTransition.scale.animation(.easeInOut))
            }
            
            Spacer()
            Text("Click Me")
                .withDefaultButtonFormatting(backgroundColor: Color.blue)
                .onTapGesture {
                    withAnimation(.easeIn(duration: 5.0)) {
                        showRectangle.toggle()
                    }
                }
        }
    }
}

struct CustomAnyTransitions_Previews: PreviewProvider {
    static var previews: some View {
        CustomAnyTransitions()
    }
}
