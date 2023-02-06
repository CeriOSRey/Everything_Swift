//
//  BackgroundMaterials.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-05.
//

import SwiftUI

/*
 regularMaterial
 thickMaterial
 thinMaterial
 ultraThinMaterial
 ultraThickMaterial
 */

struct BackgroundMaterials: View {
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 50, height: 4)
                    .padding()
                Spacer()
            }
            .frame(height: 350)
            .frame(maxWidth: .infinity)
            .background(.ultraThinMaterial)   // this is one of the material options
            .cornerRadius(30)
        }
        .ignoresSafeArea()
        .background(
            Image("hmmm")
                .resizable()
                .scaledToFill()
        )
    }
}

struct BackgroundMaterials_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundMaterials()
    }
}
