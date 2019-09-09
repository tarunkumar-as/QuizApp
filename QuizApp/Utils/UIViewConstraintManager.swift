//
//  UIViewConstraintManager.swift
//  QuizApp
//
//  Created by Tarun Kumar on 9/7/19.
//  Copyright © 2019 Tarun Kumar. All rights reserved.
//

import UIKit

extension UIView {
    
    func setDimensionEqualContainerView() {
        setTopAnchor()
        setLeftAnchor()
        setRightAnchor()
        setBottomAnchor()
    }
    
    //MARK: CenterXAnchor
    
    func setCenterXAnchor() {
        self.centerXAnchor.constraint(equalTo: (self.superview?.centerXAnchor)!).isActive = true
    }
    
    func setCenterXAnchor(offset: CGFloat) {
        self.centerXAnchor.constraint(equalTo: (self.superview?.centerXAnchor)!, constant: offset).isActive = true
    }
    
    func setCenterXAnchorRelativeTo(anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>) {
        self.centerXAnchor.constraint(equalTo: anchor, constant: 0).isActive = true
    }
    
    func setCenterXAnchorRelativeTo(anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, offset: CGFloat) {
        self.centerXAnchor.constraint(equalTo: anchor, constant: offset).isActive = true
    }
    
    //MARK: CenterYAnchor
    
    func setCenterYAnchor() {
        self.centerYAnchor.constraint(equalTo: (self.superview?.centerYAnchor)!).isActive = true
    }
    
    func setCenterYAnchor(offset: CGFloat) {
        self.centerYAnchor.constraint(equalTo: (self.superview?.centerYAnchor)!, constant: offset).isActive = true
    }
    
    func setCenterYAnchorRelativeTo(anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>) {
        self.centerYAnchor.constraint(equalTo: anchor, constant: 0).isActive = true
    }
    
    func setCenterYAnchorRelativeTo(anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, offset: CGFloat) {
        self.centerYAnchor.constraint(equalTo: anchor, constant: offset).isActive = true
    }
    
    //MARK: LeftAnchor
    
    func setLeftAnchor() {
        self.leftAnchor.constraint(equalTo: (self.superview?.leftAnchor)!).isActive = true
    }
    
    func setLeftAnchor(offset: CGFloat) {
        self.leftAnchor.constraint(equalTo: (self.superview?.leftAnchor)!, constant: offset).isActive = true
    }
    
    func setLeftAnchorRelativeTo(anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>) {
        self.leftAnchor.constraint(equalTo: anchor, constant: 0).isActive = true
    }
    
    func setLeftAnchorRelativeTo(anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, offset: CGFloat) {
        self.leftAnchor.constraint(equalTo: anchor, constant: offset).isActive = true
    }
    
    //MARK: RightAnchor
    
    func setRightAnchor() {
        self.rightAnchor.constraint(equalTo: (self.superview?.rightAnchor)!).isActive = true
    }
    
    func setRightAnchor(offset: CGFloat) {
        self.rightAnchor.constraint(equalTo: (self.superview?.rightAnchor)!, constant: offset).isActive = true
    }
    
    func setRightAnchorRelativeTo(anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>) {
        self.rightAnchor.constraint(equalTo: anchor, constant: 0).isActive = true
    }
    
    func setRightAnchorRelativeTo(anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, offset: CGFloat) {
        self.rightAnchor.constraint(equalTo: anchor, constant: offset).isActive = true
    }
    
    //MARK: TopAnchor
    
    func setTopAnchor() {
        self.topAnchor.constraint(equalTo: (self.superview?.topAnchor)!).isActive = true
    }
    
    func setTopAnchor(offset: CGFloat) {
        self.topAnchor.constraint(equalTo: (self.superview?.topAnchor)!, constant: offset).isActive = true
    }
    
    func setTopAnchorRelativeTo(anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>) {
        self.topAnchor.constraint(equalTo: anchor, constant: 0).isActive = true
    }
    
    func setTopAnchorRelativeTo(anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, offset: CGFloat) {
        self.topAnchor.constraint(equalTo: anchor, constant: offset).isActive = true
    }
    
    //MARK: BottomAnchor
    
    func setBottomAnchor() {
        self.bottomAnchor.constraint(equalTo: (self.superview?.bottomAnchor)!).isActive = true
    }
    
    func setBottomAnchor(offset: CGFloat) {
        self.bottomAnchor.constraint(equalTo: (self.superview?.bottomAnchor)!, constant: offset).isActive = true
    }
    
    func setBottomAnchorRelativeTo(anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>) {
        self.bottomAnchor.constraint(equalTo: anchor, constant: 0).isActive = true
    }
    
    func setBottomAnchorRelativeTo(anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, offset: CGFloat) {
        self.bottomAnchor.constraint(equalTo: anchor, constant: offset).isActive = true
    }
    
    //MARK: HeightAnchor
    
    func setHeight(height: CGFloat) {
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    func setRelativeHeight(multiplier: CGFloat) {
        self.heightAnchor.constraint(equalTo: (self.superview?.heightAnchor)!, multiplier: multiplier).isActive = true
    }
    
    func setRelativeHeight(relativeDimension: NSLayoutDimension, multiplier: CGFloat) {
        self.heightAnchor.constraint(equalTo: relativeDimension, multiplier: multiplier).isActive = true
    }
    
    func setRelativeHeight(relativeDimension: NSLayoutDimension, multiplier: CGFloat, offset: CGFloat) {
        self.heightAnchor.constraint(equalTo: relativeDimension, multiplier: multiplier, constant: offset).isActive = true
    }
    
    //MARK: WidthAnchor
    
    func setWidth(height: CGFloat) {
        self.widthAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    func setRelativeWidth(multiplier: CGFloat) {
        self.widthAnchor.constraint(equalTo: (self.superview?.widthAnchor)!, multiplier: multiplier).isActive = true
    }
    
    func setRelativeWidth(relativeDimension: NSLayoutDimension, multiplier: CGFloat) {
        self.widthAnchor.constraint(equalTo: relativeDimension, multiplier: multiplier).isActive = true
    }
    
    func setRelativeWidth(relativeDimension: NSLayoutDimension, multiplier: CGFloat, offset: CGFloat) {
        self.widthAnchor.constraint(equalTo: relativeDimension, multiplier: multiplier, constant: offset).isActive = true
    }
}
