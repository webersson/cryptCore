////
////  CheckBoxCellView.swift
////  TableColumnChooser
////
////  Created by Albrecht Weber on 27.06.17.
////  Copyright © 2017 Gene De Lisa. All rights reserved.
////
//
//import Cocoa
//
// struct FavoriteStruct {
//    var name: String
//    var state: Int
//}
//
//extension FavoriteStruct {
//    func encode() -> Data {
//        let data = NSMutableData()
//        let archiver = NSKeyedArchiver(forWritingWith: data)
//        archiver.encode(name, forKey: "name")
//        archiver.encode(state, forKey: "state")
//        archiver.finishEncoding()
//        return data as Data
//    }
//    
//    init?(data: Data) {
//        let unarchiver = NSKeyedUnarchiver(forReadingWith: data)
//        defer {
//            unarchiver.finishDecoding()
//        }
//        guard let name = unarchiver.decodeObject(forKey: "name") as? String else { return nil }
//        state = Int(unarchiver.decodeInt32(forKey: "state"))
//        self.name = name
//    }
//}
//
//
//class CheckBoxCellView: NSTableCellView {
//    
//    var favoriteArray = [FavoriteStruct]()
//    
//    // var favoritenliste: [String : Int] = [:]
//    //var myDictionary: NSMutableDictionary = [:]
//    
//    @IBOutlet weak var imagebutton: NSButton!
//    
//    @IBAction func imageButtonAction(_ sender: NSButton) {
//        
//        favoriteArray = getFavoriteArrayFromUserdefaults()!
//
//        let stateFromButton = imagebutton.state
//        
//        let tagFromButton = imagebutton.tag
//        let nameFromdataArray = dataArray[tagFromButton].name
//        
//        let result = FavoriteStruct(name: nameFromdataArray, state: stateFromButton)
//        
//        
//        if let index = favoriteArray.index(where: { $0.name == nameFromdataArray }) {
//            favoriteArray[index].state = stateFromButton
//        } else {
//            favoriteArray.append(result)
//        }
//        
//        
//       // Swift.print(favoriteArray)
//     
//        let roomsData = favoriteArray.map { $0.encode() }
//        UserDefaults.standard.set(roomsData, forKey: "storedFavoriteArray")
//       // Swift.print(UserDefaults.standard.object(forKey: "storedFavoriteArray"))
//        
//        NotificationCenter.default.post(name: .arrayDidChange, object: nil, userInfo: nil)
//    }
//    
//    func getFavoriteArrayFromUserdefaults() -> [FavoriteStruct]? {
//        guard let roomsData = UserDefaults.standard.object(forKey: "storedFavoriteArray") as? [Data] else { return nil }
//        return roomsData.flatMap { return FavoriteStruct(data: $0) }
//    }
//}
