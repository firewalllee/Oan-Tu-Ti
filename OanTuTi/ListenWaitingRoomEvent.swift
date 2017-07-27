//
//  ListenWaitingRoomEvent.swift
//  OanTuTi
//
//  Created by Phuc on 11/12/16.
//  Copyright © 2016 Phuc. All rights reserved.
//

class ListenPlayerLeaveRoomEvent: ListenEvent {
    
    var commandListenEvent: ListenResponse = ListenResponse(command: Commands.Instance.PlayerLeaveRoom, notificationCommand: NotificationCommands.Instance.waitingDelegate)
    
    func listenEvent() {
        commandListenEvent.listenResponse()
    }
}

class ListenClientLeaveRoomEvent: ListenEvent {
    
    var commandListenEvent: ListenResponse = ListenResponse(command: Commands.Instance.ClientLeaveRoomRs, notificationCommand: NotificationCommands.Instance.leaveRoomDelegate)
    
    func listenEvent() {
        commandListenEvent.listenResponse()
    }
}


class ListenClientUpdateRoomInfoEvent: ListenEvent {
    
    var commandListenEvent: ListenResponse = ListenResponse(command: Commands.Instance.ClientUpdateRoomInfoRs, notificationCommand: NotificationCommands.Instance.updateRoomInfoDelegate)
    
    func listenEvent() {
        commandListenEvent.listenResponse()
    }
}

class ListenClientReadyEvent: ListenEvent {
    
    var commandListenEvent: ListenResponse = ListenResponse(command: Commands.Instance.ClientReadyRs, notificationCommand: NotificationCommands.Instance.readyDelegate)
    
    func listenEvent() {
        commandListenEvent.listenResponse()
    }
}


class ListenClientStartGameEvent: ListenEvent {
    
    var commandListenEvent: ListenResponse = ListenResponse(command: Commands.Instance.ClientsStartPlayingRs, notificationCommand: NotificationCommands.Instance.clientSartgameDelegate)
    
    func listenEvent() {
        commandListenEvent.listenResponse()
    }
}

//class ListenWaitingRoomEvent {
//    static func listenEvent() {
//
//        ListenPlayerLeaveRoomEvent.listenEvent()
//        ListenClientLeaveRoomEvent.listenEvent()
//        ListenClientUpdateRoomInfoEvent.listenEvent()
//        ListenClientReadyEvent.listenEvent()
//        ListenClientStartGameEvent.listenEvent()
//    }
//}

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




