//
//  CustomTableHeaderCell.swift
//  TestCellSwiftVersion
//
//  Created by tomfriwel on 20/04/2017.
//  Copyright © 2017 tomfriwel. All rights reserved.
//

import Cocoa

class CustomTableHeaderCell: NSTableHeaderCell {
    
    
    override init(textCell: String) {
        super.init(textCell: textCell)
    }
    
 

    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }


    
    override func draw(withFrame cellFrame: NSRect, in controlView: NSView) {
        let image = NSImage(named: "starFilled.png")
        let altImage = NSImage(named: "starEmpty.png")

        let button = NSButton(image: image!, target: self, action: nil)
        button.alternateImage = altImage
        button.setButtonType(NSButtonType(rawValue: UInt(SWITCH_OPTION_NONE))!)
       
        button.draw(withExpansionFrame: cellFrame, in: controlView)
        

    }
    
    
  }






