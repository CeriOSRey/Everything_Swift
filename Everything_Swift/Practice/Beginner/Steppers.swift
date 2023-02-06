//
//  Steppers.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-05.
//

import SwiftUI

// increment or decrement

struct Steppers: View {
    
    @State var value = 0
    
    var body: some View {
        Stepper("\(value) hours", value: $value)
    }
}

struct Steppers_Previews: PreviewProvider {
    static var previews: some View {
        Steppers()
    }
}
