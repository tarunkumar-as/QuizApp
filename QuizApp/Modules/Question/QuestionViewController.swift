//
//  QuestionViewController.swift
//  QuizApp
//
//  Created by Tarun Kumar on 9/17/19.
//  Copyright © 2019 Tarun Kumar. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    private var scrollView: UIScrollView?
    private var scrollViewContentView: UIView?
    
    private var statusView: UIView?
    private var completedView: UIView?
    private var mainQuestion: UILabel?
    private var answerView: OptionsView?
    private var submitButton: UIButton?
    
    private var questionsDict: [[String : Any]] = []
    private var questionNumber: Int = -1
    private var questionsSet: [[String : Any]] = []
    private var currentQuestion: [String : Any] = [:]
    
    private lazy var questionViewController: QuestionViewController = {
        let viewController = QuestionViewController()
        return viewController
    }()
    
    //MARK: ViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeViewController()
        addViewControllerViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
        populateData()
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
        addStatusView()
        addQuestionsLabel()
        addOptionsView()
        addSubmitButton()
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
            scrollViewContentView?.setWidth(height: view.bounds.size.width)
        }
    }
    
    private func addStatusView() {
        if statusView == nil {
            statusView = UIView()
            statusView?.translatesAutoresizingMaskIntoConstraints = false
            statusView?.layer.cornerRadius = 5
            statusView?.backgroundColor = UIColor.lightGray
            scrollViewContentView?.addSubview(statusView!)
            
            statusView?.setHeight(height: 10)
            statusView?.setTopAnchor(offset: 10)
            statusView?.setLeftAnchor(offset: 10)
            statusView?.setRightAnchor(offset: -10)
        }
        if completedView == nil {
            completedView = UIView()
            completedView?.translatesAutoresizingMaskIntoConstraints = false
            completedView?.backgroundColor = UIColor.init(redInt: 87, greenInt: 168, blueInt: 200, alpha: 1.0)
            completedView?.layer.cornerRadius = 5
            statusView?.addSubview(completedView!)
            
            completedView?.setBottomAnchor()
            completedView?.setLeftAnchor()
            completedView?.setTopAnchor()
        }
    }
    
    private func addQuestionsLabel() {
        if mainQuestion == nil {
            mainQuestion = UILabel()
            mainQuestion?.translatesAutoresizingMaskIntoConstraints = false
            mainQuestion?.textColor = UIColor.black
            mainQuestion?.numberOfLines = 0
            scrollViewContentView?.addSubview(mainQuestion!)
            mainQuestion?.setLeftAnchor(offset: 10)
            mainQuestion?.setRightAnchor(offset: -10)
            mainQuestion?.setTopAnchorRelativeTo(anchor: (statusView?.bottomAnchor)!, offset: 20)
        }
    }
    
    private func addOptionsView() {
        if answerView == nil {
            answerView = OptionsView(frame: CGRect.zero)
            answerView?.translatesAutoresizingMaskIntoConstraints = false
            scrollViewContentView?.addSubview(answerView!)
            answerView?.setLeftAnchor()
            answerView?.setRightAnchor()
            answerView?.setCenterYAnchor()
        }
    }
    
    private func addSubmitButton() {
        if submitButton == nil {
            submitButton = UIButton(type: UIButton.ButtonType.custom)
            submitButton?.translatesAutoresizingMaskIntoConstraints = false
            submitButton?.addTarget(self, action: #selector(self.submitButtonPressed), for: UIControl.Event.touchUpInside)
            submitButton?.backgroundColor = UIColor.init(redInt: 242, greenInt: 221, blueInt: 163, alpha: 1.0)
            submitButton?.setTitle("Submit", for: UIControl.State.normal)
            submitButton?.layer.cornerRadius = 5
            submitButton?.setTitleColor(UIColor.gray, for: UIControl.State.normal)
            scrollViewContentView?.addSubview(submitButton!)
            
            submitButton?.setHeight(height: 50)
            submitButton?.setLeftAnchor(offset: 10)
            submitButton?.setRightAnchor(offset: -10)
            submitButton?.setBottomAnchor(offset: -15)
        }
    }
    
    @objc private func submitButtonPressed() {
        if questionNumber == questionsSet.count - 1 {
            return
        }
        questionViewController.hidesBottomBarWhenPushed = true
        questionViewController.setQuestionsData(questionNumber: questionNumber + 1, questionsSet: questionsSet)
        navigationController?.pushViewController(questionViewController, animated: true)
    }
    
    private func removeScrollView() {
        scrollViewContentView?.removeFromSuperview()
        scrollViewContentView = nil
        scrollView?.removeFromSuperview()
        scrollView = nil
    }
    
    //MARK: Adding Data
    
    private func populateData() {
        updateViewsWithQuestionData()
        updateStatusView()
    }
    
    private func updateViewsWithQuestionData() {
        mainQuestion?.text = currentQuestion[AppConstants.Response_Type.QUESTION.rawValue] as? String
        let solution1 = currentQuestion[AppConstants.Response_Type.OPTION_1.rawValue] as! String
        let solution2 = currentQuestion[AppConstants.Response_Type.OPTION_2.rawValue] as! String
        let solution3 = currentQuestion[AppConstants.Response_Type.OPTION_3.rawValue] as! String
        let solution4 = currentQuestion[AppConstants.Response_Type.OPTION_4.rawValue] as! String
        answerView?.setViewValues(solutionStrings: [solution1,solution2,solution3,solution4])
    }
    
    private func updateStatusView() {
        completedView?.setRelativeWidth(multiplier: CGFloat(questionNumber) / CGFloat(questionsSet.count))
    }
    
    //MARK: Model Related Methods
    
    public func setQuestionsData(questionNumber: Int, questionsSet: [[String : Any]]) {
        self.questionNumber = questionNumber
        self.questionsSet = questionsSet
        if questionsSet.count > questionNumber {
            currentQuestion = questionsSet[questionNumber]
        }
    }
}
