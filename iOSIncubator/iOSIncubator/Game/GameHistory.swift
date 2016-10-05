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
    
    func addToHistory(_ game: Game) {
        let notification = Notification.Name(rawValue: Notifications.historyChanged.rawValue)
        NotificationCenter.default.post(name: notification, object: nil)
    }
}
