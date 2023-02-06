//
//  Pickers.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-05.
//

import SwiftUI

struct Pickers: View {
    
    @State var selection: String = "1"
    let filterOption: [String] = [
        "Most Recent", "Most Popular", "Most Liked"
    ]
    @State var backgroundColor: Color = .gray
    @State var datePicked: Date = Date()
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            
            VStack {
                Picker(
                    selection: $selection) {
                        ForEach(filterOption, id: \.self) { option  in
                            Text(option)
                                .tag(option)
                        }
                    } label: {
                        HStack {
                            Text(selection)
                        }
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .padding(.horizontal)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .shadow(color: Color.blue.opacity(0.3), radius: 10, x: 0, y: 10)
                    }
                Spacer()
                ///color picker
                ColorPicker(selection: $backgroundColor,
                            supportsOpacity: true) {
                    Text(backgroundColor.description)
                }
                Spacer()
                ///date picker
                ///
                DatePicker(selection: $datePicked) {
                    Text(datePicked.description)
                }
            }
        }
        

        
//        VStack {
//            HStack {
//                Text("Age")
//                Text(selection)
//            }
//
//
//            Picker(selection: $selection) {
//                ForEach(0..<50) { number in
//                    Text("\(number)")
//                        .font(.headline)
//                        .foregroundColor(.red)
//                        .tag("\(number)")
//                }
//            } label: {
//                Text("Picker")
//            }
//
//        }
        

    }
}

struct Pickers_Previews: PreviewProvider {
    static var previews: some View {
        Pickers()
    }
}
