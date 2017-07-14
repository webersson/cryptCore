//
//  overviewImageButton.swift
//  Cryptotable
//
//  Created by Albrecht Weber on 23.06.17.
//  Copyright © 2017 Albrecht Weber. All rights reserved.
//

import Cocoa

class overviewImageButton: NSButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupButton()
    }
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self.setupButton()
    }
    
    override func draw(_ dirtyRect: NSRect) {
        self.isHighlighted = false
        
        super.draw(dirtyRect)
    }
    
    private func setupButton() {
        self.image = NSImage(named: "overview3_heller.png")
        
        NotificationCenter.default.addObserver(forName: .window1, object: nil, queue: nil) {
            notification in
            self.image = NSImage(named: "overview3_heller.png")
        }
        
        NotificationCenter.default.addObserver(forName: .window2, object: nil, queue: nil) {
            notification in
            self.image = NSImage(named: "overview3.png")
        }
    }
}


class poloniexImageButton: NSButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupButton()
    }
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self.setupButton()
    }
    
    override func draw(_ dirtyRect: NSRect) {
        self.isHighlighted = false
        
        super.draw(dirtyRect)
    }
    
    private func setupButton() {
        self.image = NSImage(named: "poloniex3.png")
        
        NotificationCenter.default.addObserver(forName: .window2, object: nil, queue: nil) {
            notification in
            self.image = NSImage(named: "poloniex3_heller.png")
        }
        
        NotificationCenter.default.addObserver(forName: .window1, object: nil, queue: nil) {
            notification in
            self.image = NSImage(named: "poloniex3.png")
        }
    }   
}

class settingsImageButton: NSButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupButton()
    }
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self.setupButton()
    }
    
    override func draw(_ dirtyRect: NSRect) {
        self.isHighlighted = false
        
        super.draw(dirtyRect)
    }
    
    private func setupButton() {
        self.image = NSImage(named: "settings.png")
        
    }
}




