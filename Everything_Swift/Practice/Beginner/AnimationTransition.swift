//
//  AnimationTransition.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-04.
//

import SwiftUI

// Transitions is for animating objects into or out of the view

struct AnimationTransition: View {
    
    @State var showView: Bool = false
    
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            VStack {
                Button("Button: \(showView.description)") {
//                    showView.toggle()
                    withAnimation(
                        .spring()
                    ) {
                        showView.toggle()
                    }
                    
                }
                Spacer()
            }
            
            if showView {
                RoundedRectangle(cornerRadius: 30)
                    .frame(height: UIScreen.main.bounds.height * 0.5)
//                    .transition(AnyTransition
//                        .move(edge: .bottom)
//                        .animation(.easeInOut(duration: 3)))
                    .transition(AnyTransition.asymmetric(
                        insertion: .move(edge: .bottom),
                        removal: .move(edge: .bottom)))

            }
        }
    }
}

struct AnimationTransition_Previews: PreviewProvider {
    static var previews: some View {
        AnimationTransition()
    }
}
