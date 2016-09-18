//
//  Util.swift
//  iOSIncubator
//
//  Created by Keegan Rush on 2016/08/24.
//  Copyright © 2016 Entelect. All rights reserved.
//

import Foundation

class Util {
    
    static func numberFromString(string: String) -> NSNumber {
        let numberFormatter = NumberFormatter()
        guard let number = numberFormatter.number(from: string) else {
            return NSNumber(value: 0)
        }
        
        return number
    }
    
    static func stringFromDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        let formattedDateString = dateFormatter.string(from: date)
        return formattedDateString
    }
    
    static func orderByDate(games: [Game], isAscending: Bool) -> [Game] {
        let sorter = NSSortDescriptor(key: "date", ascending: isAscending)
        let gamesToSort = NSArray(array: games)
        
        let sortedObjects = gamesToSort.sortedArray(using: [sorter])
        return sortedObjects as! [Game]
    }
    
}
