//
//  ActionSheets.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-05.
//

import SwiftUI


/// actionSheets are deprecated and we need to use .confirmationDialog()

struct ActionSheets: View {
    
    @State var showConfimationDialogue: Bool = false
    @State var backgroundColor: Color = .red
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            
            Button("Click Me") {
                showConfimationDialogue.toggle()
            }
            .confirmationDialog("This is the title", isPresented: $showConfimationDialogue, titleVisibility: .visible) {
                ConfirmationButtonView(backgroundColor: $backgroundColor)
            }
        }
    }
}

struct ActionSheets_Previews: PreviewProvider {
    static var previews: some View {
        ActionSheets()
    }
}

struct ConfirmationButtonView: View {
    
    @Binding var backgroundColor: Color
    
    var body: some View {
        Button("Delete", role: .destructive) {
            backgroundColor = .yellow
        }
    }
}
