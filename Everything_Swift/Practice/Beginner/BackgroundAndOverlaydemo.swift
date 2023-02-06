//
//  BackgroundAndOverlaydemo.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-04.
//

import SwiftUI

struct BackgroundAndOverlaydemo: View {
    var body: some View {
        
        // Try to use background() over ZStacks for 2-3 layers.
        
        VStack {
            Image(systemName: "heart.fill")
                .font(.system(size: 40))
                .foregroundColor(Color.white)
                .background(
                    Circle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [.red, .blue]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing)
                        )
                        .frame(width: 100, height: 100)
                        .shadow(color: .purple, radius: 10, x: 0.0, y: 10)
                        .overlay(
                            Circle()
                                .fill(Color.blue)
                                .frame(width: 35, height: 35)
                                .overlay(
                                    Text("5")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                )
                                .shadow(color: Color(hue: 0.834, saturation: 1.0, brightness: 0.808),
                                        radius: 10,
                                        x: 5,
                                        y: 5),
                            alignment: .bottomTrailing
                            
                        )
                )
            
            
//            // overlays and backgrounds also have alignment params we can use.
//            Rectangle()
//                .frame(width: 100, height: 100)
//                .overlay(
//                    Rectangle()
//                        .fill(Color.blue)
//                        .frame(width: 50, height: 50),
//                    alignment: .center
//                )
//                .background(
//                    Rectangle()
//                        .fill(Color.red)
//                        .frame(width: 150, height: 150),
//                    alignment: .center
//                )
            
            
//            Text("Hello World!")
//                .background(
//    //                Color.red
//    //                LinearGradient(
//    //                    gradient: Gradient(colors: [.red, .blue]),
//    //                    startPoint: .leading,
//    //                    endPoint: .trailing)
//                    Circle()
//                        .fill(
//                            LinearGradient(
//                                gradient: Gradient(colors: [.red, .blue]),
//                                startPoint: .leading,
//                                endPoint: .trailing)
//                        )
//                        .frame(width: 100, height: 100, alignment: .center)
//                )
//                .background(
//                    Circle()
//                        .fill(
//                            LinearGradient(
//                                gradient: Gradient(colors: [.red, .blue]),
//                                startPoint: .leading,
//                                endPoint: .trailing)
//                        )
//                        .frame(width: 120, height: 120, alignment: .center)
//            )
//            Circle()
//                .fill(Color.pink)
//                .frame(width: 100, height: 100, alignment: .bottom)
//                .overlay(   //overlay adds a view in front
//                    Text("1")
//                        .font(.largeTitle)
//                        .foregroundColor(.white)
//                )
//                .background(
//                    Circle()
//                        .fill(Color.purple)
//                        .frame(width: 110, height: 110)
//                )
        }
    }
}

struct BackgroundAndOverlaydemo_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundAndOverlaydemo()
    }
}
