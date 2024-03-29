//
//  OnTapGesture.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-05.
//

import SwiftUI

struct OnTapGesture: View {
    
    @State var isSelected: Bool = false
    
    var body: some View {
        VStack(spacing: 40) {
            RoundedRectangle(cornerRadius: 25)
                .frame(height: 200)
                .foregroundColor(isSelected ? .green : .red)
            
            Button {
                isSelected.toggle()
            } label: {
                Text("Button")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(25)
            }
            
            Text("Tap Gesture")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(25)
//                .onTapGesture {
//                    isSelected.toggle()
//                }
                .onTapGesture(count: 3) {
                    // count parameter dictates how many taps before block executes
                    isSelected.toggle()
                }
            
            
            Spacer()
        }
        .padding(40)
    }
}

struct OnTapGesture_Previews: PreviewProvider {
    static var previews: some View {
        OnTapGesture()
    }
}
