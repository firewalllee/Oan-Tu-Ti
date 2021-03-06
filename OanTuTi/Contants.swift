//
//  Contants.swift
//  OanTuTi
//
//  Created by Phuc on 11/3/16.
//  Copyright © 2016 Phuc. All rights reserved.
//

import Foundation

class Contants {
    
    //Singleton Pattern
    static let Instance :Contants = Contants()
    
    private init() {}
    
    //----------------Segue------------------------
    let segueRegister: String = "segueRegister"
    let segueMenu: String = "segueMenu"
    let segueProfile: String = "segueProfile"
    let segueWaiting: String = "segueWaiting"
    let segueMain: String = "segueMain"
    
    //---------------CellID------------------------
    let cellRoom: String = "roomCell"
    
    //---------------Contants----------------------
    let avatar: String = "avatar"
    let best_of:String = "best_of"
    
    let coin_card: String = "coin_card"
    let current_page: String = "current_page"
    
    let nickname: String = "displayName"
    
    let email: String = "email"
    
    let file: String = "file"
    let full: String = "full"
    
    let game_id:String = "game_id"
    let guest: String = "guest"
    
    let histories: String = "histories"
    let host: String = "host"
    let host_uid: String = "host_uid"
    
    let id: String = "id"
    let isSuccess: String = "isSuccess"
    let joinable:String = "joinable"
    let loses: String = "loses"
    
    let match_id:String = "match_id"
    let message: String = "message"
    
    let money_bet: String = "money_bet"
    let name: String = "name"
    let newAvatarUrl: String = "newAvatarUrl"
    let noti_token: String = "noti_token"
    let null: String = ""
    let uid: String = "uid"
    let user: String = "user"
    
    let page: String = "page"
    let pass: String = "pass"
    let playing: String = "playing"
    
    let oldPass: String = "oldPass"
    let newPass: String = "newPass"
    
    let ready: String = "ready"
    let restCoinCard = "rest_coin_card"
    let room_id: String = "room_id"
    let room_name: String = "room_name"
    let room_info:String = "room_info"
    let rooms: String = "rooms"
    
    let selection:String = "selection"
    let socket_id: String = "socket_id"
    let state: String = "state"
    let statistics: String = "statistics"
    
    let total_page: String = "total_page"
    let wins: String = "wins"
    
    let their: String = "their"
    let selF: String = "self"
    let win: String = "win"
}
