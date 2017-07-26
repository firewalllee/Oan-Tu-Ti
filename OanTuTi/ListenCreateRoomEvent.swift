//
//  ListenCreateRoomEvent.swift
//  OanTuTi
//
//  Created by beesightsoft on 7/20/17.
//  Copyright © 2017 Phuc. All rights reserved.
//

import Foundation

class ListenCreateRoomEvent {
    
    static func listenEvent() {
        
        ListenCreateRoom.listenEvent()
        ListenClientJoinRoom.listenEvent()
        
    }
}


class ListenCreateRoom: ListenEvent {
    
    static var commandListenEvent: ListenResponse = ListenResponse(command: Commands.Instance.ClientCreateRoomRs, notificationCommand: NotificationCommands.Instance.createRoomDelegate)
    
    static func listenEvent() {
        commandListenEvent.listenResponse()
    }
}

class ListenClientJoinRoom: ListenEvent {
    
    static var commandListenEvent: ListenResponse = ListenResponse(command: Commands.Instance.ClientJoinRoomRs, notificationCommand: NotificationCommands.Instance.joinRoomDelegate)
    
    static func listenEvent() {
        commandListenEvent.listenResponse()
    }
}


//func ListenCreateRoom() {
//    
//    SocketIOManager.Instance.socket.on(Commands.Instance.ClientCreateRoomRs) { (data, ack) in
//        
//        if let response:Dictionary<String, Any> = data[0] as? Dictionary<String, Any> {
//            
//            //Send to rooms list screen an event when user create room
//            NotificationCenter.default.post(name: NotificationCommands.Instance.createRoomDelegate, object: response)
//        }
//    }
//    
//    SocketIOManager.Instance.socket.on(Commands.Instance.ClientJoinRoomRs) { (data, ack) in
//        if let response:Dictionary<String, Any> = data[0] as? Dictionary<String, Any> {
//            NotificationCenter.default.post(name: NotificationCommands.Instance.joinRoomDelegate, object: response)
//        }
//    }
//}
