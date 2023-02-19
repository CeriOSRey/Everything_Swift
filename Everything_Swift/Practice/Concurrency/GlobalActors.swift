//
//  GlobalActors.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-17.
//

import SwiftUI

/// **GlobalActors are singletons that are thread safe**
/// **MainActors are globalactors that ensures a property or method is ran in the main thread


@globalActor struct MyFirstGlobalActor {
    static var shared = MyNewDataManager()
    private init() {}
}

actor MyNewDataManager {
    func getDataFromDatabase() -> [String] {
        return ["One", "Two", "Three"]
    }
}

class GlobalActorVM: ObservableObject {
    @Published var dataArray: [String] = []
    let manager = MyFirstGlobalActor.shared
    
    @MyFirstGlobalActor   //add annotation and now this is a async function
    func getData() {
        
        Task {
            let data = await manager.getDataFromDatabase()
            self.dataArray.append(contentsOf: data)
        }
    }
}

struct GlobalActors: View {
    
    @StateObject private var vm = GlobalActorVM()
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(vm.dataArray, id: \.self) {
                    Text($0)
                        .font(.headline)
                }
            }
            .onAppear {
                Task {
                    await vm.getData()
                }
            }
//            .task {
//                await vm.getData()
//            }
        }
    }
}

struct GlobalActors_Previews: PreviewProvider {
    static var previews: some View {
        GlobalActors()
    }
}
