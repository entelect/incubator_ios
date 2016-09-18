//
//  String+Extensions.swift
//  iOSIncubator
//
//  Created by Keegan Rush on 2016/08/26.
//  Copyright © 2016 Entelect. All rights reserved.
//

import Foundation

extension String {
    
    func toNumber() -> NSNumber {
        let numberFormatter = NumberFormatter()
        guard let number = numberFormatter.number(from: self) else {
            return NSNumber(value: 0)
        }
        
        return number
    }
    
}
