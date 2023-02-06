//
//  SelectingText.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-05.
//

import SwiftUI

struct SelectingText: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .textSelection(.enabled)  // enables the copy or share pop up menu
    }
}

struct SelectingText_Previews: PreviewProvider {
    static var previews: some View {
        SelectingText()
    }
}
