//
//  UITextView+.swift
//  RssBankNews
//
//  Created by Nick Chekmazov on 08.12.2020.
//

import UIKit

extension UILabel {
    
    convenience init(font: UIFont, textColor: UIColor) {
        self.init(frame: .zero)
        self.numberOfLines = 0
        self.textAlignment = .center
        self.font = font
        self.textColor = textColor
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
