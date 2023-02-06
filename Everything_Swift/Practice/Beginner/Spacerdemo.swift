//
//  Spacerdemo.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-04.
//

import SwiftUI

struct Spacerdemo: View {
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                
                Image(systemName: "xmark")
                Spacer()
                    .frame(height: 10)
                    .background(Color.orange)
                Image(systemName: "gear")
                
    //            Spacer()
    //                .frame(height: 10)
    //                .background(Color.white)
    //            Rectangle()
    //                .frame(width: 100, height: 100)
    //            Spacer()
    //                .frame(height: 10)
    //                .background(Color.white)
    //            Rectangle()
    //                .fill(Color.red)
    //                .frame(width: 100, height: 100)
    //            Spacer()
    //                .frame(height: 10)
    //                .background(Color.white)
    //            Rectangle()
    //                .fill(Color.green)
    //                .frame(width: 100, height: 100)
    //            Spacer()
    //                .frame(height: 10)
    //                .background(Color.white)
            }
            .font(.title)
    //        .background(Color.yellow)
            .padding(.horizontal)
    //        .background(Color.blue)
            
            Spacer()
                .frame(width: 10)
                .background(Color.orange)
            
            Rectangle()
                .frame(height: 55)
        }
        .background(Color.yellow)
    }
}

struct Spacerdemo_Previews: PreviewProvider {
    static var previews: some View {
        Spacerdemo()
    }
}
