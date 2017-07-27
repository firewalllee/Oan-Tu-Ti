//
//  ListenRegisterEvent.swift
//  OanTuTi
//
//  Created by Phuc on 11/12/16.
//  Copyright © 2016 Phuc. All rights reserved.
//

class ListenRegisterEvent: ListenEvent {
    
    var commandListenEvent: ListenResponse = ListenResponse(command: Commands.Instance.ClientSignUpRs, notificationCommand: NotificationCommands.Instance.signupDelegate)
    
    func listenEvent() {
        commandListenEvent.listenResponse()
    }
}

//class ListenRegisterEvent {
//    
//    init() {}
//    
//    static func ListenRegisterResponse() {
//     
//        SocketIOManager.Instance.socket.on(Commands.Instance.ClientSignUpRs) { (data, ack) in
//            
//            if let response:Dictionary<String, Any> = data[0] as? Dictionary<String, Any> {
//                
//                //Send delegate to Register screen
//                NotificationCenter.default.post(name: NotificationCommands.Instance.signupDelegate, object: response)
//            }
//        }
//    }
//    
//    
//}
//

