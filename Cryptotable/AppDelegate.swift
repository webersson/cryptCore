//
//  AppDelegate.swift
//  Cryptotable
//
//  Created by Albrecht Weber on 23.06.17.
//  Copyright © 2017 Albrecht Weber. All rights reserved.
//

//    override class func initialize() {
//        let newTransformer = IntegerTransformmer()
//        ValueTransformer.setValueTransformer(newTransformer, forName: NSValueTransformerName(rawValue: "IntegerTransformmer"))
//
//    }


import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        Context.shared.saveContext()
        // Insert code here to tear down your application
    }
    
        override class func initialize() {
            let newTransformer = BigNumbersTransformer()
            ValueTransformer.setValueTransformer(newTransformer, forName: NSValueTransformerName(rawValue: "BigNumbersTransformer"))
            
            let newTransformer2 = TimeTransformer()
            ValueTransformer.setValueTransformer(newTransformer2, forName: NSValueTransformerName(rawValue: "TimeTransformer"))
    
        }
    
    

    
    
}

