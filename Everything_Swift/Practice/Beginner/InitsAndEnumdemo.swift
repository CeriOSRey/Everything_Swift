//
//  InitsAndEnumdemo.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-04.
//

import SwiftUI

struct InitsAndEnumdemo: View {
    
    let backgroundColor: Color
    let count: Int
    let title: String
    
    init(count: Int, fruit: Fruit) {
        self.count = count
        switch fruit {
        case .orange:
            self.title = "Oranges"
            self.backgroundColor = .orange
        case .apple:
            self.title = "Apples"
            self.backgroundColor = .red
        }
    }
    
    enum Fruit {
        case apple
        case orange
    }
    
    var body: some View {
        VStack {
            Text("\(count)")
                .font(.largeTitle)
                .foregroundColor(.white)
                .underline()
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
        }
        .frame(width: 150, height: 150)
        .background(backgroundColor)
        .cornerRadius(10)
    }
}

struct InitsAndEnumdemo_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            InitsAndEnumdemo(count: 60, fruit: .orange)
            InitsAndEnumdemo(count: 60, fruit: .apple)
        }

    }
}
