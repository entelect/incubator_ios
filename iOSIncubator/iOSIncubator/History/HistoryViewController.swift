//
//  HistoryViewController.swift
//  iOSIncubator
//
//  Created by Keegan Rush on 2016/09/07.
//  Copyright © 2016 Entelect. All rights reserved.
//

import UIKit

class HistoryViewController: UITableViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        let games = UserDefaults.standard.array(forKey: UserDefaultsKeys.gameHistory.rawValue) ?? []
        self.title = "\(games.count) games in history"
    }
    
}
