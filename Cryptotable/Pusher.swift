//
//  Pusher.swift
//  CryptoTable
//
//  Created by Albrecht Weber on 17.06.17.
//  Copyright © 2017 Albrecht Weber. All rights reserved.
//

import Cocoa

public var BitcoinTimestamp: Int = 0

class PUSHER {
    
    static func getUTC()  {
    
      for items in dataArray {
        
            if items.name == "Bitcoin" {
            
               BitcoinTimestamp = items.last_updated
            }
        }
    }
}

//class ElapsedTimeFormatter: NSNumberFormatter {
//    
//    lazy var dateFormatter: NSDateFormatter = {
//        let dateFormatter = NSDateFormatter()
//        dateFormatter.dateFormat = "HH:mm"
//        return dateFormatter
//    }()
//    
//    override func stringFromNumber(number: NSNumber) -> String? {
//        let timeInterval = NSTimeInterval(number)
//        return dateFormatter.stringFromDate(NSDate(timeIntervalSinceReferenceDate: timeInterval))
//    }
//}
//Test:
//
//let formatter = ElapsedTimeFormatter()
//let s = formatter.stringFromNumber(6300)
//// Output: s = "01:45"
