//
//  Actors.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-17.
//

import SwiftUI

/// 1. What is the problem that actors are solving - Data race.
/// 2. How was this problem solved before actors
///     - create a custom queue inside the class and run the methods inside the queue
/// 3. How actors can solve the problem

// Singleton
class MySharedClass {
    static let instance = MySharedClass()
    private init() {}
    private let queue = DispatchQueue(label: "com.appName.className")
    
    var data: [String] = []
    
    func getRandomData(completion: @escaping (String) -> ()) {
        queue.async { [weak self] in
            self?.data.append(UUID().uuidString)
            print(Thread.current)
            completion(self?.data.randomElement() ?? "")
        }
    }
}

// Actor solution
actor MySharedActor {
    static let instance = MySharedActor()
    private init() {}
    
    var data: [String] = []
    
    func getRandomData() -> String? {
        self.data.append(UUID().uuidString)
        print(Thread.current)
        return data.randomElement()
    }
    
    /// **Don't need await keyword. not Async by putting a nonisolated keyword**
    /// works on properties too
    /// You can NOT refer to isolated properties and methods inside a nonisolated method
    nonisolated func methodWeDontWantToBeAsync() -> String {
        return ""
    }
}

struct HomeTabView: View {
    
    let manager = MySharedClass.instance
    @State private var text: String = ""
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.8).ignoresSafeArea()
            Text(text)
                .font(.headline)
        }
        .onReceive(timer) { _ in
            manager.getRandomData { title in // Old solution
                self.text = title
            }
        }
    }
}

struct BrowseTabView: View {
    
    let manager = MySharedActor.instance
    @State private var text: String = ""
    let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Color.yellow.opacity(0.8).ignoresSafeArea()
            Text(text)
                .font(.headline)
        }
        .onReceive(timer) { _ in
            Task {
                guard let text = await manager.getRandomData() else { return }
                self.text = text
            }
        }
    }
}

struct Actors: View {
    var body: some View {
        TabView {
            HomeTabView()
                .tabItem{
                    Label("Home", systemImage: "house.fill")
                }
            BrowseTabView()
                .tabItem{
                    Label("Browse", systemImage: "magnifyingglass")
                }
        }
    }
}

struct Actors_Previews: PreviewProvider {
    static var previews: some View {
        Actors()
    }
}
