//
//  ListenProfileEvent.swift
//  OanTuTi
//
//  Created by Phuc on 11/12/16.
//  Copyright © 2016 Phuc. All rights reserved.
//

import Foundation

class ListenProfileEvent: ListenEvent{
    
    static var commandListenEvent: ListenResponse = ListenResponse(command: Commands.Instance.ClientUpdateProfileRs, notificationCommand: NotificationCommands.Instance.profileDelegate)
    
    static func listenEvent() {
        commandListenEvent.listenResponse()
    }
}

//class ListenProfileEvent {
//    
//    init() {}
//    
//    static func ListenProfileResponse() {
//        SocketIOManager.Instance.socket.on(Commands.Instance.ClientUpdateProfileRs) { (data, ack) in
//            
//            if let response:Dictionary<String, Any> = data[0] as? Dictionary<String, Any> {
//                
//                //Send delegate to Profile screen
//                NotificationCenter.default.post(name: NotificationCommands.Instance.profileDelegate, object: response)
//            }
//        }
//    }
//}


