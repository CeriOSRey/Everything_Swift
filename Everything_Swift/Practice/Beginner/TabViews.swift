//
//  TabViews.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-05.
//

import SwiftUI

struct TabViews: View {

    @State var selectedTab: Int = 0
    
    let icons: [String] = [
        "heart.fill", "globe", "house.fill", "person.fill"
    ]
    
    var body: some View {
        TabView {
            ForEach(icons, id: \.self) { icon in
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, minHeight: 300)
            }
        }
        .background(
            RadialGradient(colors: [.red, .blue], center: .center, startRadius: 5, endRadius: 300)
        )
        .frame(height: 300)
        .tabViewStyle(.page)
    }
    
//    /// Tab Bar
//    var body: some View {
//        VStack {
//
//            TabView(selection: $selectedTab) {
//                HomeView(selectedTab: $selectedTab)
//                    .tabItem {
//                        Image(systemName: "house.fill")
//                        Text("Home")
//                    }
//                    .tag(0)
//                BrowseView()
//                    .tabItem {
//                        Image(systemName: "globe")
//                        Text("Browse")
//                    }
//                    .tag(1)
//                ProfileView()
//                    .tabItem {
//                        Image(systemName: "person.fill")
//                        Text("Profile")
//                    }
//                    .tag(2)
//            }
//        }
//    }
}

struct TabViews_Previews: PreviewProvider {
    static var previews: some View {
        TabViews()
    }
}

struct HomeView: View {
    
    @Binding var selectedTab: Int
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            VStack {
                Text("Home Tab")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                
                Button {
                    selectedTab = 2
                } label: {
                    Text("Go to profile")
                        .font(.headline)
                        .padding()
                        .padding(.horizontal)
                        .cornerRadius(10)
                }
            }
        }
    }
}

struct BrowseView: View {
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            Text("Browse Tab")
                .font(.largeTitle)
                .foregroundColor(.black)
        }
    }
}

struct ProfileView: View {
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            Text("Profile Tab")
                .font(.largeTitle)
                .foregroundColor(.black)
        }
    }
}
