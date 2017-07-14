//
//  Family.swift
//  sorting ArrayController
//
//  Created by Albrecht Weber on 29.06.17.
//  Copyright © 2017 Albrecht Weber. All rights reserved.
//

import Cocoa

class CoinNames: NSManagedObject {
    
    var id : String? {
        set {
            if newValue != primitiveValue(forKey: "id") as? String {
                willChangeValue(forKey: "id")
                setPrimitiveValue(newValue, forKey: "id")
                didChangeValue(forKey: "id")
            }
        }
        get {
            return primitiveValue(forKey: "id") as? String
        }
    }

    
    var name : String? {
        set {
            if newValue != primitiveValue(forKey: "name") as? String {
                willChangeValue(forKey: "name")
                setPrimitiveValue(newValue, forKey: "name")
                didChangeValue(forKey: "name")
            }
        }
        get {
            return primitiveValue(forKey: "name") as? String
        }
    }
    
    var logo : Data? {
        set {
            if newValue != primitiveValue(forKey: "logo") as? Data {
                willChangeValue(forKey: "logo")
                setPrimitiveValue(newValue, forKey: "logo")
                didChangeValue(forKey: "logo")
            }
        }
        get {
            return primitiveValue(forKey: "logo") as? Data
        }
    }


    
    
    
    
}

struct GetNames {
    
    static func getCoinName( _ name: String!, _ id: String ) -> CoinNames! {
        
        let request = NSFetchRequest<CoinNames>(entityName: "CoinNames")
        // request.predicate = NSPredicate(format:"name = %@", name)
        
        let predicate1 = NSPredicate(format:"name = %@", name)
        let predicate2 = NSPredicate(format:"id = %@", id)
        request.predicate = NSCompoundPredicate.init(type: .and, subpredicates: [predicate1,predicate2])
        
        do {
            let families = try Context.moc.fetch(request)
            if families.count > 0 {
                return families.first
            }
            
        } catch  {
            
        }
        
        let entity = NSEntityDescription.entity(forEntityName: "CoinNames", in: Context.moc)
        let family = CoinNames(entity: entity!, insertInto: Context.moc)
        family.setValue(name, forKey: "name")
        family.setValue(id, forKey: "id")
        
        return family
    }
    
}






