//
//  SheetsAndFullScreenCover.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-04.
//

import SwiftUI

struct SheetsAndFullScreenCover: View {
    
    @State var showSheet: Bool = false
    
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
            
            // foreground
            Button {
                showSheet.toggle()
            } label: {
                Text("Button")
                    .foregroundColor(.green)
                    .font(.headline)
                    .padding(20)
                    .background(Color.white.cornerRadius(10))
            }
            .fullScreenCover(isPresented: $showSheet, content: {
                /// **FULL SCREEN SHEET, CANT SWIPE TO DISMISS**
                SheetView()
            })
//            .sheet(isPresented: $showSheet) {
            /// **MODAL sheet, can be dismissed by swipe down**
            /// no conditional statements here that show multiple sheets
            /// ONE SHEET ONE VIEW
//                SheetView()
//            }

        }
    }
}

struct SheetView: View {
    
    /// **This is how to dismiss a sheet correctly
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.red
                .ignoresSafeArea()
            
            // foreground
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding(20)
            }
        }
    }
}

struct SheetsAndFullScreenCover_Previews: PreviewProvider {
    static var previews: some View {
        SheetsAndFullScreenCover()
//        SheetView()
    }
}
