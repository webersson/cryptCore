////
////  frage.swift
////  Cryptotable
////
////  Created by Albrecht Weber on 04.07.17.
////  Copyright © 2017 Albrecht Weber. All rights reserved.
////
//
//import Foundation
//
//
//func download() {
//    
//    let logos = [Logos]()
//    let group = DispatchGroup()
//    
//    logos.forEach { logo in
//        
//        print("enter")
//        group.enter()
//        
//        if logo?.data == nil {
//            
//            let id = logo?.id as! String
//            
//            if let checkedUrl = URL(string: "http://www.apple.com/euro/ios/ios8/a/generic/images/\(id).png") {
//                
//                print(checkedUrl)
//                
//                LogoRequest.init().downloadImage(url: checkedUrl) { (data)  in
//                    
//                    logo?.data = data
//                    print("stored")
//                    
//                    group.leave()
//                    print("leave")
//                }
//            }
//        }
//    }
//    
//    print("loop finished")
//}
//
//
//enter
//http://www.apple.com/euro/ios/ios8/a/generic/images/og.png
//enter
//http://www.apple.com/euro/ios/ios8/a/generic/images/eg.png
//enter
//http://www.apple.com/euro/ios/ios8/a/generic/images/sd.png
//enter
//http://www.apple.com/euro/ios/ios8/a/generic/images/hd.png
//loop finished
//stored
//leave
//stored
//leave
//stored
//leave
//stored
//leave
