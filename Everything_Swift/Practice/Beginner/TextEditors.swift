//
//  TextEditors.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-05.
//

import SwiftUI

struct TextEditors: View {
    
    @State var textEditorText: String = "This is the starting text."
    @State var savedText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $textEditorText)
                    .frame(height: 250)
                    .foregroundColor(Color.red)
                
                Button {
                    savedText = textEditorText
                } label: {
                    Text("Save".uppercased())
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                Text(savedText)
                Spacer()
            }
            .padding()
            .background(Color.green)
            .navigationTitle("Text Editor")
        }
    }
}

struct TextEditors_Previews: PreviewProvider {
    static var previews: some View {
        TextEditors()
    }
}
