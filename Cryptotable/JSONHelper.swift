import Cocoa

struct JSONHelper {
    static func double(fromJsonObject obj: String?) -> Double? {
        guard   let string = obj, let double = Double(string) else { return 0 }
        return double
            
       
    }
    
    static func integer(fromJsonObject obj: String?) -> Int? {
        guard let string = obj, let integer = Int(string) else { return 0 }
        return integer
    }

    static func string(fromJsonObject obj: String?) -> String? {
        guard let string = obj, let istString = String(string) else { return "no data" }
        return istString
    }




}

