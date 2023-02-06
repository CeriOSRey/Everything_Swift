//
//  Buttonsdemo.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-04.
//

import SwiftUI

struct Buttonsdemo: View {
    
    @State var title = "This is the title"
    var body: some View {
        VStack(spacing: 20) {
            
            Text(title)
            
            Button("Press me!") {
                self.title = "Button was pressed"
            }
            .tint(.red)  // replacement of .accentColor
            
            Button {
                self.title = "Button 2 was pressed"
            } label: {
                Text("Button 2".uppercased()) // more customizable
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal, 20)
                    .background(
                        Color.blue
                            .cornerRadius(10)
                            .shadow(radius: 10)
                    )
            }
            Button {
                self.title = "Button 3 pressed"
            } label: {
                Circle()
                    .fill(Color.white)
                    .frame(width: 75, height: 75)
                    .shadow(radius: 10)
                    .overlay {
                        Image(systemName: "heart.fill")
                            .font(.largeTitle)
                            .foregroundColor(.red)
                    }
            }
            
            Button {
                self.title = "Button 4 was pressed"
            } label: {
                Text("Finish".uppercased())
                    .font(.caption)
                    .foregroundColor(.gray)
                    .foregroundColor(.gray)
                    .padding()
                    .padding(.horizontal, 10)
                    .background(
                        Capsule()
                            .stroke(Color.gray, lineWidth: 2.0)
                    )
            }
        }
    }
}

struct Buttonsdemo_Previews: PreviewProvider {
    static var previews: some View {
        Buttonsdemo()
    }
}
