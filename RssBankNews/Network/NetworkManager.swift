//
//  NetworkManager.swift
//  RssBankNews
//
//  Created by Nick Chekmazov on 03.12.2020.
//

import UIKit

class NetworkManager: NSObject {
    
    var posts: [Post] = []
    
    var url: URL? {
        nil
        // Get and Set via User defaults
    }
    
    var currentElement: String = ""
    
    var currentTitle: String = "" {
        didSet {
            currentTitle = currentTitle.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    
    var currentDescription: String = "" {
        didSet {
            currentDescription = currentDescription.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            currentDescription = currentDescription.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
        }
    }
    
    var currentPubDate: String = "" {
        didSet {
            currentPubDate = currentPubDate.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            currentPubDate = currentPubDate.replacingOccurrences(of: "+0300", with: "")
        }
    }
    
    var parserCompletionHandler: (([Post])-> Void)?
    
    func parseNews(url: String, completionHandler: (([Post])-> Void)?) {
        self.parserCompletionHandler = completionHandler
        
        let request = URLRequest(url: URL(string: url)!)
        let urlSession = URLSession.shared
        let task = urlSession.dataTask(with: request) { (data, responce, error) in
            guard let data = data else {
                if let error = error {
                    print(error.localizedDescription)
                }
                return
            }
            if data != nil {
                self.posts.removeAll()
                let parser = XMLParser(data: data)
                parser.delegate = self
                parser.parse()
            }
        }
        task.resume()
    }
}
