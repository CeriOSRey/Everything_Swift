//
//  VHZStacksdemo.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-04.
//

import SwiftUI

struct VHZStacksdemo: View {
    //VStack -> Vertical
    //HStack -> Horizontal
    //ZStack -> zIndex (back to front)
    
    // Try to use background() over ZStacks for 2-3 layers. For complex layers use Zstacks.
    
    // LazyVStack - so you only load/download data when RoundedRectangle is in view.
    
    var body: some View {
        VStack(spacing: 50) {
            ZStack {
                Circle()
                    .frame(width: 100, height: 100)
                Text("1")
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
            
            
            Text("1")
                .font(.title)
                .foregroundColor(.white)
                .background(
                    Circle()
                        .frame(width: 100, height: 100)
                )
        }
    }
}

struct VHZStacksdemo_Previews: PreviewProvider {
    static var previews: some View {
        VHZStacksdemo()
    }
}
