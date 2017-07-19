//
//  ListenEvent.swift
//  OanTuTi
//
//  Created by beesightsoft on 7/19/17.
//  Copyright © 2017 Phuc. All rights reserved.
//

import Foundation


class ListenResponse {
    let command: String?
    let notificationCommand: Notification.Name
    
    init(command: String, notificationCommand: Notification.Name) {
        self.command = command
        self.notificationCommand = notificationCommand
    }

    func listenResponse() {
        SocketIOManager.Instance.socket.on(self.command ?? "") { (data, ack) in
            
            if let response:Dictionary<String, Any> = data[0] as? Dictionary<String, Any> {
                
                //Send delegate to Register screen
                NotificationCenter.default.post(name: self.notificationCommand, object: response)
            }
        }
    }
}

protocol ListenEvent {
    
    static var commandListenEvent: ListenResponse { get }
    
    static func listenEvent()
}
