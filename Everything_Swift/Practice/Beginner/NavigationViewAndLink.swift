//
//  NavigationViewAndLink.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-04.
//

import SwiftUI

// There should only be one NavigationView in each heirarchy of Views

struct NavigationViewAndLink: View {
    var body: some View {
        NavigationView {
            ScrollView {
                NavigationLink("Hello World!") {
                    MyOtherScreen()
                }
                Text("Hello World!")
                Text("Hello World!")
                Text("Hello World!")
            }
            .navigationTitle("Title")
//            .navigationBarTitleDisplayMode(.automatic)  // automatically go from Large to Inline when scrolling down
        }
        
    }
}

struct MyOtherScreen: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color.green
                .ignoresSafeArea()
                .navigationTitle("Green Screen")
//                .navigationBarHidden(true)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        NavigationLink {
                            Text("4th screen")
                        } label: {
                            Image(systemName: "person.fill")

                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink {
                            Text("5th screen")
                        } label: {
                            Image(systemName: "gear")

                        }
                    }
                }
            VStack(spacing: 20) {
                Button("Back") {
                    dismiss()
                }
                NavigationLink("Click Here") {
                    Text("Third Screen!")
                }
            }
        }
    }
}

struct NavigationViewAndLink_Previews: PreviewProvider {
    static var previews: some View {
        NavigationViewAndLink()
//        MyOtherScreen()
    }
}
