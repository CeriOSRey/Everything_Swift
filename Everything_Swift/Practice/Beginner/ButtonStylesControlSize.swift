//
//  ButtonStylesControlSize.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-05.
//

import SwiftUI

/// **You can change the accent color inside the Assets folder

struct ButtonStylesControlSize: View {
    var body: some View {
        VStack(spacing: 20) {
            
            /// ** Button Style **
            
            Button(action: {
                
            }, label: {
                Text("Button Title")
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
            })
            .buttonStyle(.borderedProminent)
            
            Button("Button Title") {
                
            }
            .font(.headline)
            .frame(maxWidth: .infinity)
            .buttonStyle(.plain)
            
            Button("Button Title") {
                
            }
            .font(.headline)
            .frame(maxWidth: .infinity)
            .buttonStyle(.bordered)
            
            Button("Button Title") {
                
            }
            .font(.headline)
            .frame(maxWidth: .infinity)
            .buttonStyle(.borderedProminent)
            
            Button("Button Title") {
                
            }
            .font(.headline)
            .frame(maxWidth: .infinity)
            .buttonStyle(.borderless)
            
            Button("Button Title") {

                /// ** Control Size **
            }
            .font(.headline)
            .frame(maxWidth: .infinity)
            .controlSize(.large)
            .buttonStyle(.borderedProminent)

            
            Button("Button Title") {
                
            }
            .font(.headline)
            .frame(maxWidth: .infinity)
            .controlSize(.regular)
            .buttonStyle(.borderedProminent)
            
            Button("Button Title") {
                
            }
            .font(.headline)
            .frame(maxWidth: .infinity)
            .controlSize(.small)
            .buttonStyle(.borderedProminent)
            
            Button("Button Title") {
                
            }
            .font(.headline)
            .frame(maxWidth: .infinity)
            .controlSize(.mini)
            .buttonStyle(.borderedProminent)
        }
    }
}

struct ButtonStylesControlSize_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStylesControlSize()
    }
}
