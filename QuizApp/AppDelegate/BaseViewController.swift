//
//  BaseViewController.swift
//  QuizApp
//
//  Created by Tarun Kumar on 9/5/19.
//  Copyright © 2019 Tarun Kumar. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, UITabBarControllerDelegate {
    
    private lazy var mainTabBarController: UITabBarController = {
        let tabBarController:UITabBarController = UITabBarController()
        tabBarController.delegate = self
        return tabBarController
    }()
    
    private var downloadsNavigtaionController: UINavigationController?
    private lazy var downloadsViewController: DownloadsViewController = {
        let viewController = DownloadsViewController()
        return viewController
    }()
    
    private var exploreNavigtaionController: UINavigationController?
    private lazy var exploreViewController: ExploreViewController = {
        let viewController = ExploreViewController()
        return viewController
    }()
    
    private var learnNavigtaionController: UINavigationController?
    private lazy var learnViewController: LearnViewController = {
        let viewController = LearnViewController()
        return viewController
    }()
    
    private var profileNavigtaionController: UINavigationController?
    private lazy var profileViewController: ProfileViewController = {
        let viewController = ProfileViewController()
        return viewController
    }()
    
    private var recommendedNavigtaionController: UINavigationController?
    private lazy var recommendedViewController: RecommendedViewController = {
        let viewController = RecommendedViewController()
        return viewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeViewController()
        setUpViewControllers()
        addTabBarcontroller()
    }
    
    private func customizeViewController() {
        self.view.backgroundColor = UIColor.white
    }
    
    private func setUpViewControllers() {
        if downloadsNavigtaionController == nil {
            downloadsNavigtaionController = UINavigationController(rootViewController: downloadsViewController)
        }
        if exploreNavigtaionController == nil {
            exploreNavigtaionController = UINavigationController(rootViewController: exploreViewController)
        }
        if learnNavigtaionController == nil {
            learnNavigtaionController = UINavigationController(rootViewController: learnViewController)
        }
        if profileNavigtaionController == nil {
            profileNavigtaionController = UINavigationController(rootViewController: profileViewController)
        }
        if recommendedNavigtaionController == nil {
            recommendedNavigtaionController = UINavigationController(rootViewController: recommendedViewController)
        }
    }
    
    private func addTabBarItem(tabBarImage: UIImage?, tabBarTitle: String) -> UITabBarItem {
        let tabBarItem = UITabBarItem()
        tabBarItem.image = tabBarImage
        tabBarItem.title = tabBarTitle
        return tabBarItem
    }
    
    private func addTabBarcontroller() {
        UITabBar.appearance().shadowImage = UIImage()
        mainTabBarController.tabBar.tintColor = CURRENT_THEME.appTitleColor()
        mainTabBarController.tabBar.isTranslucent = false
        
        downloadsNavigtaionController?.tabBarItem = addTabBarItem(tabBarImage: UIImage(named: "Download.png"), tabBarTitle: localizedString("title.downloads"))
        exploreNavigtaionController?.tabBarItem = addTabBarItem(tabBarImage: UIImage(named: "Explore.png"), tabBarTitle: localizedString("title.explore"))
        learnNavigtaionController?.tabBarItem = addTabBarItem(tabBarImage: UIImage(named: "Learn.png"), tabBarTitle: localizedString("title.learn"))
        profileNavigtaionController?.tabBarItem = addTabBarItem(tabBarImage: UIImage(named: "Profile.png"), tabBarTitle: localizedString("title.profile"))
        recommendedNavigtaionController?.tabBarItem = addTabBarItem(tabBarImage: UIImage(named: "Recommended.png"), tabBarTitle: localizedString("title.recommended"))
        
        mainTabBarController.viewControllers = [exploreNavigtaionController!, recommendedNavigtaionController!, learnNavigtaionController!, downloadsNavigtaionController!, profileNavigtaionController!]
        mainTabBarController.selectedIndex = 0
        
        self.addChild(mainTabBarController)
        self.view.addSubview(mainTabBarController.view)
        mainTabBarController.didMove(toParent: self)
        
        mainTabBarController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mainTabBarController.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        mainTabBarController.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        mainTabBarController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}
