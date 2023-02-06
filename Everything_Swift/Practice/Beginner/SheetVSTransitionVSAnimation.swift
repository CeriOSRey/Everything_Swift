//
//  SheetVSTransitionVSAnimation.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-04.
//

import SwiftUI

struct SheetVSTransitionVSAnimation: View {
    
    @State var showNewScreen: Bool = false
    
    var body: some View {
        ZStack {
            // Background
            Color.orange
                .ignoresSafeArea()
            
            // Foreground
            VStack {
                Button("Button") {
                    showNewScreen.toggle()
                }
                .font(.largeTitle)
                Spacer()
            }
            // Method 1: Sheet
            // Not as dynamic because you cant customize the transition/animation
//            .sheet(isPresented: $showNewScreen) {
//                NewScreen()
//            }
            
            // Method 2: Transition
//            ZStack {
//                if showNewScreen {
//                    NewScreen(showNewScreen: $showNewScreen)
//                        .padding(.top, 100)
//                        .transition(.move(edge: .bottom))
//                        .animation(.spring())
//                }
//            }
//            .zIndex(2.0)   // keeps this zstack infront of the above vstack
            
            // Method 3: Animation Offset
            NewScreen(showNewScreen: $showNewScreen)
                .padding(.top, 100)
                .offset(y: showNewScreen ? 0 : UIScreen.main.bounds.height)
                .animation(.spring(), value: showNewScreen)
                
        }
    }
}

struct NewScreen: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var showNewScreen: Bool
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.purple
                .ignoresSafeArea()
            
            VStack {
                Button {
    //                dismiss()  // for sheets
                    showNewScreen.toggle()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .padding(20)
                }
            }

        }
    }
}

struct SheetVSTransitionVSAnimation_Previews: PreviewProvider {
    static var previews: some View {
        SheetVSTransitionVSAnimation()
//        NewScreen()
    }
}
