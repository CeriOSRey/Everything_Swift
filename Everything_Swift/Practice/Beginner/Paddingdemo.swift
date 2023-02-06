//
//  Paddingdemo.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-04.
//

import SwiftUI

// adds padding between the view size and intrincsic size

struct Paddingdemo: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    //            .background(Color.yellow)
    //            .padding()
    ////            .padding(.all, 10)  //long way
    //            .padding(.leading, 20) // stacking the paddings
    //            .background(Color.blue)
            //-------------------------
    //            .font(.largeTitle)
    //            .fontWeight(.semibold)
    //            .frame(maxWidth: .infinity, alignment: .leading)
    ////            .background(Color.red)
    //            .padding(.leading, 20)
            //------------------------
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.bottom, 10)
//                .frame(maxWidth: .infinity, alignment: .leading)
//    //            .background(Color.red)
//            .padding(.leading, 20)
            
            Text("This is the description of what we will do on this screen. It is multiple lines and we will align the text to the leading edge.")
        }
        .padding()
        .padding(.vertical, 30)
        .background(
            Color.white
                .cornerRadius(10)
                .shadow(
                    color: Color.black.opacity(0.3),
                    radius: 10,
                    x: 0, y: 10)
        )
        .padding(.horizontal, 10)
    }
}

struct Paddingdemo_Previews: PreviewProvider {
    static var previews: some View {
        Paddingdemo()
    }
}
