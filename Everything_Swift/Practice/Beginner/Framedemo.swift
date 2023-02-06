//
//  Framedemo.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-04.
//

import SwiftUI

struct Framedemo: View {
    var body: some View {
        Text("Hello World")
            .background(Color.red)
//            .frame(width: 200, height: 200, alignment: .topLeading)
//            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .background(Color.red)
            .frame(width: 150)
            .background(Color.orange)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.purple)
            .frame(width: 400)
            .background(Color.pink)
            .frame(maxHeight: .infinity, alignment: .top)
            .background(Color.green)
            
    }
}

struct Framedemo_Previews: PreviewProvider {
    static var previews: some View {
        Framedemo()
    }
}
