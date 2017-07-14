//
//  Coins.swift
//  Cryptotable
//
//  Created by Albrecht Weber on 28.06.17.
//  Copyright © 2017 Albrecht Weber. All rights reserved.
//

import Foundation

var dataArray = [CoinContainer]()


class CoinContainer : NSObject {
    var id: String
    var name:String
    var symbol:String
    var rank = 0
    var price_usd: Double
    var price_btc: Double
    var volume_usd: Double
    var market_cap_usd: Double
    var available_supply: Double
    var total_supply: Double
    var percent_change_1h: Double
    var percent_change_24h: Double
    var percent_change_7d: Double
    var last_updated = 0

    override init() {
        id = "id"
        name = "name"
        symbol = "symbol"
        price_usd = 0
        price_btc = 0
        volume_usd = 0
        market_cap_usd = 0
        available_supply = 0
        total_supply = 0
        percent_change_1h = 0
        percent_change_24h = 0
        percent_change_7d = 0
        super.init()
    }
    
    init(id: String, name:String, symbol:String, rank:Int, price_usd: Double, price_btc: Double, volume_usd: Double, market_cap_usd: Double, available_supply: Double, total_supply: Double, percent_change_1h: Double, percent_change_24h: Double, percent_change_7d: Double, last_updated: Int) {
        self.id = id
        self.name = name
        self.symbol = symbol
        self.rank = rank
        self.price_usd = price_usd
        self.price_btc = price_btc
        self.volume_usd = volume_usd
        self.market_cap_usd = market_cap_usd
        self.available_supply = available_supply
        self.total_supply = total_supply
        self.percent_change_1h = percent_change_1h
        self.percent_change_24h = percent_change_24h
        self.percent_change_7d = percent_change_7d
        self.last_updated = last_updated
        super.init()
    }
    
}





