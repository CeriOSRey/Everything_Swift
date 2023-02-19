//
//  CustomButtonStyles.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-17.
//

import SwiftUI

struct PressableButtonStyle: ButtonStyle {
    
    let scaleAmount: Double
    
    init(scaleAmount: Double) {
        self.scaleAmount = scaleAmount
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scaleAmount : 1.0)
//            .brightness(configuration.isPressed ? 0.05 : 0)  //either this or opacity will work
            .opacity(configuration.isPressed ? 0.8 : 1.0)
    }
}

extension View {
    func withPressableStyle(scaleAmount: Double = 0.9) -> some View {
        buttonStyle(PressableButtonStyle(scaleAmount: scaleAmount))
    }
}

struct CustomButtonStyles: View {
    var body: some View {
        Button {
            
        } label: {
            Text("Click Me")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
                .shadow(color: Color.blue.opacity(0.3),
                        radius: 10)
                
        }
//        .buttonStyle(PressableButtonStyle()) // no View extension
        .withPressableStyle(scaleAmount: 0.5)               // with View extension
        .padding(40)

    }
}

struct CustomButtonStyles_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonStyles()
    }
}
