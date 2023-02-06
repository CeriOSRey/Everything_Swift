//
//  Alerts.swift
//  Everything_Swift
//
//  Created by Rey Cerio on 2023-02-05.
//

import SwiftUI

struct Alerts: View {
    
    enum MyAlerts {
        case success
        case error
    }
    
    @State var showAlert: Bool = false
    @State var alerttype: MyAlerts?
//    @State var alertTitle: String = ""
//    @State var alertMessage: String = ""
    @State var backgroundColor: Color = .yellow
    
    func getAlert(_ alertTitle: String, _ alertMessage: String) -> Alert {
//        return Alert(title: Text("There was an error"))

//        return Alert(title: Text("Second alert"),
//              message: Text("Here we will describe the error."),
//              primaryButton: .destructive(Text("Delete"), action: {
//            backgroundColor = .red
//        }),
//              secondaryButton: .cancel())


        return Alert(title: Text(alertTitle),
                     message: Text(alertMessage),
                     dismissButton: .destructive(Text("Delete"),
                                                 action: { backgroundColor = .red
                                                })
        )
    }
    
    func getAlertWithEnum() -> Alert {

        
        switch alerttype {
        case .error:
            return Alert(title: Text("Error uploading video"))
        case .success:
            return Alert(title: Text("Successfully uploaded video"))
        default:
            return Alert(title: Text("Error"))
        }
        
    }
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            
            Button("Click") {
                alerttype = .success
                //                alertTitle = "Error uploading video"
                //                alertMessage = "There was an error uploading the video. Try again."
                showAlert.toggle()
            }
            .alert(isPresented: $showAlert) {
                //                getAlert(alertTitle, alertMessage)
                getAlertWithEnum()
            }
        }
    }
}

struct Alerts_Previews: PreviewProvider {
    static var previews: some View {
        Alerts()
    }
}
