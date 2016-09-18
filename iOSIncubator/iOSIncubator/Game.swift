//
//  Game.swift
//  iOSIncubator
//
//  Created by Keegan Rush on 2016/08/24.
//  Copyright © 2016 Entelect. All rights reserved.
//

import Foundation

class Game: NSObject {
    var roundNumber = 0
    let date = Date()
    
    override var description: String {
        let friendlyDateString = date.friendlyFormattedString
        return "\(roundNumber) rounds played on \(friendlyDateString)"
    }
}
