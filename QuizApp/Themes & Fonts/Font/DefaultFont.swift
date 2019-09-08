//
//  DefaultFont.swift
//  QuizApp
//
//  Created by Tarun Kumar on 9/6/19.
//  Copyright © 2019 Tarun Kumar. All rights reserved.
//

import UIKit

class DefaultFont: FontProtocol {
    
    func appFontVerySmallSize() -> UIFont {
        return UIFont(name: "HelveticaNeue", size: 12)!
    }
    
    func appFontSmallSize() -> UIFont {
        return UIFont(name: "HelveticaNeue", size: 13)!
    }
    
    func appFontNormalSize() -> UIFont {
        return UIFont(name: "HelveticaNeue", size: 14)!
    }
    
    func appFontMediumSize() -> UIFont {
        return UIFont(name: "HelveticaNeue", size: 15)!
    }
    
    func appFontLargeSize() -> UIFont {
        return UIFont(name: "HelveticaNeue", size: 16)!
    }
    
    func appFontVeryLargeSize() -> UIFont {
        return UIFont(name: "HelveticaNeue", size: 17)!
    }
}

