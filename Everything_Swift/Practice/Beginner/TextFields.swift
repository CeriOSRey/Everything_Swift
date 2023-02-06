//
//  TextFields.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-05.
//

import SwiftUI

struct TextFields: View {
    
    @State var textFieldString: String = ""
    @State var dataArray: [String] = []
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Type something here", text: $textFieldString)
        //            .textFieldStyle(.roundedBorder)
                    .padding()
                    .background(Color.gray.opacity(0.3)).cornerRadius(10)
                    .foregroundColor(.red)
                    .font(.headline)
                
                Button {
                    
                    saveText()
                } label: {
                    Text("Save".uppercased())
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(textIsValid() ? Color.blue : Color.gray).cornerRadius(20)
                        .foregroundColor(.white)
                        .font(.headline)
                }
                .disabled(!textIsValid())
                
                ForEach(dataArray, id: \.self) { data in
                    Text(data)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("TextFields")
        }
        
    }
    
    func textIsValid() -> Bool {
        // check text
        if textFieldString.count >= 3 {
            return true
        }
        return false
    }
    
    func saveText() {
        if textIsValid() {
            dataArray.append(textFieldString)
            textFieldString = ""
        }
    }
}

struct TextFields_Previews: PreviewProvider {
    static var previews: some View {
        TextFields()
    }
}
