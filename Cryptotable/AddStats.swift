////
////  favoriteFilteredData.swift
////  Cryptotable
////
////  Created by Albrecht Weber on 27.06.17.
////  Copyright © 2017 Albrecht Weber. All rights reserved.
////
//
//import Cocoa
//
//
//class AddStats {
//    
//    var temporaryDictionary: [String : CoinContainer] = [:]
//    
//    public func makeNewDataArrayWithStats()  -> [CoinContainer] {
//        dataArrayDownloaded.forEach { temporaryDictionary[$0.name] = $0}
//        
//        let favoriteArray = getFavoriteArrayFromUserdefaults()
//        
//        //Updates only the found values in temporaryDictionary
//        favoriteArray?.forEach { temporaryDictionary[$0.name]?.state = $0.state }
//        
//        let result: [CoinContainer] = Array(temporaryDictionary.values)
//        
//        return result
//    }
//    
//    func getFavoriteArrayFromUserdefaults() -> [FavoriteStruct]? {
//        guard let roomsData = UserDefaults.standard.object(forKey: "storedFavoriteArray") as? [Data] else { return nil }
//       
//        return roomsData.flatMap { return FavoriteStruct(data: $0) }
//    }
//    
//    
//}
