//
//  BigNumbers.swift
//  Cryptotable
//
//  Created by Albrecht Weber on 03.07.17.
//  Copyright © 2017 Albrecht Weber. All rights reserved.
//

import Foundation

class TimeTransformer: ValueTransformer {
    override class func transformedValueClass() -> AnyClass {
        return NSString.self
    }
    
    override class func allowsReverseTransformation() -> Bool {
        return false
    }

    override func transformedValue(_ value: Any?) -> Any? {
        
        guard let timeIntervall = value as? Double else { return ("scheisse") }
        
        let timeResult = NSDate(timeIntervalSince1970: timeIntervall)
        
        return timeResult
        
    }
    
}


class BigNumbersTransformer: ValueTransformer {
    
    override class func transformedValueClass() -> AnyClass {
        return NSString.self
    }
    
    override class func allowsReverseTransformation() -> Bool {
        return false
    }
    
    let formatter: NumberFormatter = {
        let _formatter = NumberFormatter()
        //_formatter.numberStyle = .decimal
        _formatter.minimumFractionDigits = 2
        _formatter.maximumFractionDigits = 2
        _formatter.minimumIntegerDigits = 1
        //_formatter.generatesDecimalNumbers = true
        return _formatter
    }()

    
    override func transformedValue(_ value: Any?) -> Any? {
        
        guard let number = value as? Double else { return ("scheisse") }
       
        //var num: Double = type as! Double
        
        let sign = ((number < 0) ? "-" : "" )
        
       // num = fabs(num)
        
        if (number < 1000.0){
            if number == 0.0 {
                return "-"
            } 
            let nsnumber = number as NSNumber
            return "\(sign)\((formatter.string(from: nsnumber)!))"
        }
        
        let exp:Int = Int(log10(number) / 3.0 ); //log10(1000))
        
        let units:[String] = ["K","M","B","T","P","E"]
        
        let roundedNum:Double = (10 * number / pow(1000.0,Double(exp))) / 10
        
        let result = roundedNum as NSNumber
        
        
        
        return "\(sign)\((formatter.string(from: result)!)) \(units[exp-1])"

//        guard let type = value as? NSNumber else { return ("scheisse") }
//        return ("WOW \(Double(formatter.string(from: type)!) ?? 11)") as String
        
        
    }
}



class ElapsedTimeFormatter: NumberFormatter {
    
    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter
    }()
    
    override func string(from number: NSNumber) -> String? {
        let timeInterval = TimeInterval(number)
        return ("HALLO \(dateFormatter.string(from: NSDate(timeIntervalSinceReferenceDate: timeInterval) as Date))")
    }
}






