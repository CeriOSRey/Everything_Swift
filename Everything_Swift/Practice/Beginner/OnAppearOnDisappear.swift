//
//  OnAppearOnDisappear.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-05.
//

import SwiftUI

struct OnAppearOnDisappear: View {
    
    @State var myText: String = "Start text."
    @State var count: Int = 0
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                Text(myText)
                LazyVStack {
                    ForEach(0..<50) { _ in
                        RoundedRectangle(cornerRadius: 25)
                            .frame(height: 200)
                            .padding()
                            .onAppear {
                                count += 1
                                // could possibly download from API here
                            }
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    myText = "This is the new text!"
                }
            }
            .onDisappear {
                myText = "Ending text."
            }
            .navigationTitle("On Appear: \(count)")
        }
    }
}

struct OnAppearOnDisappear_Previews: PreviewProvider {
    static var previews: some View {
        OnAppearOnDisappear()
    }
}
