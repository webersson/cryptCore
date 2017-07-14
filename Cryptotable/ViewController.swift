//
//  ViewController.swift
//  CrytoTableCombo
//
//  Created by Albrecht Weber on 22.06.17.
//  Copyright © 2017 Albrecht Weber. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    var sheetViewController: SettingsViewController!
   
    var settingsActive : Bool = false
    @IBAction func showSettings(_ sender: Any) {
        
        if settingsActive == false {
            presentViewControllerAsSheet(sheetViewController)
            settingsActive = true
        }
        if settingsActive == true {
            dismiss(sheetViewController)
            settingsActive = false
        }
    }
    
    
    override func viewDidAppear() {
        
        //To prevent, that the toolbar becomes transparent in Yosemite (if you have a scrollview below the Toolbar), use this code:
        self.view.window?.appearance = NSAppearance(named: NSAppearanceNameAqua)
        
        
        // self.view.window?.styleMask.insert(.titled) /* Enable Title */
        // self.view.window?.styleMask.insert(.closable)  /* Enable Close button */
        self.view.window?.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.8941176471, blue: 0.8392156863, alpha: 1)
        self.view.window?.titleVisibility = .hidden
    }
    
    @IBOutlet weak var container: NSView!
    
    var vc1 : ViewController1!
    var vc2 : ViewController2!
    
    var vc1Active : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         sheetViewController = NSStoryboard(name: "Main", bundle: nil).instantiateController(withIdentifier: "SettingsViewController") as! SettingsViewController
        
        // Make sure to set your storyboard identiefiers on ViewController1 and ViewController2
        vc1 = NSStoryboard(name: "Main", bundle: nil).instantiateController(withIdentifier: "ViewController1") as! ViewController1
        vc2 = NSStoryboard(name: "Main", bundle: nil).instantiateController(withIdentifier: "ViewController2") as! ViewController2
        
        self.addChildViewController(vc1)
        self.addChildViewController(vc2)
        vc1.view.frame = self.container.bounds
        self.container.addSubview(vc1.view)
        vc1Active = true
        
        self.container.addSubview(vc2.view)
        vc2.view.frame = CGRect(x: self.container.frame.width, y: self.container.frame.minY, width: self.container.frame.width, height: self.container.frame.maxX - self.container.frame.minX)
    }
    
    @IBOutlet var overviewImageChange: NSButton!
    
    @IBAction func poloniexButton(_ sender: Any) {
        
       //  vc2.view.frame = self.container.bounds
        
        let insideFrame =  self.container.bounds
        let outsideFrameLeft = CGRect(x: -self.container.frame.width, y: self.container.frame.minY, width: self.container.frame.width, height: self.container.frame.maxX - self.container.frame.minX)
        
        NSAnimationContext.runAnimationGroup({ context in
            context.duration = 0.75
            vc2.view.animator().frame = insideFrame
        }, completionHandler:nil)
        
        NSAnimationContext.runAnimationGroup({ context in
            context.duration = 0.75
            vc1.view.animator().frame = outsideFrameLeft
        }, completionHandler:nil)

        NotificationCenter.default.post(name: .window2, object: nil, userInfo: nil)
    }
    
    
    @IBAction func overviewButton(_ sender: Any) {
        
//        vc1.view.frame = self.container.bounds
//        self.container.addSubview(vc1.view)
        
        let insideFrame =  self.container.bounds
        let outsideFrameRight = CGRect(x: self.container.frame.width, y: self.container.frame.minY, width: self.container.frame.width, height: self.container.frame.maxX - self.container.frame.minX)
        
        
        NSAnimationContext.runAnimationGroup({ context in
            context.duration = 0.75
            
            vc2.view.animator().frame = outsideFrameRight
            vc2.view.animator().alphaValue = 1
            
        }, completionHandler:nil)
        
        NSAnimationContext.runAnimationGroup({ context in
            context.duration = 0.75
            
            vc1.view.animator().frame = insideFrame
            vc1.view.animator().alphaValue = 1
            
        }, completionHandler:nil)
        
        NotificationCenter.default.post(name: .window1, object: nil, userInfo: nil)
        
        
       
        
    }
    
    
  
}

func settransition()  -> CATransition {
    
    let transition = CATransition()
    
    transition.type =  kCATransitionMoveIn
    transition.subtype = kCATransitionFromRight
    return transition
}


extension NSStoryboardSegue {
    var source: NSViewController? {
        return self.sourceController as? NSViewController
    }
    var destination: NSViewController? {
        return self.destinationController as? NSViewController
    }
}


