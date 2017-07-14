//
//  colordefaults.swift
//  Cryptotable
//
//  Created by Albrecht Weber on 26.06.17.
//  Copyright © 2017 Albrecht Weber. All rights reserved.
//

import Cocoa

extension UserDefaults {
    
    func colorForKey(key: String) -> NSColor? {
        var color: NSColor?
        if let colorData = data(forKey: key) {
            color = NSKeyedUnarchiver.unarchiveObject(with: colorData) as? NSColor
        }
        return color
    }
    func setColor(color: NSColor?, forKey key: String) {
        var colorData: NSData?
        if let color = color {
            colorData = NSKeyedArchiver.archivedData(withRootObject: color) as NSData?
        }
        set(colorData, forKey: key)
    }
    
    

}

