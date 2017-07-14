//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"


func getDataFromUrl(url: URL, completion: @escaping (_ asdf: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
    URLSession.shared.dataTask(with: url) {
        (asdf, response, error) in
        completion(asdf, response, error)
        }.resume()
}

func downloadImage(url: URL) {
    print("Download Started")
    getDataFromUrl(url: url) { (data, response, error)  in
        guard let data = data, error == nil else { return }
        print(response?.suggestedFilename ?? url.lastPathComponent)
        print("Download Finished")
        DispatchQueue.main.async() { () -> Void in
            //self.imageView.image = NSImage(data: data)
        }
    }
}

func get() {
    if let checkedUrl = URL(string: "http://www.apple.com/euro/ios/ios8/a/generic/images/og.png") {
        downloadImage(url: checkedUrl)
    
}
}

get()





