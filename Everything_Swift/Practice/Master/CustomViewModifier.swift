//
//  CustomViewModifier.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-17.
//

import SwiftUI

struct DefaultButtonViewModifier: ViewModifier {
    
    var backgroundColor: Color
    
    /// Needs to be pass as .modifier() parameter to call the struct
    /// lookt at first Text()
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(10)
            .shadow(radius: 10)
            .padding()
    }
}

/// If we add this, then we dont need the modifier method because now we made our own custom method.
/// look at second Text()
extension View {
    func withDefaultButtonFormatting(backgroundColor: Color) -> some View {
        modifier(DefaultButtonViewModifier(backgroundColor: backgroundColor))
    }
}

struct CustomViewModifier: View {
    var body: some View {
        VStack {
            Text("Hello World")
                .modifier(DefaultButtonViewModifier(backgroundColor: Color.red))
//                .font(.headline)
//                .foregroundColor(.white)
//                .frame(height: 55)
//                .frame(maxWidth: .infinity)
//                .background(Color.blue)
//                .cornerRadius(10)
//                .shadow(radius: 10)
//                .padding()
            
            Text("Hello World")
                .withDefaultButtonFormatting(backgroundColor: Color.orange)
//                .font(.headline)
//                .foregroundColor(.white)
//                .frame(height: 55)
//                .frame(maxWidth: .infinity)
//                .background(Color.blue)
//                .cornerRadius(10)
//                .shadow(radius: 10)
//                .padding()
            
            Text("Hello World")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
                .shadow(radius: 10)
                .padding()
        }
    }
}

struct CustomViewModifier_Previews: PreviewProvider {
    static var previews: some View {
        CustomViewModifier()
    }
}
