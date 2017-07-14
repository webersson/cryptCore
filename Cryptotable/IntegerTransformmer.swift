//
//  IntegerTransformmer.swift
//  Cryptotable
//
//  Created by Albrecht Weber on 25.06.17.
//  Copyright © 2017 Albrecht Weber. All rights reserved.
//

import Cocoa

class IntegerTransformmer: ValueTransformer {
    
    override class func transformedValueClass() -> AnyClass {
        return NSNumber.self
    }
    
    override class func allowsReverseTransformation() -> Bool {
        return true
    }
    
    
    override func transformedValue(_ value: Any?) -> Any? {
        if let int = value as? Int {
            return int
        } else {
            return 50
        }
    }
}
