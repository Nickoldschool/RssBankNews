//
//  String+.swift
//  RssBankNews
//
//  Created by Nick Chekmazov on 15.12.2020.
//

import UIKit

extension String {
    
    func verifyUrl (urlString: String?) -> Bool {
       if let urlString = urlString {
           if let url = URL(string: urlString) {
               return UIApplication.shared.canOpenURL(url as URL)
           }
       }
       return false
   }
}
