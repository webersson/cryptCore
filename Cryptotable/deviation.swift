//
//  deviation.swift
//  Cryptotable
//
//  Created by Albrecht Weber on 28.06.17.
//  Copyright © 2017 Albrecht Weber. All rights reserved.
//

import Foundation

class Deviation {
   
      func setDeviations(data: [CoinContainer]) {
        UserDefaults.standard.set(max(standardDeviation(arr: getArrayPercent_change_1hNegative(data)), 10), forKey: "deviationPercent_change_1hNegative")
        
        UserDefaults.standard.set(max(standardDeviation(arr: getArrayPercent_change_1hNegative(data)), 10), forKey: "deviationPercent_change_1hPositive")
        
        UserDefaults.standard.set(min(max(standardDeviation(arr: getArrayPercent_change_24hNegative(data)), 15), 30), forKey: "deviationPercent_change_24hNegative")
        
        UserDefaults.standard.set(min(max(standardDeviation(arr: getArrayPercent_change_24hNegative(data)), 15), 30), forKey: "deviationPercent_change_24hPositive")

        
        UserDefaults.standard.set(min(max(standardDeviation(arr: getArrayPercent_change_7dNegative(data)), 20), 40), forKey: "deviationPercent_change_7dNegative")
        
        UserDefaults.standard.set(min(max(standardDeviation(arr: getArrayPercent_change_7dNegative(data)), 20), 40), forKey: "deviationPercent_change_7dPositive")

        }
    
    func standardDeviation(arr : [Double]) -> Double {
        let length = Double(arr.count)
        let avg = arr.reduce(0, {$0 + $1}) / length
        let sumOfSquaredAvgDiff = arr.map { pow($0 - avg, 2.0)}.reduce(0, {$0 + $1})
        
        return sqrt(sumOfSquaredAvgDiff / length)
    }
    
    
    func getArrayPercent_change_1hPositive (_ data: [CoinContainer]) -> [Double] {
        var arr: [Double] = [0]
        data.forEach { p in
            if p.percent_change_1h >= 0 {
                arr.append(p.percent_change_1h)
            }
        }
        return arr
    }
    
    func getArrayPercent_change_1hNegative (_ data: [CoinContainer]) -> [Double] {
        var arr: [Double] = [0]
        data.forEach { p in
           // if p.percent_change_1h <= 0 {
                arr.append(abs(p.percent_change_1h))
           // }
        }
        return arr
    }
    
    func getArrayPercent_change_24hPositive (_ data: [CoinContainer]) -> [Double] {
        var arr: [Double] = [0]
        data.forEach { p in
            if p.percent_change_24h >= 0 {
                arr.append(p.percent_change_24h)
            }
        }
        return arr
    }
    
    func getArrayPercent_change_24hNegative (_ data: [CoinContainer]) -> [Double] {
        var arr: [Double] = [0]
        data.forEach { p in
           // if p.percent_change_24h <= 0 {
                arr.append(abs(p.percent_change_24h))
           // }
        }
        return arr
    }

    func getArrayPercent_change_7dPositive (_ data: [CoinContainer]) -> [Double] {
        var arr: [Double] = [0]
        data.forEach { p in
            if p.percent_change_7d >= 0 {
                arr.append(p.percent_change_7d)
            }
        }
        return arr
    }
    
    func getArrayPercent_change_7dNegative (_ data: [CoinContainer]) -> [Double] {
        var arr: [Double] = [0]
        data.forEach { p in
            //if p.percent_change_7d <= 0 {
                arr.append(abs(p.percent_change_7d))
            //}
        }
        return arr
    }


    
    
    
    
    
    
    
    
    
    
    
    
    
    let responseTimes = [ 18.0, 21.0, 41.0, 42.0, 48.0, 50.0, 55.0, 90.0 ]
    

    
}

// original

//class func standardDeviation(arr : [Double]) -> Double {
//    let length = Double(arr.count)
//    let avg = arr.reduce(0, {$0 + $1}) / length
//    let sumOfSquaredAvgDiff = arr.map { pow($0 - avg, 2.0)}.reduce(0, {$0 + $1})
//    
//    return sqrt(sumOfSquaredAvgDiff / length)
//}


//
//standardDeviation(arr: responseTimes) // 20.8742514835862
//standardDeviation(arr: [2,4,4,4,5,5,7,9]) // 2.0
