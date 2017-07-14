//
//  ColorExtension.swift
//  Cryptotable
//
//  Created by Albrecht Weber on 24.06.17.
//  Copyright © 2017 Albrecht Weber. All rights reserved.
//

import Cocoa


// Color Extension

extension NSView {
    
    var backgroundColor: NSColor? {
        
        get {
            if let colorRef = self.layer?.backgroundColor {
                return NSColor(cgColor: colorRef)
            } else {
                return nil
            }
        }
        
        set {
            self.wantsLayer = true
            self.layer?.backgroundColor = newValue?.cgColor
        }
    }
}
