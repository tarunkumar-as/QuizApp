//
//  LoginViewController.swift
//  QuizApp
//
//  Created by Tarun Kumar on 9/5/19.
//  Copyright © 2019 Tarun Kumar. All rights reserved.
//

import UIKit

protocol LoginProtocol: class {
    func loginSuccessful()
    func loginFailed()
}

class LoginViewController: UIViewController {
    
    weak var appDelegate: LoginProtocol?
    private var appImage: UIImageView?
    private var googleButton: UIButton?
    private var faceBookButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
    }
    
    func signInSuccessful() {
        appDelegate?.loginSuccessful()
    }
}

extension LoginViewController {
    
    private func addViews() {
        addAppImage()
        addGoogleSignIn()
        addFacebookSignIn()
        addViewConstraints()
    }
    
    private func addAppImage() {
        if appImage == nil {
            appImage = UIImageView(image: UIImage(named: "Logo.png"))
            appImage?.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(appImage!)
        }
    }
    
    private func addGoogleSignIn() {
        if googleButton == nil {
            googleButton = UIButton(type: UIButton.ButtonType.custom)
            googleButton?.translatesAutoresizingMaskIntoConstraints = false
            googleButton?.addTarget(self, action: #selector(self.googleSignInButtonPressed(sender:)), for: UIControl.Event.touchUpInside)
            googleButton?.backgroundColor = UIColor.white
            self.view.addSubview(googleButton!)
        }
        
        let buttonImage = UIImageView(image: UIImage(named: "Google.png"))
        buttonImage.translatesAutoresizingMaskIntoConstraints = false
        buttonImage.contentMode = UIView.ContentMode.scaleToFill
        googleButton?.addSubview(buttonImage)
        
        let buttonTitle = UILabel()
        buttonTitle.translatesAutoresizingMaskIntoConstraints = false
        buttonTitle.text = localizedString("login.google")
        buttonTitle.textAlignment = NSTextAlignment.center
        buttonTitle.textColor = UIColor.gray
        googleButton?.addSubview(buttonTitle)
        
        buttonImage.centerYAnchor.constraint(equalTo: (googleButton?.centerYAnchor)!).isActive = true
        buttonImage.leadingAnchor.constraint(equalTo: (googleButton?.leadingAnchor)!, constant: 15).isActive = true
        buttonImage.widthAnchor.constraint(equalToConstant: 35).isActive = true
        buttonImage.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        buttonTitle.centerYAnchor.constraint(equalTo: (googleButton?.centerYAnchor)!).isActive = true
        buttonTitle.leadingAnchor.constraint(equalTo: buttonImage.trailingAnchor, constant: 5).isActive = true
        buttonTitle.trailingAnchor.constraint(equalTo: (googleButton?.trailingAnchor)!, constant: -5).isActive = true
    }
    
    private func addFacebookSignIn() {
        if faceBookButton == nil {
            faceBookButton = UIButton(type: UIButton.ButtonType.custom)
            faceBookButton?.translatesAutoresizingMaskIntoConstraints = false
            faceBookButton?.addTarget(self, action: #selector(self.facebookSignInPressed(sender:)), for: UIControl.Event.touchUpInside)
            faceBookButton?.backgroundColor = UIColor(red: 67/255, green: 96/255, blue: 180/255, alpha: 1.0)
            self.view.addSubview(faceBookButton!)
        }
        
        let buttonImage = UIImageView(image: UIImage(named: "Facebook.png"))
        buttonImage.translatesAutoresizingMaskIntoConstraints = false
        buttonImage.contentMode = UIView.ContentMode.scaleToFill
        faceBookButton?.addSubview(buttonImage)
        
        let buttonTitle = UILabel()
        buttonTitle.translatesAutoresizingMaskIntoConstraints = false
        buttonTitle.text = localizedString("login.facebook")
        buttonTitle.textAlignment = NSTextAlignment.center
        buttonTitle.textColor = UIColor.white
        faceBookButton?.addSubview(buttonTitle)
        
        buttonImage.centerYAnchor.constraint(equalTo: (faceBookButton?.centerYAnchor)!).isActive = true
        buttonImage.leadingAnchor.constraint(equalTo: (faceBookButton?.leadingAnchor)!).isActive = true
        buttonImage.widthAnchor.constraint(equalToConstant: 70).isActive = true
        buttonImage.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        buttonTitle.centerYAnchor.constraint(equalTo: (faceBookButton?.centerYAnchor)!).isActive = true
        buttonTitle.leadingAnchor.constraint(equalTo: buttonImage.trailingAnchor, constant: 5).isActive = true
        buttonTitle.trailingAnchor.constraint(equalTo: (faceBookButton?.trailingAnchor)!, constant: -5).isActive = true
    }
    
    private func addViewConstraints() {
        appImage?.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        appImage?.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        appImage?.widthAnchor.constraint(equalToConstant: 100).isActive = true
        appImage?.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        googleButton?.heightAnchor.constraint(equalToConstant: 70).isActive = true
        googleButton?.bottomAnchor.constraint(equalTo: (faceBookButton?.topAnchor)!, constant: -20).isActive = true
        googleButton?.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        googleButton?.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
        faceBookButton?.heightAnchor.constraint(equalToConstant: 70).isActive = true
        faceBookButton?.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        faceBookButton?.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
        faceBookButton?.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        faceBookButton?.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
    }
    
    @objc private func googleSignInButtonPressed(sender: UIButton) {
        signInSuccessful()
    }
    
    @objc private func facebookSignInPressed(sender: UIButton) {
        signInSuccessful()
    }
}
