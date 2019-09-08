//
//  AppColors.swift
//  QuizApp
//
//  Created by Tarun Kumar on 9/6/19.
//  Copyright © 2019 Tarun Kumar. All rights reserved.
//

import UIKit

protocol ThemeProtocol {
    func appBackgroundColor() -> UIColor
    func appTitleColor() -> UIColor
    func appSubtitleColor() -> UIColor
}

class ThemeManager {
    
    private static var sharedInstance: ThemeProtocol?
    
    static var currentTheme: ThemeProtocol = {
        if sharedInstance == nil {
            sharedInstance = DefaultTheme()
        }
        return sharedInstance!
    }()
    
    static func setTheme(themeValue: String) {
        if themeValue == DEFAULT_THEME {
            sharedInstance = DefaultTheme()
        }
        NotificationCenter.default.post(name: Notification.Name(rawValue: NOTIFICATION_THEME_CHANGED), object: nil)
    }
    
    static func resetTheme() {
        sharedInstance = nil
    }
}
