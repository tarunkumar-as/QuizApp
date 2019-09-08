//
//  UIViewConstraintManager.swift
//  QuizApp
//
//  Created by Tarun Kumar on 9/7/19.
//  Copyright © 2019 Tarun Kumar. All rights reserved.
//

import UIKit

extension UIView {
    
    //MARK: CenterXAnchor
    
    func setCenterXAnchor() {
        self.centerXAnchor.constraint(equalTo: (self.superview?.centerXAnchor)!).isActive = true
    }
    
    func setCenterXAnchor(offset: CGFloat) {
        self.centerXAnchor.constraint(equalTo: (self.superview?.centerXAnchor)!, constant: offset).isActive = true
    }
    
    func setCenterXAnchor(anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>) {
        self.centerXAnchor.constraint(equalTo: anchor, constant: 0).isActive = true
    }
    
    func setCenterXAnchor(anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, offset: CGFloat) {
        self.centerXAnchor.constraint(equalTo: anchor, constant: offset).isActive = true
    }
    
    //MARK: CenterYAnchor
    
    func setCenterYAnchor() {
        self.centerYAnchor.constraint(equalTo: (self.superview?.centerYAnchor)!).isActive = true
    }
    
    func setCenterYAnchor(offset: CGFloat) {
        self.centerYAnchor.constraint(equalTo: (self.superview?.centerYAnchor)!, constant: offset).isActive = true
    }
    
    func setCenterYAnchor(anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>) {
        self.centerYAnchor.constraint(equalTo: anchor, constant: 0).isActive = true
    }
    
    func setCenterYAnchor(anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, offset: CGFloat) {
        self.centerYAnchor.constraint(equalTo: anchor, constant: offset).isActive = true
    }
    
    //MARK: LeftAnchor
    
    func setLeftAnchor() {
        self.leftAnchor.constraint(equalTo: (self.superview?.leftAnchor)!).isActive = true
    }
    
    func setLeftAnchor(offset: CGFloat) {
        self.leftAnchor.constraint(equalTo: (self.superview?.leftAnchor)!, constant: offset).isActive = true
    }
    
    func setLeftAnchor(anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>) {
        self.leftAnchor.constraint(equalTo: anchor, constant: 0).isActive = true
    }
    
    func setLeftAnchor(anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, offset: CGFloat) {
        self.leftAnchor.constraint(equalTo: anchor, constant: offset).isActive = true
    }
    
    //MARK: RightAnchor
    
    func setRightAnchor() {
        self.rightAnchor.constraint(equalTo: (self.superview?.rightAnchor)!).isActive = true
    }
    
    func setRightAnchor(offset: CGFloat) {
        self.rightAnchor.constraint(equalTo: (self.superview?.rightAnchor)!, constant: offset).isActive = true
    }
    
    func setRightAnchor(anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>) {
        self.rightAnchor.constraint(equalTo: anchor, constant: 0).isActive = true
    }
    
    func setRightAnchor(anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, offset: CGFloat) {
        self.rightAnchor.constraint(equalTo: anchor, constant: offset).isActive = true
    }
    
    //MARK: TopAnchor
    
    func setTopAnchor() {
        self.topAnchor.constraint(equalTo: (self.superview?.topAnchor)!).isActive = true
    }
    
    func setTopAnchor(offset: CGFloat) {
        self.topAnchor.constraint(equalTo: (self.superview?.topAnchor)!, constant: offset).isActive = true
    }
    
    func setTopAnchor(anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>) {
        self.topAnchor.constraint(equalTo: anchor, constant: 0).isActive = true
    }
    
    func setTopAnchor(anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, offset: CGFloat) {
        self.topAnchor.constraint(equalTo: anchor, constant: offset).isActive = true
    }
    
    //MARK: BottomAnchor
    
    func setBottomAnchor() {
        self.bottomAnchor.constraint(equalTo: (self.superview?.bottomAnchor)!).isActive = true
    }
    
    func setBottomAnchor(offset: CGFloat) {
        self.bottomAnchor.constraint(equalTo: (self.superview?.bottomAnchor)!, constant: offset).isActive = true
    }
    
    func setBottomAnchor(anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>) {
        self.bottomAnchor.constraint(equalTo: anchor, constant: 0).isActive = true
    }
    
    func setBottomAnchor(anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, offset: CGFloat) {
        self.bottomAnchor.constraint(equalTo: anchor, constant: offset).isActive = true
    }
}
