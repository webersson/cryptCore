//
//  Datenabruf.swift
//  CryptoTable
//
//  Created by Albrecht Weber on 15.06.17.
//  Copyright © 2017 Albrecht Weber. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class CoinmarketRequest {
    
     func fetchNewData(resultAmount: String, completion:@escaping (_ data: [CoinContainer]) -> Void) {
        
        var data = [CoinContainer]()
        
        var parameters = ["limit": resultAmount]
        
        if  resultAmount == "all" {
            parameters = ["": ""]
        }
        
        Alamofire.request("https://api.coinmarketcap.com/v1/ticker/", parameters: parameters).responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                
                do {
                    let json = swiftyJsonVar.arrayObject as! [[String: AnyObject]]
                    
                    //  print(json)
                    dataArray.removeAll()
                    for items in json {
                        
                        let id = items["id"] as? String;
                        let name = items["name"] as? String;
                        let symbol = items["symbol"] as? String;
                        let rank = JSONHelper.integer(fromJsonObject: items["rank"] as? String);
                        let price_usd = JSONHelper.double(fromJsonObject: items["price_usd"] as? String);
                        let price_btc = JSONHelper.double(fromJsonObject: items["price_btc"] as? String);
                        let volume_usd = JSONHelper.double(fromJsonObject: items["24h_volume_usd"] as? String);
                        let market_cap_usd = JSONHelper.double(fromJsonObject: items["market_cap_usd"] as? String);
                        let available_supply = JSONHelper.double(fromJsonObject: items["available_supply"] as? String);
                        let total_supply = JSONHelper.double(fromJsonObject: items["total_supply"] as? String);
                        let percent_change_1h = JSONHelper.double(fromJsonObject: items["percent_change_1h"] as? String);
                        let percent_change_24h = JSONHelper.double(fromJsonObject: items["percent_change_24h"] as? String);
                        let percent_change_7d = JSONHelper.double(fromJsonObject: items["percent_change_7d"] as? String)
                        let last_updated = JSONHelper.integer(fromJsonObject: items["last_updated"] as? String)
                        
                        //                    let hallo: NSDictionary = ["name": name, "symbol": symbol]
                        //                    print(hallo)
                        
                        
                        let result = CoinContainer(id: id!, name: name!, symbol: symbol!, rank: rank!, price_usd: price_usd!, price_btc: price_btc!, volume_usd: volume_usd!, market_cap_usd: market_cap_usd!, available_supply: available_supply!, total_supply: total_supply!, percent_change_1h: percent_change_1h!, percent_change_24h: percent_change_24h!, percent_change_7d: percent_change_7d!, last_updated: last_updated!)
                        
                        data.append(result)
                        
                        // print(dataArray)
                        
                    }
                } catch {
                    print("couldn't decode JSON")
                    return
                }
                data = data.sorted { $1.volume_usd < $0.volume_usd }
                print("completed")
                completion(data)
            }
        }
        
    }
    
}


