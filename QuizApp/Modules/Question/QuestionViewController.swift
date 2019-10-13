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
    private var hintLabel: UILabel?
    private var hintButton: UIButton?
    private var answerView: AnswersView?
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
        addHintView()
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
            scrollViewContentView?.setWidth(width: view.bounds.size.width)
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
    
    private func addHintView() {
        addHintButton()
        addHintLabel()
    }
    
    private func addHintButton() {
        if hintButton == nil {
            hintButton = UIButton(type: UIButton.ButtonType.custom)
            hintButton?.addTarget(self, action: #selector(self.hintButtonPressed), for: UIControl.Event.touchUpInside)
            hintButton?.translatesAutoresizingMaskIntoConstraints = false
            scrollViewContentView?.addSubview(hintButton!)
        }
        let hintImage = UIImageView(image: UIImage(named: "Hint.png"))
        hintImage.translatesAutoresizingMaskIntoConstraints = false
        hintImage.contentMode = UIView.ContentMode.scaleAspectFit
        hintButton?.addSubview(hintImage)
        
        let hintButtonLabel = UILabel()
        hintButtonLabel.translatesAutoresizingMaskIntoConstraints = false
        hintButtonLabel.text = "Hint"
        hintButtonLabel.textColor = UIColor.lightGray
        hintButton?.addSubview(hintButtonLabel)
        
        hintImage.setCenterYAnchor()
        hintImage.setWidth(width: 25)
        hintImage.setHeight(height: 25)
        hintImage.setLeftAnchor(offset: 0)
        
        hintButtonLabel.setCenterYAnchor()
        hintButtonLabel.setRightAnchor(offset: -5)
        hintButtonLabel.setLeftAnchorRelativeTo(anchor: hintImage.rightAnchor, offset: 7)
        
        hintButton?.setTopAnchorRelativeTo(anchor: (mainQuestion?.bottomAnchor)!, offset: 25)
        hintButton?.setHeight(height: 45)
        hintButton?.setLeftAnchor(offset: 10)
    }
    
    private func addHintLabel() {
        if hintLabel == nil {
            hintLabel = UILabel()
            hintLabel?.translatesAutoresizingMaskIntoConstraints = false
            hintLabel?.text = ""
            hintLabel?.textColor = UIColor.gray
            hintLabel?.numberOfLines = 0
            scrollViewContentView?.addSubview(hintLabel!)
        }
        hintLabel?.setLeftAnchor(offset: 10)
        hintLabel?.setRightAnchor(offset: -10)
        hintLabel?.setTopAnchorRelativeTo(anchor: (hintButton?.bottomAnchor)!, offset: 10)
    }
    
    private func addOptionsView() {
        if answerView == nil {
            answerView = AnswersView(frame: CGRect.zero)
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
    
    @objc private func hintButtonPressed() {
        hintLabel?.text = currentQuestion[AppConstants.Questions_Response_Key.SHORT_DESCRIPTION.rawValue] as? String
        hintButton?.isUserInteractionEnabled = false
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
        mainQuestion?.text = "Q\(questionNumber + 1)) \(currentQuestion[AppConstants.Questions_Response_Key.QUESTION.rawValue] as! String)" 
        let solution1 = currentQuestion[AppConstants.Questions_Response_Key.OPTION_1.rawValue] as! String
        let solution2 = currentQuestion[AppConstants.Questions_Response_Key.OPTION_2.rawValue] as! String
        let solution3 = currentQuestion[AppConstants.Questions_Response_Key.OPTION_3.rawValue] as! String
        let solution4 = currentQuestion[AppConstants.Questions_Response_Key.OPTION_4.rawValue] as! String
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
