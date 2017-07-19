//
//  ListenWaitingRoomEvent.swift
//  OanTuTi
//
//  Created by Phuc on 11/12/16.
//  Copyright © 2016 Phuc. All rights reserved.
//

import Foundation

class ListenWaitingRoomEvent {
    static func listenEvent() {
        
        ListenPlayerLeaveRoomEvent.listenEvent()
        ListenClientLeaveRoomEvent.listenEvent()
        ListenClientUpdateRoomInfoEvent.listenEvent()
        ListenClientReadyEvent.listenEvent()
        ListenClientStartGameEvent.listenEvent()
    }
}


class ListenPlayerLeaveRoomEvent: ListenEvent {
    
    static var commandListenEvent: ListenResponse = ListenResponse(command: Commands.Instance.PlayerLeaveRoom, notificationCommand: NotificationCommands.Instance.waitingDelegate)
    
    static func listenEvent() {
        commandListenEvent.listenResponse()
    }
}

class ListenClientLeaveRoomEvent: ListenEvent {
    
    static var commandListenEvent: ListenResponse = ListenResponse(command: Commands.Instance.ClientLeaveRoomRs, notificationCommand: NotificationCommands.Instance.leaveRoomDelegate)
    
    static func listenEvent() {
        commandListenEvent.listenResponse()
    }
}


class ListenClientUpdateRoomInfoEvent: ListenEvent {
    
    static var commandListenEvent: ListenResponse = ListenResponse(command: Commands.Instance.ClientUpdateRoomInfoRs, notificationCommand: NotificationCommands.Instance.updateRoomInfoDelegate)
    
    static func listenEvent() {
        commandListenEvent.listenResponse()
    }
}

class ListenClientReadyEvent: ListenEvent {
    
    static var commandListenEvent: ListenResponse = ListenResponse(command: Commands.Instance.ClientReadyRs, notificationCommand: NotificationCommands.Instance.readyDelegate)
    
    static func listenEvent() {
        commandListenEvent.listenResponse()
    }
}


class ListenClientStartGameEvent: ListenEvent {
    
    static var commandListenEvent: ListenResponse = ListenResponse(command: Commands.Instance.ClientsStartPlayingRs, notificationCommand: NotificationCommands.Instance.clientSartgameDelegate)
    
    static func listenEvent() {
        commandListenEvent.listenResponse()
    }
}

//class ListenWaitingRoomEvent {
//    
//    init() {}
//    
//    static func ListenWaitingRoomResponse() {
//        
//        //Player leave room
//        SocketIOManager.Instance.socket.on(Commands.Instance.PlayerLeaveRoom) { (data, ack) in
//            if let response:Dictionary<String, Any> = data[0] as? Dictionary<String, Any> {
//                
//                //Send this delegate to Waiting room screen
//                NotificationCenter.default.post(name: NotificationCommands.Instance.waitingDelegate, object: response)
//            }
//        }
//        
//        //User leave room
//        SocketIOManager.Instance.socket.on(Commands.Instance.ClientLeaveRoomRs) { (data, ack) in
//            if let response:Dictionary<String, Any> = data[0] as? Dictionary<String, Any> {
//                NotificationCenter.default.post(name: NotificationCommands.Instance.leaveRoomDelegate, object: response)
//            }
//        }
//        
//        //Client Update room info
//        SocketIOManager.Instance.socket.on(Commands.Instance.ClientUpdateRoomInfoRs) { (data, ack) in
//            if let response:Dictionary<String, Any> = data[0] as? Dictionary<String, Any> {
//
//                NotificationCenter.default.post(name: NotificationCommands.Instance.updateRoomInfoDelegate, object: response)
//            }
//        }
//        
//        //Client Ready
//        SocketIOManager.Instance.socket.on(Commands.Instance.ClientReadyRs) { (data, ack) in
//            if let response:Dictionary<String, Any> = data[0] as? Dictionary<String, Any> {
//                
//                //Send to waiting room
//                NotificationCenter.default.post(name: NotificationCommands.Instance.readyDelegate, object: response)
//            }
//        }
//        
//        //Client start game
//        SocketIOManager.Instance.socket.on(Commands.Instance.ClientsStartPlayingRs) { (data, ack) in
//            if let response:Dictionary<String, Any> = data[0] as? Dictionary<String, Any> {
//                NotificationCenter.default.post(name: NotificationCommands.Instance.clientSartgameDelegate, object: response)
//            }
//        }
//    }
//}




