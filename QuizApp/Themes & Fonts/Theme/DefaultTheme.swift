//
//  DefaultTheme.swift
//  QuizApp
//
//  Created by Tarun Kumar on 9/6/19.
//  Copyright © 2019 Tarun Kumar. All rights reserved.
//

import UIKit

class DefaultTheme: ThemeProtocol {
    
    func appBackgroundColor() -> UIColor {
        return UIColor.init(redInt: 60, greenInt: 116, blueInt: 208, alpha: 1.0)
    }
    
    func appTitleColor() -> UIColor {
        return UIColor.init(redInt: 60, greenInt: 116, blueInt: 208, alpha: 1.0)
    }
    
    func appSubtitleColor() -> UIColor {
        return UIColor.init(redInt: 60, greenInt: 116, blueInt: 208, alpha: 1.0)
    }
}
