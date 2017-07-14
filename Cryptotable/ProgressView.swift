//
//  File.swift
//  zzzganzweg
//
//  Created by Albrecht Weber on 18.06.17.
//  Copyright © 2017 Albrecht Weber. All rights reserved.
//

import Cocoa

enum barOrigin {
    case allOneDirection
    case splitInTheMiddle
}

class ProgressView: NSTextField {
    
    var progress: CGFloat = 1
    
    var filledView: ProgressBar!
    
    override var doubleValue: Double {
        didSet {
            setProgress()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        filledView = ProgressBar(frame: CGRect(x: frame.origin.x, y: frame.origin.y, width: 50, height: frame.height))
        addSubview(filledView)
    }
    
    
    
    func setProgress() {
        
        var factor: Double = 100
        let percentageFromData = doubleValue
        
        if self.identifier == "percent_change_1h" {
            if percentageFromData >= 0 {
                factor = UserDefaults.standard.double(forKey: "deviationPercent_change_1hPositive")
               //Swift.print("1h +PLUS+ Factor=  \(factor)")
            } else {
                factor = UserDefaults.standard.double(forKey: "deviationPercent_change_1hNegative")
               // Swift.print("1h -MINUS- Factor=  \(factor)")

            }
        }
        
        if self.identifier == "percent_change_24h" {
            if percentageFromData >= 0 {
                factor = UserDefaults.standard.double(forKey: "deviationPercent_change_24hPositive")
              //  Swift.print("24h +PLUS+ Factor=  \(factor)")
            } else {
                factor = UserDefaults.standard.double(forKey: "deviationPercent_change_24hNegative")
               // Swift.print("24h -MINUS- Factor=  \(factor)")

            }
        }

        if self.identifier == "percent_change_7d" {
            if percentageFromData >= 0 {
                factor = UserDefaults.standard.double(forKey: "deviationPercent_change_7dPositive")
               // Swift.print("7d +PLUS+ Factor=  \(factor)")
            } else {
                factor = UserDefaults.standard.double(forKey: "deviationPercent_change_7dNegative")
               // Swift.print("7d -MINUS- Factor=  \(factor)")
            }
        }

        var progress = CGFloat((abs((percentageFromData) / 100)) * (50 / factor))
        
        progress = min(max(progress, 0), 10) // Between 0 and 1
        self.progress = progress
        
        
        if percentageFromData.hashValue >= 0 {
            filledView.color = #colorLiteral(red: 0.3767657578, green: 0.6427790523, blue: 0.3656882048, alpha: 1)
            filledView.isPositive = true
        } else {
            filledView.color = #colorLiteral(red: 0.6601832509, green: 0.2494866848, blue: 0.2306114435, alpha: 1)
            filledView.isPositive = false
        }
        
        filledView.autoresizingMask = .viewWidthSizable
        filledView.percentage = self.progress
        if UserDefaults.standard.bool(forKey: "BarsSameDirection") == true {
            filledView.frame = CGRect(x: 0, y: 0, width: (self.frame.width - 0 ) , height: frame.height)
        } else {
            if percentageFromData >= 0 {
                filledView.frame = CGRect(x: frame.size.width / 2, y: 0, width: (self.frame.width - 0 ) , height: frame.height)
            } else {
                filledView.frame = CGRect(x: 0, y: 0, width: (self.frame.width / 2 ) , height: frame.height)
            }
        }
        
        filledView.setNeedsDisplay(filledView.bounds)
    }
    
    override func draw(_ dirtyRect: NSRect) {
        //  super.draw(dirtyRect)
        setProgress()
    }
}


class ProgressBar : NSView {
    
    var percentage : CGFloat?
    var color = NSColor.green
    var isPositive: Bool?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override func draw(_ dirtyRect: NSRect) {
        if let percentage = percentage {
            let gradient = NSGradient(starting: color, ending: color.withAlphaComponent(0.2))
            
            if UserDefaults.standard.bool(forKey: "BarsSameDirection") == true {
                gradient!.draw(in: CGRect(x: 0, y: 0, width:  frame.size.width * percentage, height: frame.size.height), angle: 0.0)
            } else {
                
                if isPositive == true {
                    gradient!.draw(in: CGRect(x: 0, y: 0, width:  frame.size.width * 0.5 * percentage, height: frame.size.height), angle: 0.0)
                } else {
                    gradient!.draw(in: CGRect(x: frame.size.width - (frame.size.width * 0.5 * percentage), y: 0, width:  frame.size.width * 0.5 * percentage, height: frame.size.height), angle: 180)
                    
                }
            }
            
            
        }
    }
    
    
}








/*
class ProgressView: NSTableCellView {
    
  
    var progress: CGFloat = 1
    var filledView: ProgressBar!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        filledView = ProgressBar(frame: CGRect(x: frame.origin.x, y: frame.origin.y, width: 50, height: frame.height))
        addSubview(filledView)
    }
    
    //func setProgess(_ percentageFromData: Double, Min: Double, Max: Double) {

    func setProgess(_ percentageFromData: Double, factor: Double) {
       
        var progress = CGFloat((abs((percentageFromData) / 100)) * (1 / factor))
      
        progress = min(max(progress, 0), 1) // Between 0 and 1
        self.progress = progress
    
        let offset = textField?.frame.size.width
        
    
        if percentageFromData.hashValue >= 0 {
           // filledView.color = #colorLiteral(red: 0.3767657578, green: 0.6427790523, blue: 0.3656882048, alpha: 1)
            filledView.color = UserDefaults.standard.colorForKey(key: "meinefarbe")!
        } else {
            filledView.color = #colorLiteral(red: 0.6601832509, green: 0.2494866848, blue: 0.2306114435, alpha: 1)
        }
        
        filledView.autoresizingMask = .viewWidthSizable
        filledView.percentage = self.progress
        filledView.frame = CGRect(x: 0, y: 0, width: (self.frame.width - (offset! ) ) , height: frame.height)
        filledView.setNeedsDisplay(filledView.bounds)
        
    }
    
    
}


class ProgressBar : NSView {
    
    var percentage : CGFloat?
    var color = NSColor.green
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override func draw(_ dirtyRect: NSRect) {
        if let percentage = percentage {
            let gradient = NSGradient(starting: color, ending: color.withAlphaComponent(0.2))
            
            gradient!.draw(in: CGRect(x: 0, y: 0, width: min(frame.size.width,  frame.size.width * percentage), height: frame.size.height), angle: 0.0)
        }
    }
}


*/






