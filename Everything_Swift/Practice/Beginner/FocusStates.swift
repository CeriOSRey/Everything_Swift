//
//  FocusStates.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-06.
//

import SwiftUI

// programmatically focus on a view component
// @FocusState variables takes no initial value

struct FocusStates: View {
    
    @State private var userName: String = ""
    @FocusState private var usernameInFocus: Bool // programmatically toggle this and textField will be in focus.
    @FocusState private var passwordInFocus: Bool
    
    var body: some View {
        VStack {
            TextField("Add your name here...", text: $userName)
                .padding(.leading)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.gray.brightness(0.3))
                .focused($usernameInFocus)
                .cornerRadius(10)
                .onSubmit {
                    usernameInFocus.toggle()
                }
            
            TextField("Add your password here...", text: $userName)
                .padding(.leading)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.gray.brightness(0.3))
                .focused($passwordInFocus)
                .cornerRadius(10)
        }
        .padding(40 )
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.usernameInFocus = true
            }
        }
    }
}

struct FocusStates_Previews: PreviewProvider {
    static var previews: some View {
        FocusStates()
    }
}
