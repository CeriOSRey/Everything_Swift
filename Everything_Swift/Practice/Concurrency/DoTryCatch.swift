//
//  DoTryCatch.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-02.
//

import SwiftUI

// do-catch
// try
// throws

class DoCatchTryThrowsManager {
    
    let isActive: Bool = false
    
    func getTitle() -> (title: String?, error: Error?) {
        if isActive {
            return ("New Text.", nil)
        } else {
            return (nil, URLError(.badURL))
        }
    }
    
    // Using Result Generic
    func getTitle2() -> Result<String, Error> {
        if isActive {
            return .success("New Text")
        } else {
            return .failure(URLError(.badURL))
        }
    }
    
    // Using Do Try Catch
    func getTitle3() throws -> String {
        if isActive {
            return "New Text"
        } else {
            throw URLError(.badURL)
        }
    }
    
    // Using Do Try Catch
    func getTitle4() throws -> String {
        if isActive {
            return "Final Text"
        } else {
            throw URLError(.badURL)
        }
    }
}

class DoCatchTryThowsViewModel: ObservableObject {
    @Published var text: String = "Starting text."
    let manager = DoCatchTryThrowsManager()
    func fetchTitle() {
        /*
        let returnedTuple = manager.getTitle()
        if let newTitle = returnedTuple.title {
            self.text = newTitle
        } else if let error = returnedTuple.error {
            self.text = error.localizedDescription
        }
         */  // Using if statements
        /*
        let result = manager.getTitle2()
        
        switch result {
        case .success(let newTitle):
            self.text = newTitle
        case .failure(let error):
            self.text = error.localizedDescription
        }
         */  // Using Result
        
        // if you make the try an optional then catch block will never execute and doesnt need to be inside the do block
        let newTitle = try? manager.getTitle3()

        do {
            
            // if any of the try fails it will execute the catch block unless the try is optional
            
            let newTitle = try? manager.getTitle3()
            if let title = newTitle {
                self.text = title
            }
            
            let finalTitle = try manager.getTitle4()
            self.text = finalTitle
        } catch let error {
            self.text = error.localizedDescription
        }
        
    }
}

struct DoTryCatch: View {
    @StateObject private var vm: DoCatchTryThowsViewModel = DoCatchTryThowsViewModel()
    var body: some View {
        Text(vm.text)
            .frame(width: 300, height: 300)
            .background(Color.blue)
            .onTapGesture {
                vm.fetchTitle()
            }
    }
}

struct DoTryCatch_Previews: PreviewProvider {
    static var previews: some View {
        DoTryCatch()
    }
}
