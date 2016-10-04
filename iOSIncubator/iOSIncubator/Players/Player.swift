//
//  Player.swift
//  iOSIncubator
//
//  Created by Keegan Rush on 2016/08/11.
//  Copyright © 2016 Entelect. All rights reserved.
//

import Foundation

struct Player: Equatable {
    let playerType: PlayerType
    
    static func ==(lhs: Player, rhs: Player) -> Bool {
        return lhs.playerType == rhs.playerType
    }
}
