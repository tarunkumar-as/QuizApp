//
//  ExploreViewController.swift
//  QuizApp
//
//  Created by Tarun Kumar on 9/5/19.
//  Copyright © 2019 Tarun Kumar. All rights reserved.
//

import UIKit

class ExploreViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerViewControllerForThemeAndFontChange()
        initialzeViewController()
    }
    
    private func initialzeViewController() {
        customizeNavigationBar()
        addTableView()
    }
    
    private func customizeNavigationBar() {
        
    }
    
    private func addTableView() {
        if tableView == nil {
            tableView = UITableView(frame: CGRect.zero, style: UITableView.Style.plain)
        }
        tableView?.translatesAutoresizingMaskIntoConstraints = false
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.rowHeight = 250
        tableView?.separatorStyle = UITableViewCell.SeparatorStyle.none
        view.addSubview(tableView!)
        
        tableView?.setTopAnchorRelativeTo(anchor: view.safeAreaLayoutGuide.topAnchor)
        tableView?.setLeftAnchorRelativeTo(anchor: view.safeAreaLayoutGuide.leftAnchor)
        tableView?.setRightAnchorRelativeTo(anchor: view.safeAreaLayoutGuide.rightAnchor)
        tableView?.setBottomAnchorRelativeTo(anchor: view.safeAreaLayoutGuide.bottomAnchor)
    }
    
    //MARK: UITableView Delegate Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var tableViewCell = tableView.dequeueReusableCell(withIdentifier: "ExploreTableViewCell")
        if tableViewCell == nil {
            tableViewCell = ExploreTableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "ExploreTableViewCell")
        }
        return tableViewCell!
    }
}
