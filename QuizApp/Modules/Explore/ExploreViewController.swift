//
//  ExploreViewController.swift
//  QuizApp
//
//  Created by Tarun Kumar on 9/5/19.
//  Copyright © 2019 Tarun Kumar. All rights reserved.
//

import UIKit

class ExploreViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ExploreTableViewDelegate {
    
    private lazy var coursesModel: CoursesModel = {
        let model = CoursesModel()
        return model
    }()
    private lazy var questionsModel: QuestionsModel = {
        let model = QuestionsModel()
        return model
    }()
    private var tableView: UITableView?
    private lazy var questionViewController: QuestionViewController = {
        let viewController = QuestionViewController()
        return viewController
    }()
    
    private var mainCategoriesList: [String] = []
    private var coursesContent: [[String : Any]] = []
    private var questionsContent: [[String : Any]] = []
    
    //MARK: ViewController Related Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerViewControllerForThemeAndFontChange()
        initialzeViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchDataFromModel()
    }
    
    //MARK: View Customization
    
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
        return mainCategoriesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var tableViewCell = tableView.dequeueReusableCell(withIdentifier: "ExploreTableViewCell") as? ExploreTableViewCell
        if tableViewCell == nil {
            tableViewCell = ExploreTableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "ExploreTableViewCell")
        }
        tableViewCell?.delegate = self
        
        let colorIndex: Int = indexPath.row % AppConstants.CATEGORY_COLOR_LIST.count
        let sectionTitle = mainCategoriesList[indexPath.row]
        
        let coursesList = coursesContent.filter { (obj) -> Bool in
            obj[AppConstants.Questions_Response_Key.CATEGORIE.rawValue] as! String == sectionTitle
        }
        tableViewCell?.populateDate(sectionColor: AppConstants.CATEGORY_COLOR_LIST[colorIndex], sectionTitle: mainCategoriesList[indexPath.row], sectionData: coursesList)
        return tableViewCell!
    }
    
    //MARK: ExploreTableViewDelegate Methods
    
    func courseSelected(index: Int) {
        questionViewController.hidesBottomBarWhenPushed = true
        questionViewController.setQuestionsData(questionNumber: 0, questionsSet: questionsContent)
        navigationController?.pushViewController(questionViewController, animated: true)
    }
    
    //MARK: Model Related Methods
    
    private func fetchDataFromModel() {
        coursesContent = coursesModel.getCoursesList()
        questionsContent = questionsModel.getQuestionsList()
        mainCategoriesList = coursesModel.getMainCategoriesList()
    }
}
