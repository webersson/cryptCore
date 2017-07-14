//
//  ViewController2.swift
//  Cryptotable
//
//  Created by Albrecht Weber on 23.06.17.
//  Copyright © 2017 Albrecht Weber. All rights reserved.
//

import Cocoa
import CustomSegue
import WebKit




class ViewController2: NSViewController {


    @IBOutlet var jlhfu: WebView!
    
    @IBOutlet weak var customview: NSView!
    
    @IBOutlet var backgroundView: NSView!
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundView.backgroundColor = NSColor.controlLightHighlightColor
        customview.backgroundColor = NSColor.red
        
//        einfach outlet machen. webview
//        let url = "http://apple.com" //Link for the WebSite
//        self.webView.mainFrame.load(URLRequest(url: URL(string: url)!))
        

        let urlpath = Bundle.main.path(forResource: "index", ofType: "html");
        let requesturl = URL(string: urlpath!)
        let request = URLRequest(url: requesturl!)
        // webView.mainFrame.loadHTMLString(urlpath, baseURL: urlhtml2 as! URL)
        
        jlhfu.mainFrame.load(request)

        
    }
    

}
