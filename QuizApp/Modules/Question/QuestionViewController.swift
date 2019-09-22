//
//  QuestionViewController.swift
//  QuizApp
//
//  Created by Tarun Kumar on 9/17/19.
//  Copyright © 2019 Tarun Kumar. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    private var statusView: UIView?
    private var questionDescription: UILabel?
    private var mainQuestion: UILabel?
    private var answerView: OptionsView?
    private var errorLabel: UILabel?
    
    private var scrollView: UIScrollView?
    private var scrollViewContentView: UIView?
    private var questionsDict: [[String : Any]] = []
    
    private var questionNumber: Int = -1
    private var questionsSet: [[String : Any]] = []
    private var currentQuestion: [String : Any] = [:]
    
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
        addOptionsView()
    }
    
    private func populateData() {
        if currentQuestion.isEmpty {
            displayErrorView()
        }
        else {
            updateViewsWithQuestionData()
        }
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
            scrollViewContentView?.setHeight(height: view.bounds.size.height)
            scrollViewContentView?.setWidth(height: view.bounds.size.width)
        }
    }
    
    private func addOptionsView() {
        if answerView == nil {
            answerView = OptionsView(frame: CGRect.zero)
            answerView?.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(answerView!)
        }
        answerView?.setViewValues(solutionStrings: ["Soln1", "Soln2", "Soln3"])
        answerView?.setLeftAnchor()
        answerView?.setRightAnchor()
        answerView?.setCenterYAnchor()
    }
    
    private func displayErrorView() {
        if errorLabel == nil {
            errorLabel = UILabel()
            errorLabel?.translatesAutoresizingMaskIntoConstraints = false
            
            scrollViewContentView?.removeFromSuperview()
        }
    }
    
    private func removeSCrollView() {
        scrollViewContentView?.removeFromSuperview()
        scrollViewContentView = nil
        scrollView?.removeFromSuperview()
        scrollView = nil
    }
    
    private func updateViewsWithQuestionData() {
        
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
