//
//  NetworkManager.swift
//  RssBankNews
//
//  Created by Nick Chekmazov on 03.12.2020.
//

import UIKit

final class NetworkManager {
    
    let networkParser = Parser()
    
    func parseNews(url: String, completionHandler: (([Post])-> Void)?) {
        self.networkParser.parserCompletionHandler = completionHandler
        
        let request = URLRequest(url: URL(string: url)!)
        let urlSession = URLSession.shared
        let task = urlSession.dataTask(with: request) { (data, responce, error) in
            guard let data = data else {
                if let error = error {
                    print(error.localizedDescription)
                }
                return
            }
            self.networkParser.posts.removeAll()
            let parser = XMLParser(data: data)
            parser.delegate = self.networkParser
            parser.parse()
        }
        task.resume()
    }
}
