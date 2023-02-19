//
//  Sendables.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-17.
//

import SwiftUI

/// ** Sendable ensures that an object is thread safe before sending it into a concurrent task/object


actor CurrentUserManager {
        
    func updateDatabase(_ userInfo: MyUserInfo) {
        
    }
}

struct MyUserInfo: Sendable {
    let name: String
}

final class MyUserClassInfo: Sendable {
    /// can not have a var to conform to Sendable
    /// must be final
    /// have a desinated Queue if we plan on mutating any properties
    /// **use structs or actors if youre going to use Sendable conformance **
    
    private let name: String = ""
    
    // MARK: - does not conform to sendable
//    let queue = DispatchQueue(label: "com.MyApp.MyClassUserInfo")
//
//
//    func updateName() {
//        queue.async {
//            self.name = "name"
//        }
//    }
}

class SendableVM: ObservableObject {
    
    let manager = CurrentUserManager()
    
    func updateCurrentUserInfo() async {
        let info = MyUserInfo(name: "Something")
        
        await manager.updateDatabase(info)
    }
    
}

struct Sendables: View {
    
    @StateObject private var vm = SendableVM()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .task {
                
            }
    }
}

struct Sendables_Previews: PreviewProvider {
    static var previews: some View {
        Sendables()
    }
}
