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
        NotificationCenter.default.addObserver(forName: Notification.Name(rawValue: "gameFinishedNotification"), object: nil, queue: nil, using: { [weak self] (notification: Notification) in
            if let game = notification.object as? Game {
                self?.addToHistory(game)
            }
        })
    }
    
    private func addToHistory(_ game: Game) {
        let userDefaults = UserDefaults.standard
        
        let gameData = NSKeyedArchiver.archivedData(withRootObject: game)
        if var games = userDefaults.array(forKey: UserDefaultsKeys.gameHistory.rawValue) as? [Data] {
            games.append(gameData)
            userDefaults.set(games, forKey: UserDefaultsKeys.gameHistory.rawValue)
        } else {
            userDefaults.set([gameData], forKey: UserDefaultsKeys.gameHistory.rawValue)
        }
        
        let notification = Notification.Name(rawValue: Notifications.historyChanged.rawValue)
        NotificationCenter.default.post(name: notification, object: nil)
    }
}
