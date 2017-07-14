//
//  SettingsViewController.swift
//  Cryptotable
//
//  Created by Albrecht Weber on 25.06.17.
//  Copyright © 2017 Albrecht Weber. All rights reserved.
//

import Cocoa

class SettingsViewController: NSViewController {

    @IBOutlet var BackgroundView: NSView!
   
    @IBAction func closeButton(_ sender: Any) {
        self.dismiss(SettingsViewController.self)
    }
    
    @IBOutlet weak var Slider_1h: NSSlider!
    @IBOutlet weak var Slider_24h: NSSlider!
    @IBOutlet weak var Slider_7d: NSSlider!

   
    @IBOutlet weak var meinefarbe: NSColorWell!
    
    
    @IBAction func coloraction(_ sender: NSColorWell) {
        let color = sender.color
        UserDefaults.standard.setColor(color: color, forKey: "meinefarbe")
    }

//    @IBAction func setfarbe(_ sender: Any) {
//        UserDefaults.standard.setColor(color: meinefarbe, forKey: "meinefarbe")
//    }
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BackgroundView.backgroundColor = NSColor.controlLightHighlightColor
        
        Slider_1h.intValue = Int32(UserDefaults.standard.integer(forKey: "tolerance_1h"))
        Slider_24h.intValue = Int32(UserDefaults.standard.integer(forKey: "tolerance_24h"))
        Slider_7d.intValue = Int32(UserDefaults.standard.integer(forKey: "tolerance_7d"))
        
    }
    
    @IBAction func Slider_1h(_ sender: Any) {
         print(UserDefaults.standard.integer(forKey: "tolerance_1h"))
    }
    @IBAction func Slider_24h(_ sender: Any) {
        print(UserDefaults.standard.integer(forKey: "tolerance_24h"))
    }
   
    


    @IBAction func Slider_7d_func(_ sender: Any) {
         print(UserDefaults.standard.integer(forKey: "tolerance_7d"))
    }
   
    
}
