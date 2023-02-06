//
//  TernaryOperators.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-04.
//

import SwiftUI

/// let variable = ( condition ) ? true : false

struct TernaryOperators: View {
    
    @State var isStartingState: Bool = false
    @State var color: Color = .blue
    
    var body: some View {
        VStack {
            Button("Button: \(isStartingState.description)") {
                isStartingState.toggle()
            }
            RoundedRectangle(cornerRadius: isStartingState ? 25 : 0)
                .fill(isStartingState ? .blue : .red)  // ternary operator is here
                .frame(width: isStartingState ? 200 : 50,
                       height: isStartingState ? 400 : 50
                )
            
            
            
            
            Spacer()
        }
    }
}

struct TernaryOperators_Previews: PreviewProvider {
    static var previews: some View {
        TernaryOperators()
    }
}
