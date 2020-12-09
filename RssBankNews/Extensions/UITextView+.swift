//
//  UITextView+.swift
//  RssBankNews
//
//  Created by Nick Chekmazov on 08.12.2020.
//

import UIKit

extension UITextView {
    
    convenience init(font: UIFont) {
        self.init(frame: .zero)
        self.font = font
        self.translatesAutoresizingMaskIntoConstraints = false
        self.isEditable = false
    }
}
