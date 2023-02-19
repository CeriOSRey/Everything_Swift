//
//  AsyncPublishers.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-17.
//

import SwiftUI

/// Extension to @Published property wrapper to be used by new Swift Concurrency

actor AsyncPublisherDataManager {
    @Published var myData: [String] = []
    
    func addData() async {
        myData.append("Apple")
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        myData.append("Banana")
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        myData.append("Orange")
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        myData.append("Watermelon")
    }
}

class AsyncPublisherVM: ObservableObject {
    @Published var dataArray: [String] = []
    let manager = AsyncPublisherDataManager()
    
    init() {
        addSubscribers()
    }
    
    /// ** .values is the convenient property given to us by apple that is a AsyncPublisher
    ///  - basically let us subscribe to any @Published property inside the target object
    private func addSubscribers() {
        Task {
            /// ** You have to manually exit out of this loop with a break, return or whatever because this will infinitely subscribe to values
            for await value in await manager.$myData.values {
                await MainActor.run(body: {
                    self.dataArray = value
                })
            }
        }
    }
    
    func start() async {
        await manager.addData()
    }
}

struct AsyncPublishers: View {
    
    @StateObject private var vm = AsyncPublisherVM()
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(vm.dataArray, id: \.self) {
                    Text($0)
                        .font(.headline)
                }
            }
        }
        .task {
            await vm.start()
        }
    }
    
    
}

struct AsyncPublishers_Previews: PreviewProvider {
    static var previews: some View {
        AsyncPublishers()
    }
}
