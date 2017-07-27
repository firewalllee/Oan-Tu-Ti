//
//  ListenPlayingEvent.swift
//  OanTuTi
//
//  Created by Phuc on 11/16/16.
//  Copyright © 2016 Phuc. All rights reserved.
//

class ListenPlayingEvent: ListenEvent {
    
    var commandListenEvent: ListenResponse = ListenResponse(command: Commands.Instance.ClientSubmitSelectionRs, notificationCommand: NotificationCommands.Instance.submitDelegate)
    
    func listenEvent() {
        commandListenEvent.listenResponse()
    }
}

//class ListenPlayingEvent {
//    
//    init() {}
//    
//    static func ListenPlayingResponse() {
//        
//        SocketIOManager.Instance.socket.on(Commands.Instance.ClientSubmitSelectionRs) { (data, ack) in
//            if let response:Dictionary<String, Any> = data[0] as? Dictionary<String, Any> {
//                NotificationCenter.default.post(name: NotificationCommands.Instance.submitDelegate, object: response)
//            }
//        }
//    }
//}
