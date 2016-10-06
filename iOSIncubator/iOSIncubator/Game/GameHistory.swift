//
//  GameHistory.swift
//  iOSIncubator
//
//  Created by Keegan Rush on 2016/10/05.
//  Copyright © 2016 Entelect. All rights reserved.
//

import Foundation

class GameHistory {
    static let sharedInstance = GameHistory()
    
    init() {
    }
    
    func addToHistory(_ game: Game) {
        let userDefaults = UserDefaults.standard
        
        if var games = userDefaults.array(forKey: UserDefaultsKeys.gameHistory.rawValue) as? [Game] {
            games.append(game)
            games.sort()
            userDefaults.set(games, forKey: UserDefaultsKeys.gameHistory.rawValue)
        } else {
            userDefaults.set([game], forKey: UserDefaultsKeys.gameHistory.rawValue)
        }
        
        let notification = Notification.Name(rawValue: Notifications.historyChanged.rawValue)
        NotificationCenter.default.post(name: notification, object: nil)
    }
}
