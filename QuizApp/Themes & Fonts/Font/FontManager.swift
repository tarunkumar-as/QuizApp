//
//  FontManager.swift
//  QuizApp
//
//  Created by Tarun Kumar on 9/6/19.
//  Copyright © 2019 Tarun Kumar. All rights reserved.
//

import UIKit

protocol FontProtocol {
    func appFontVerySmallSize() -> UIFont
    func appFontSmallSize() -> UIFont
    func appFontNormalSize() -> UIFont
    func appFontMediumSize() -> UIFont
    func appFontLargeSize() -> UIFont
    func appFontVeryLargeSize() -> UIFont
}

class FontManager {

    private static var sharedInstance: FontProtocol?
    
    static var currentFont: FontProtocol = {
        if sharedInstance == nil {
            sharedInstance = DefaultFont()
        }
        return sharedInstance!
    }()
    
    static func setFont(fontValue: String) {
        if fontValue == DEFAULT_FONT {
            sharedInstance = DefaultFont()
        }
        NotificationCenter.default.post(name: Notification.Name(rawValue: NOTIFICATION_FONT_CHANGED), object: nil)
    }
    
    static func resetFont() {
        sharedInstance = nil
    }
}
