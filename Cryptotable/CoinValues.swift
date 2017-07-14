//
//  People.swift
//  sorting ArrayController
//
//  Created by Albrecht Weber on 29.06.17.
//  Copyright © 2017 Albrecht Weber. All rights reserved.
//




import Cocoa

class CoinValues: NSManagedObject {
    
    static func createCoinValue( symbol: String ) -> CoinValues {
        let entity = NSEntityDescription.entity(forEntityName: "CoinValues", in: Context.moc)
        let values = CoinValues(entity: entity!, insertInto: Context.moc)
        values.symbol = symbol
        return values
    }
    
    var symbol : String? {
        set {
            if newValue != primitiveValue(forKey: "symbol") as? String {
            willChangeValue(forKey: "symbol")
            setPrimitiveValue(newValue, forKey: "symbol")
            didChangeValue(forKey: "symbol")
            }
        }
        get {
            return primitiveValue(forKey: "symbol") as? String
        }
    }
    
    var rank : Int? {
        
        set {
            if newValue != primitiveValue(forKey: "rank") as? Int {
                willChangeValue(forKey: "rank")
                setPrimitiveValue(newValue, forKey: "rank")
                didChangeValue(forKey: "rank")
            }
        }
        get {
            return primitiveValue(forKey: "rank") as? Int
        }
    }
    
    var price_usd : Double? {
        
        set {
            if newValue != primitiveValue(forKey: "price_usd") as? Double {
                willChangeValue(forKey: "price_usd")
                setPrimitiveValue(newValue, forKey: "price_usd")
                didChangeValue(forKey: "price_usd")
            }
        }
        get {
            return primitiveValue(forKey: "price_usd") as? Double
        }
    }

    
    var price_btc : Double? {
        
        set {
            if newValue != primitiveValue(forKey: "price_btc") as? Double {
                willChangeValue(forKey: "price_btc")
                setPrimitiveValue(newValue, forKey: "price_btc")
                didChangeValue(forKey: "price_btc")
            }
        }
        get {
            return primitiveValue(forKey: "price_btc") as? Double
        }
    }

    
    var volume_usd : Double? {
        
        set {
            if newValue != primitiveValue(forKey: "volume_usd") as? Double {
                willChangeValue(forKey: "volume_usd")
                setPrimitiveValue(newValue, forKey: "volume_usd")
                didChangeValue(forKey: "volume_usd")
            }
        }
        get {
            return primitiveValue(forKey: "volume_usd") as? Double
        }
    }

    
    var market_cap_usd : Double? {
        
        set {
            if newValue != primitiveValue(forKey: "market_cap_usd") as? Double {
                willChangeValue(forKey: "market_cap_usd")
                setPrimitiveValue(newValue, forKey: "market_cap_usd")
                didChangeValue(forKey: "market_cap_usd")
            }
        }
        get {
            return primitiveValue(forKey: "market_cap_usd") as? Double
        }
    }

    var available_supply : Double? {
        
        set {
            if newValue != primitiveValue(forKey: "available_supply") as? Double {
                willChangeValue(forKey: "available_supply")
                setPrimitiveValue(newValue, forKey: "available_supply")
                didChangeValue(forKey: "available_supply")
            }
        }
        get {
            return primitiveValue(forKey: "available_supply") as? Double
        }
    }
    

    
    
    var total_supply : Double? {
        
        set {
            if newValue != primitiveValue(forKey: "total_supply") as? Double {
                willChangeValue(forKey: "total_supply")
                setPrimitiveValue(newValue, forKey: "total_supply")
                didChangeValue(forKey: "total_supply")
            }
        }
        get {
            return primitiveValue(forKey: "total_supply") as? Double
        }
    }

    
    var percent_change_1h : Double? {
        
        set {
            if newValue != primitiveValue(forKey: "percent_change_1h") as? Double {
                willChangeValue(forKey: "percent_change_1h")
                setPrimitiveValue(newValue, forKey: "percent_change_1h")
                didChangeValue(forKey: "percent_change_1h")
            }
        }
        get {
            return primitiveValue(forKey: "percent_change_1h") as? Double
        }
    }

    
    var percent_change_24h : Double? {
        
        set {
            if newValue != primitiveValue(forKey: "percent_change_24h") as? Double {
                willChangeValue(forKey: "percent_change_24h")
                setPrimitiveValue(newValue, forKey: "percent_change_24h")
                didChangeValue(forKey: "percent_change_24h")
            }
        }
        get {
            return primitiveValue(forKey: "percent_change_24h") as? Double
        }
    }

    
    var percent_change_7d : Double? {
        
        set {
            if newValue != primitiveValue(forKey: "percent_change_7d") as? Double {
                willChangeValue(forKey: "percent_change_7d")
                setPrimitiveValue(newValue, forKey: "percent_change_7d")
                didChangeValue(forKey: "percent_change_7d")
            }
        }
        get {
            return primitiveValue(forKey: "percent_change_7d") as? Double
        }
    }

    
    var last_updated : Int? {
        
        set {
            if newValue != primitiveValue(forKey: "last_updated") as? Int {
                willChangeValue(forKey: "last_updated")
                setPrimitiveValue(newValue, forKey: "last_updated")
                didChangeValue(forKey: "last_updated")
            }
        }
        get {
            return primitiveValue(forKey: "last_updated") as? Int
        }
    }
    
    var relative_volume : Int? {
        
        set {
            if newValue != primitiveValue(forKey: "relative_volume") as? Int {
                willChangeValue(forKey: "relative_volume")
                setPrimitiveValue(newValue, forKey: "relative_volume")
                didChangeValue(forKey: "relative_volume")
            }
        }
        get {
            return primitiveValue(forKey: "relative_volume") as? Int
        }
    }


    

}
