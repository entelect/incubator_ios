//
//  HistoryViewController.swift
//  iOSIncubator
//
//  Created by Keegan Rush on 2016/09/07.
//  Copyright © 2016 Entelect. All rights reserved.
//

import UIKit

let CellIdentifier = "HistoryTableViewCell"

class HistoryViewController: UITableViewController {
    
    var games: [Game]!
    
    override func viewWillAppear(_ animated: Bool) {
        let gamesData = UserDefaults.standard.array(forKey: UserDefaultsKeys.gameHistory.rawValue)
        
        games = gamesData?.flatMap({
            guard let data = $0 as? Data else { return nil }
            return NSKeyedUnarchiver.unarchiveObject(with: data) as? Game
        }) ?? []
        
        self.title = "\(games.count) games in history"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let game = games[indexPath.row]
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: CellIdentifier)
        
        let winnerText = "\(indexPath.row + 1). Winner: "
        let appendText = game.winnerType == .human ? "You" : "Computer"
        cell.textLabel?.text = winnerText + appendText
        
        cell.detailTextLabel?.text = game.description
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
}
