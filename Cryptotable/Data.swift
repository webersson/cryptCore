//
//  Context.swift
//  Bouquins iOS
//
//  Created by Louis on 2017-03-28.
//  Copyright Â© 2017 Louis. All rights reserved.
//

#if os(macOS)
    import Cocoa
#else
    // import UIKit
#endif
import CoreData


class Context: NSObject {
    
    static var modelName = "Default"   /// mocModel
    
    static var fileName = ""   /// mocFileName
    
    static var folderName = ""  /// mocFolderName
    
    static let shared = Context()
    
    static var moc : NSManagedObjectContext {
        get {
            return Context.shared.managedObjectContext
        }
    }
    
    static var model : NSManagedObjectModel {
        get {
            return Context.shared.managedObjectModel
        }
    }
    
    func saveContext() {
        
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                let nserror = error as NSError
                print(nserror)
            }
        }
    }
    
    lazy var applicationDocumentsDirectory : Foundation.URL = {
        
        // The directory the application uses to store the Core Data store file. This code uses a directory named "com.apple.toolsQA.CocoaApp_CD" in the user's Application Support directory.
        #if os(iOS)
            let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        #else
            if let plist = Bundle.main.infoDictionary, let folderName = plist["mocFolderName"] as? String {
                Context.folderName = folderName
            }
            var urls : [URL]
            
            if Context.folderName.isEmpty == true {
                urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            } else {
                urls = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)
            }
        #endif
        
        let appSupportURL = urls[urls.count - 1]
        
        #if os(iOS)
            print(appSupportURL.path)
            return appSupportURL
        #else
            return appSupportURL.appendingPathComponent(Context.folderName)
        #endif
    }()
    
    lazy var managedObjectModel: NSManagedObjectModel = {
        
        if let plist = Bundle.main.infoDictionary, let modelName = plist["mocModel"] as? String {
            Context.modelName = modelName
        }
        // The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
        
        let modelURL = Bundle.main.url(forResource: Context.modelName, withExtension: "momd")!
        return NSManagedObjectModel(contentsOf: modelURL)!
    }()
    
    lazy var managedObjectContext: NSManagedObjectContext = {
        // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
        let coordinator = self.persistentStoreCoordinator
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()
    
    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it. (The directory for the store is created, if necessary.) This property is optional since there are legitimate error conditions that could cause the creation of the store to fail.
        let fileManager = FileManager.default
        var failError: NSError? = nil
        var shouldFail = false
        var failureReason = "There was an error creating or loading the application's saved data."
        
        // Make sure the application files directory is there
        do {
            let properties = try self.applicationDocumentsDirectory.resourceValues(forKeys: [URLResourceKey.isDirectoryKey])
            if !properties.isDirectory! {
                failureReason = "Expected a folder to store application data, found a file \(self.applicationDocumentsDirectory.path)."
                shouldFail = true
            }
        } catch  {
            let nserror = error as NSError
            if nserror.code == NSFileReadNoSuchFileError {
                do {
                    try fileManager.createDirectory(atPath: self.applicationDocumentsDirectory.path, withIntermediateDirectories: true, attributes: nil)
                } catch {
                    failError = nserror
                }
            } else {
                failError = nserror
            }
        }
        
        // Create the coordinator and store
        var coordinator: NSPersistentStoreCoordinator? = nil
        if failError == nil {
            
            var storeType = NSSQLiteStoreType
            
            if let plist = Bundle.main.infoDictionary {
                
                if Context.fileName.isEmpty == true, let fileName = plist["mocFileName"] as? String {
                    Context.fileName = fileName
                }
                
                if let mocStoreType = plist["mocStoreType"] as? String {
                    storeType = mocStoreType
                }
            }
            
            if Context.fileName.isEmpty == true {
                Context.fileName = "Default.sql"
            }
            
            coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
            let url = self.applicationDocumentsDirectory.appendingPathComponent(Context.fileName)
            let mOptions = [NSMigratePersistentStoresAutomaticallyOption: true,
                            NSInferMappingModelAutomaticallyOption: true]
            do {
                try coordinator!.addPersistentStore(ofType:storeType, configurationName: nil, at: url, options: mOptions)
                
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                
                /*
                 Typical reasons for an error here include:
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                failError = error as NSError
            }
        }
        
        if shouldFail || (failError != nil) {
            // Report any error we got.
            if let error = failError {
                
                #if os(iOS)
                    // UIApplication.shared.presentError(error)
                #else
                    NSApplication.shared().presentError(error)
                #endif
                
                fatalError("Unresolved error: \(error), \(error.userInfo)")
            }
            fatalError("Unsresolved error: \(failureReason)")
            
        } else {
            return coordinator!
        }
        
    }()
    
    class func propertyUserInfoForItemKey( _ item : NSManagedObject?, key: String! ) -> [String:Any]? {
        
        if let item = item, let prop = item.entity.propertiesByName[key], let userInfo = prop.userInfo as? [String:Any] {
            return userInfo
        }
        return nil
    }
    
    class func propertyUserInfoValueForItemKey(  _ item : NSManagedObject?, key: String!, infoKey: String! ) -> String? {
        
        if let propInfo = Context.propertyUserInfoForItemKey(item, key: key),
            let value = propInfo[infoKey] as? String {
            return value
        }
        
        return nil
    }
    
}
