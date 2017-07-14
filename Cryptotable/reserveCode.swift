//
//  reserveCode.swift
//  Cryptotable
//
//  Created by Albrecht Weber on 25.06.17.
//  Copyright © 2017 Albrecht Weber. All rights reserved.
//
/*
import Foundation
import Cocoa

class ViewController: NSViewController {
    
    // link to the NSView Container
    @IBOutlet weak var container : NSView!
    
    var vc1 : ViewController1!
    var vc2 : ViewController2!
    
    var vc1Active : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Make sure to set your storyboard identiefiers on ViewController1 and ViewController2
        vc1 = NSStoryboard(name: "name", bundle: nil).instantiateController(withIdentifier: "ViewController1") as! ViewController1
        vc2 = NSStoryboard(name: "name", bundle: nil).instantiateController(withIdentifier: "ViewController2") as! ViewController2
        
        self.addChildViewController(vc1)
        self.addChildViewController(vc2)
        vc1.view.frame = self.container.bounds
        self.container.addSubview(vc1.view)
        vc1Active = true
        
    }
    
    // You can link this action to both buttons
    @IBAction func switchViews(sender: NSButton) {
        
        for sView in self.container.subviews {
            sView.removeFromSuperview()
        }
        
        if vc1Active == true {
            
            vc1Active = false
            vc2.view.frame = self.container.bounds
            self.container.addSubview(vc2.view)
            
        } else {
            
            vc1Active = true
            vc1.view.frame = self.container.bounds
            self.container.addSubview(vc1.view)
        }
        
    }
}*/



// userdefaults funktioniert

//override func viewDidLoad() {
//    super.viewDidLoad()
//    BackgroundView.backgroundColor = NSColor.controlLightHighlightColor
//    
//    Label_1h.intValue = Int32(UserDefaults.standard.integer(forKey: "slider_1h"))
//    Label_24h.intValue = Int32(UserDefaults.standard.integer(forKey: "Slider_24h"))
//    print(UserDefaults.standard.integer(forKey: "Slider_24h"))
//    Slider_24h.v
//    
//}
//
//@IBAction func SLIDER_Actiov(_ sender: Any) {
//    Label_1h.intValue = Slider_1h.intValue
//    UserDefaults.standard.set(Slider_1h.intValue, forKey: "slider_1h")
//    //        print("slider set")
//    // print(UserDefaults.standard.integer(forKey: "slider_1h"))
//}
//
//@IBAction func Slider_24h(_ sender: NSSlider) {
//    Label_24h.intValue = Slider_24h.intValue
//    UserDefaults.standard.set(Slider_24h.intValue, forKey: "Slider_24h")
//}







