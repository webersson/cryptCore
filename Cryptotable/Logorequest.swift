//
//  Logorequest.swift
//  Cryptotable
//
//  Created by Albrecht Weber on 04.07.17.
//  Copyright © 2017 Albrecht Weber. All rights reserved.
//

import Cocoa
class LogoRequest {
    
    func download() {
        
        let request = NSFetchRequest<CoinNames>(entityName: "CoinNames")
        request.predicate = NSPredicate(format: "logo = nil")
        
        do {
            let families = try Context.moc.fetch(request)
            
            if families.count > 0 {
                
                let group = DispatchGroup()
                
                families.forEach { coin in
                    if coin.logo == nil {
                        let id = coin.id as! String
                        group.enter()
                        print("starting download....")
                        downloadImage(id) { (data)  in
                            coin.logo = data
                            group.leave()
                        }
                    }
                }
                group.notify(queue: .main) {
                    print("loop finished")
                }
                
            } else {
                print("all logos in store")
                return
            }
        } catch  {
            print("couldn´t get data from core")
        }
    }

    
    
    func getDataFromUrl(id: String, size: String, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        
        let url = "https://files.coinmarketcap.com/static/img/coins/"
        
        guard let checkedUrl = URL(string: "\(url)\(size)/\(id).png") else {
            return
        }
        
        
        URLSession.shared.dataTask(with: checkedUrl) {
            (data, response, error) in
            
           // if size == "16x16" {
            print("downloaded File: \(response?.suggestedFilename ?? checkedUrl.lastPathComponent)")
            // }
            completion(data, response, error)
            }.resume()
    }
    
    func downloadImage(_ id: String, completion: @escaping (_ data: Data?) -> Void) {
        print("Download Started")
        
        
            getDataFromUrl(id: id, size: "200x200") { (data, response, error)  in
                guard let data = data, error == nil else { return }
                
                if data.underestimatedCount < 300 {
                    
                    self.getDataFromUrl(id: id, size: "16x16") { (data, response, error)  in
                        guard let data = data, error == nil else { return }
                        
                        DispatchQueue.main.async() { () -> Void in
                            completion(data)
                        }
                    }
                } else {
                    
                    DispatchQueue.main.async() { () -> Void in
                        completion(data)
                    }
                }
            }
    }
}
