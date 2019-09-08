//
//  Extensions.swift
//  QuizApp
//
//  Created by Tarun Kumar on 9/7/19.
//  Copyright © 2019 Tarun Kumar. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(redInt: Int, greenInt: Int, blueInt: Int, alpha: CGFloat) {
        self.init(red: CGFloat(redInt)/255, green: CGFloat(greenInt)/255, blue: CGFloat(blueInt)/255, alpha: alpha)
    }
}

extension UIViewController {
    
    func registerViewControllerForThemeChange() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.themeChanged), name: NSNotification.Name(rawValue: NOTIFICATION_THEME_CHANGED), object: nil)
    }
    
    func registerViewControllerForFontChange() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.fontChanged), name: NSNotification.Name(rawValue: NOTIFICATION_FONT_CHANGED), object: nil)
    }
    
    func registerViewControllerForThemeAndFontChange() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.themeChanged), name: NSNotification.Name(rawValue: NOTIFICATION_THEME_CHANGED), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.fontChanged), name: NSNotification.Name(rawValue: NOTIFICATION_FONT_CHANGED), object: nil)
    }
    
    @objc func themeChanged() {
        
    }
    
    @objc func fontChanged() {
        
    }
}
