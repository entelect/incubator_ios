//
//  NSDate+Extensions.swift
//  iOSIncubator
//
//  Created by Keegan Rush on 2016/08/26.
//  Copyright © 2016 Entelect. All rights reserved.
//

import Foundation

extension Date {
    
    var friendlyFormattedString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        let formattedDateString = dateFormatter.string(from: self)
        return formattedDateString
    }
    
}
