//
//  AsyncAwait.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-02.
//

import SwiftUI

class AsyncAwaitVM: ObservableObject {
    
    @Published var dataArray: [String] = []
    
    func addTitle1() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.dataArray.append("Title1 : \(Thread.current)")
        }
    }
    
    func addTitle2() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            let title = "Title2 : \(Thread.current)"
            DispatchQueue.main.async {
                self.dataArray.append(title)
                
                let title3 = "Title3 : \(Thread.current)"
                self.dataArray.append(title3)

            }
         }
    }
    
    func addAuthor1() async {
        let author1 = "Author1: \(Thread.current)"
        self.dataArray.append(author1)
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        
        let author2 = "Author2: \(Thread.current)"
        
        // Jump back to mainthread with this MainActor.run({})
        
        await MainActor.run(body: { [weak self] in
            self?.dataArray.append((author2))
            let author3 = "Author3: \(Thread.current)"
            self?.dataArray.append(author3)
        })
        
    }
    
}

struct AsyncAwait: View {
    
    @StateObject private var vm = AsyncAwaitVM()
    
    var body: some View {
        List {
            ForEach(vm.dataArray, id: \.self) { data in
                Text(data)
            }
        }
        .onAppear {
            Task {
                await vm.addAuthor1()
            }
//            vm.addTitle1()
//            vm.addTitle2()
        }
    }
}

struct AsyncAwait_Previews: PreviewProvider {
    static var previews: some View {
        AsyncAwait()
    }
}
