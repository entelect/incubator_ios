//
//  Util.swift
//  iOSIncubator
//
//  Created by Keegan Rush on 2016/08/24.
//  Copyright © 2016 Entelect. All rights reserved.
//

import Foundation

class Util {
    
    static func orderByDate(games: [Game], isAscending: Bool) -> [Game] {
        let sorter = NSSortDescriptor(key: "date", ascending: isAscending)
        let gamesToSort = NSArray(array: games)
        
        let sortedObjects = gamesToSort.sortedArray(using: [sorter])
        return sortedObjects as! [Game]
    }
    
}
