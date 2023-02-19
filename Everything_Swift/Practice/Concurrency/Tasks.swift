//
//  Tasks.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-16.
//

import SwiftUI

/// Priorities are like QoS


class TasksVM: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var image2: UIImage? = nil
    
    func fetchImage() async throws {
        do {
            guard let url = URL(string: "https://picsum.photos/200") else { return }
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let code = response as? HTTPURLResponse,
                  code.statusCode >= 200 && code.statusCode < 300
            else { return }
            self.image = UIImage(data: data)
            
        } catch let error {
            throw error
        }
    }
    
    func fetchImage2() async throws {
        do {
            //MARK: - check if task is cancelled
            /*
             forEach(array) {
                Task.checkCancellation()
             }
             */
            
            
            
            guard let url = URL(string: "https://picsum.photos/200") else { return }
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let code = response as? HTTPURLResponse,
                  code.statusCode >= 200 && code.statusCode < 300
            else { return }
            self.image2 = UIImage(data: data)
            
        } catch let error {
            throw error
        }
    }
}

struct Tasks: View {
    
    @StateObject var vm = TasksVM()
    @State var fetchTask: Task<(), Error>? = nil
    
    var body: some View {
        VStack(spacing: 40) {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
            
            if let image = vm.image2 {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
        }
        .task {
            // MARK: - you can also just call this instead of calling Task{}
            // Using the modifier also automatically cancels the task
            
            /// Task Cancellation
            /*
            Tasks include a shared mechanism for indicating cancellation, but not a shared implementation for how to handle cancellation. Depending on the work you’re doing in the task, the correct way to stop that work varies. Likewise, it’s the responsibility of the code running as part of the task to check for cancellation whenever stopping is appropriate. In a long-task that includes multiple pieces, you might need to check for cancellation at several points, and handle cancellation differently at each point. If you only need to throw an error to stop the work, call the Task.checkCancellation() function to check for cancellation. Other responses to cancellation include returning the work completed so far, returning an empty result, or returning nil.
            Cancellation is a purely Boolean state; there’s no way to include additional information like the reason for cancellation. This reflects the fact that a task can be canceled for many reasons, and additional reasons can accrue during the cancellation process.
             */
            
            try? await vm.fetchImage()
        }
//        .onDisappear {
//            task?.cancel()
//        }
//        .onAppear {
//
////            Task {
////                // synchronous inside same task
////                try? await vm.fetchImage()
////                try? await vm.fetchImage2()
////            }
//
////            // asynchronous inside different task
////            Task {
////
////                try? await vm.fetchImage2()
////            }
////            Task {
////                try? await vm.fetchImage()
////            }
//
//
//            Task(priority: .low) {
//                try await Task.sleep(nanoseconds: 2_000_000_000)    // putting a delay
//                await Task.yield() // delaying task if other tasks exists
//                print("Low: \(Thread.current) : \(Task.currentPriority)")
//            }
//
//        //MARK: - To cancel task assign it to a variable then cancel it in the .onDisappear()
//
//            self.fetchTask = Task(priority: .high) {
//                print("High: \(Thread.current) : \(Task.currentPriority)")
//            }
//
//            Task(priority: .background) {
//                print("Background: \(Thread.current) : \(Task.currentPriority)")
//            }
//
//            Task(priority: .medium) {
//                print("Medium: \(Thread.current) : \(Task.currentPriority)")
//            }
//
//            Task(priority: .userInitiated) {
//                print("UserInitiated: \(Thread.current) : \(Task.currentPriority)")
//            }
//
//            Task(priority: .background) {
//                print("Background: \(Thread.current) : \(Task.currentPriority)")
//            }
//
//            Task(priority: .utility) {
//                print("Utility: \(Thread.current) : \(Task.currentPriority)")
//            }
//
//            Task(priority: .none) {
//                print("None: \(Thread.current) : \(Task.currentPriority)")
//            }
//
//            Task(priority: .some(.utility)) {
//                print("Some: \(Thread.current) : \(Task.currentPriority)")
//            }
//        }
    }
}

struct Tasks_Previews: PreviewProvider {
    static var previews: some View {
        Tasks()
    }
}
