//
//  ProfileViewController.swift
//  QuizApp
//
//  Created by Tarun Kumar on 9/5/19.
//  Copyright © 2019 Tarun Kumar. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    private var scrollView: UIScrollView?
    private var scrollViewContentView: UIView?
    
    private var userPhoto: UIImageView?
    private var userInfo: UILabel?
    
    private var leaderBoardTitle: UILabel?
    private var leaderBoardText: UILabel?
    
    private var certificationTitle: UILabel?
    private var certificationText:UILabel?
    
    //MARK: ViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeViewController()
        addViewControllerViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    //MARK: View Customization
    
    private func customizeViewController() {
        view.backgroundColor = UIColor.init(redInt: 241, greenInt: 244, blueInt: 245, alpha: 1.0)
    }
    
    private func addViewControllerViews() {
        addScrollView()
        addUserMainInfo()
        addLeaderBoardInfo()
        addCertificationInfo()
    }
    
    private func addScrollView() {
        if scrollView == nil {
            scrollView = UIScrollView(frame: CGRect.zero)
            scrollView?.translatesAutoresizingMaskIntoConstraints = false
            scrollView?.backgroundColor = UIColor.white
            self.view.addSubview(scrollView!)
            scrollView?.setDimensionEqualContainerView()
        }
        
        if scrollViewContentView == nil {
            scrollViewContentView = UIView()
            scrollViewContentView?.translatesAutoresizingMaskIntoConstraints = false
            scrollView?.addSubview(scrollViewContentView!)
            scrollViewContentView?.setDimensionEqualContainerView()
            scrollViewContentView?.setHeight(height: view.bounds.size.height - 50)
            scrollViewContentView?.setWidth(width: view.bounds.size.width)
        }
    }
    
    private func removeScrollView() {
        scrollViewContentView?.removeFromSuperview()
        scrollViewContentView = nil
        scrollView?.removeFromSuperview()
        scrollView = nil
    }
    
    private func addUserMainInfo() {
        if userPhoto == nil {
            userPhoto = UIImageView(image: UIImage(named: "user.png"))
            userPhoto?.translatesAutoresizingMaskIntoConstraints = false
            userPhoto?.contentMode = UIView.ContentMode.scaleAspectFit
            scrollViewContentView?.addSubview(userPhoto!)
        }
        if userInfo == nil {
            userInfo = UILabel()
            userInfo?.translatesAutoresizingMaskIntoConstraints = false
            userInfo?.numberOfLines = 0
            userInfo?.text = """
            Name: John
            Points: 320
            Total Quiz: 70
            """
            scrollViewContentView?.addSubview(userInfo!)
        }
        
        userPhoto?.setWidth(width: 125)
        userPhoto?.setHeight(height: 125)
        userPhoto?.setTopAnchor(offset: 15)
        userPhoto?.setLeftAnchor(offset: 25)
        
        userInfo?.setCenterYAnchorRelativeTo(anchor: (userPhoto?.centerYAnchor)!)
        userInfo?.setRightAnchor(offset: -15)
        userInfo?.setLeftAnchorRelativeTo(anchor: (userPhoto?.rightAnchor)!, offset: 15)
    }
    
    private func addLeaderBoardInfo() {
        if leaderBoardTitle == nil {
            leaderBoardTitle = UILabel()
            leaderBoardTitle?.translatesAutoresizingMaskIntoConstraints = false
            leaderBoardTitle?.font = CURRENT_FONT.appFontLargeSize()
            leaderBoardTitle?.text = "Leaderboard"
            leaderBoardTitle?.numberOfLines = 0
            scrollViewContentView?.addSubview(leaderBoardTitle!)
        }
        if leaderBoardText == nil {
            leaderBoardText = UILabel()
            leaderBoardText?.translatesAutoresizingMaskIntoConstraints = false
            leaderBoardText?.numberOfLines = 0
            leaderBoardText?.font = CURRENT_FONT.appFontMediumSize()
            leaderBoardText?.text = """
            Rank: 750
            Challenges Completed: 370
            Available Score: 10
            """
            scrollViewContentView?.addSubview(leaderBoardText!)
        }
        
        leaderBoardTitle?.setTopAnchorRelativeTo(anchor: (userPhoto?.bottomAnchor)!, offset: 25)
        leaderBoardTitle?.setLeftAnchor(offset: 25)
        leaderBoardTitle?.setRightAnchor(offset: -25)
        
        leaderBoardText?.setTopAnchorRelativeTo(anchor: (leaderBoardTitle?.bottomAnchor)!, offset: 5)
        leaderBoardText?.setLeftAnchor(offset: 25)
        leaderBoardText?.setRightAnchor(offset: -25)
    }
    
    private func addCertificationInfo() {
        if certificationTitle == nil {
            certificationTitle = UILabel()
            certificationTitle?.translatesAutoresizingMaskIntoConstraints = false
            certificationTitle?.text = "Certification"
            scrollViewContentView?.addSubview(certificationTitle!)
        }
        if certificationText == nil {
            certificationText = UILabel()
            certificationText?.translatesAutoresizingMaskIntoConstraints = false
            certificationText?.numberOfLines = 0
            certificationText?.text = """
            SQL
            Python
            R
            """
            scrollViewContentView?.addSubview(certificationText!)
        }
        
        certificationTitle?.setTopAnchorRelativeTo(anchor: (leaderBoardText?.bottomAnchor)!, offset: 25)
        certificationTitle?.setLeftAnchor(offset: 25)
        certificationTitle?.setRightAnchor(offset: -25)
        
        certificationText?.setTopAnchorRelativeTo(anchor: (certificationTitle?.bottomAnchor)!, offset: 5)
        certificationText?.setLeftAnchor(offset: 25)
        certificationText?.setRightAnchor(offset: -25)
    }
}
