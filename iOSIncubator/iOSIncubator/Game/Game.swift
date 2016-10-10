//
//  Game.swift
//  iOSIncubator
//
//  Created by Keegan Rush on 2016/08/24.
//  Copyright © 2016 Entelect. All rights reserved.
//

import Foundation

class Game: NSObject, NSCoding {
    var date = Date()
    var roundNumber = 1
    var winnerType: PlayerType!
    
    override var description: String {
        let friendlyDateString = date.friendlyFormattedString
        return "\(roundNumber) rounds played on \(friendlyDateString)"
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(date, forKey: "date")
        aCoder.encode(roundNumber, forKey: "roundNumber")
        aCoder.encode(winnerType.rawValue, forKey: "winnerType")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self.date = aDecoder.decodeObject(forKey: "date") as! Date
        self.roundNumber = aDecoder.decodeInteger(forKey: "roundNumber")
        
        let rawWinnerType = aDecoder.decodeInteger(forKey: "winnerType")
        self.winnerType = PlayerType(rawValue: rawWinnerType)
    }
}

extension Game: Comparable {
    static func <(lhs: Game, rhs: Game) -> Bool {
        return lhs.date < rhs.date
    }
    
    static func <=(lhs: Game, rhs: Game) -> Bool {
        return lhs.date <= rhs.date
    }

    static func >=(lhs: Game, rhs: Game) -> Bool {
        return lhs.date >= rhs.date
    }

    static func >(lhs: Game, rhs: Game) -> Bool {
        return lhs.date > rhs.date
    }
}
