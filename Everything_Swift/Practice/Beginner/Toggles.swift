//
//  Toggles.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-05.
//

import SwiftUI

struct Toggles: View {
    
    @State var isOn: Bool = true
    
    var body: some View {
        VStack {
            HStack {
                Text("Status:")
                Text(isOn ? "Online" : "Offline")
            }
            .font(.title)
            
            Toggle(isOn: $isOn) {
                Text("LABEL")
            }
            .tint(Color.pink)
            
            Spacer()
        }
    }
}

struct Toggles_Previews: PreviewProvider {
    static var previews: some View {
        Toggles()
    }
}
