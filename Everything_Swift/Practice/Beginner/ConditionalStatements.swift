//
//  ConditionalStatements.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-04.
//

import SwiftUI

/// &&  means **and**
/// || means **or**
/// ! means **not**

struct ConditionalStatements: View {
    
    @State var showCircle: Bool = false
    @State var showRectangle: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Button("Circle Button: \(showCircle.description)") {
                showCircle.toggle()
            }
            
            Button("Rectangle Button: \(showRectangle.description)") {
                showRectangle.toggle()
            }
            if showCircle && showRectangle {
                Circle()
                    .frame(width: 100, height: 100)
                Spacer(minLength: 20)
                Rectangle()
                    .frame(width: 100, height: 100)
            } else if showCircle && !showRectangle {
                Circle()
                    .frame(width: 100, height: 100)
            } else if showRectangle {
                Rectangle()
                    .frame(width: 100, height: 100)
            } else {
                
            }
            Spacer()
        }
    }
}

struct ConditionalStatements_Previews: PreviewProvider {
    static var previews: some View {
        ConditionalStatements()
    }
}
