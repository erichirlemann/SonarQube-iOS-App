//
//  UnderlinedLabel.swift
//  SonarQube
//
//  Created by Elena Vilchik on 08/10/15.
//  Copyright © 2015 SonarSource. All rights reserved.
//

import Foundation
import UIKit

class UnderlinedLabel: UILabel {
    
    override var text: String! {
        
        didSet {
            let length = text.characters.count
            let textRange = NSMakeRange(0, length)
            let attributedText = NSMutableAttributedString(string: text)
            attributedText.addAttribute(NSUnderlineStyleAttributeName , value:NSUnderlineStyle.StyleSingle.rawValue, range: textRange)
            // Add other attributes if needed
            
            self.attributedText = attributedText
        }
    }
}