//
//  AsyncAwait.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-02.
//


///**Things to know about async/await:**
/*
 If you add an async keyword to your function, it can be called on a background thread even if you start the function from the Main Thread.
 If you run a code from Task, you can’t make any assumptions about the thread. It could be dispatched on any thread (unless it is started from the Main Actor).
 If you call await within an asynchronous function, it creates a suspension point that may switch execution to any pending code, even to the same function if it was called multiple times.
 If your asynchronous function resumes after await, the thread is not guaranteed to be the same as before await (unless you use @MainActor). Therefore, you should not make any assumptions about that.
 Because of internal thread management, when using Swift Concurrency, you should not mix it with classic synchronization methods like locks, semaphores, etc. It may result in an unexpected behavior because some of those features have implementations that rely on threads.
 If you add @MainActor attribute to a function, it is not the same as wrapping the whole method in DispatchQueue.main.async. If your method contains await keyword, the code will be split into two pieces – one before await and one after await, and as mentioned before, once the method hits await another pending call can start running even before the first one is finished. Therefore, you should not assume that the method will be fully processed before it is called again even when using @MainActor.

 */

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
    
    func addSomething() async {
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        let something1 = "Something1 : \(Thread.current)"
        await MainActor.run(body: {
            self.dataArray.append(something1)
            let something2 = "Something2: \(Thread.current)"
            self.dataArray.append(something2)
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
                await vm.addSomething()
                let finalText = "Final Text: \(Thread.current)"
                vm.dataArray.append(finalText)
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
