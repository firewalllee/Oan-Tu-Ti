//
//  ApplicationAssembly.swift
//  OanTuTi
//
//  Created by beesightsoft on 7/26/17.
//  Copyright © 2017 Phuc. All rights reserved.
//

import Swinject

class ApplicationAssembly: Assembly{
    
    func loaded(resolver: Resolver) {
        print("All service have been loaded!")
    }
    
    func assemble(container: Container) {
        container.register(ListenEvent.self, name: Commands.Instance.ClientSignUpRs, factory: { r in
            ListenRegisterEvent()
        }).inObjectScope(.container)
        
        container.register(ListenEvent.self, name: Commands.Instance.ClientUpdateProfileRs, factory: { r in
            ListenProfileEvent()
        }).inObjectScope(.container)
        
        container.register(ListenEvent.self, name: Commands.Instance.ServerSendMatchResult, factory: { r in
            ListenMatchResultEvent()
        }).inObjectScope(.container)
        
        container.register(ListenEvent.self, name: Commands.Instance.ClientSubmitSelectionRs, factory: { r in
            ListenPlayingEvent()
        }).inObjectScope(.container)
        
        container.register(ListenEvent.self, name: Commands.Instance.PlayerLeaveRoom, factory: { r in
            ListenPlayerLeaveRoomEvent()
        }).inObjectScope(.container)
        
        container.register(ListenEvent.self, name: Commands.Instance.ClientLeaveRoomRs, factory: { r in
            ListenClientLeaveRoomEvent()
        }).inObjectScope(.container)
        
        container.register(ListenEvent.self, name: Commands.Instance.ClientUpdateRoomInfoRs, factory: { r in
            ListenClientUpdateRoomInfoEvent()
        }).inObjectScope(.container)
        
        container.register(ListenEvent.self, name: Commands.Instance.ClientReadyRs, factory: { r in
            ListenClientReadyEvent()
        }).inObjectScope(.container)
        
        container.register(ListenEvent.self, name: Commands.Instance.ClientsStartPlayingRs, factory: { r in
            ListenClientStartGameEvent()
        }).inObjectScope(.container)
        
        container.register(ListenEvent.self, name: Commands.Instance.ClientCreateRoomRs, factory: { r in
            ListenCreateRoom()
        }).inObjectScope(.container)
        
        container.register(ListenEvent.self, name: Commands.Instance.ClientJoinRoomRs, factory: { r in
            ListenClientJoinRoom()
        }).inObjectScope(.container)
    }
}

class ApplicationAssembler {
    
    static let sharedInstance = ApplicationAssembler()
    
    let resolver: Resolver = {
        return Assembler([ApplicationAssembly()]).resolver
    }()
}
