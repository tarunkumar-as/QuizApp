//
//  SolutionViewController.swift
//  QuizApp
//
//  Created by Tarun Kumar on 10/19/19.
//  Copyright © 2019 Tarun Kumar. All rights reserved.
//

import UIKit

class SolutionViewController: UIViewController {
    
    private var scrollView: UIScrollView?
    private var scrollViewContentView: UIView?
    
    private var viewheader: UILabel?
    private var scoreLabel: UILabel?
    private var mainQuestionsList: [UILabel] = []
    private var solutionsList: [UILabel] = []
    private var closeButton: UIButton?
    
    private var questionsDict: [[String : Any]] = []
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
        updateSolutionSet()
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
        addViewHeader()
        addScoreLabel()
        addQuestionsLabel()
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
    
    private func addViewHeader() {
        if viewheader == nil {
            viewheader = UILabel()
            viewheader?.translatesAutoresizingMaskIntoConstraints = false
            viewheader?.textColor = UIColor.black
            viewheader?.numberOfLines = 0
            viewheader?.text = "Result"
            viewheader?.textAlignment = NSTextAlignment.center
            scrollViewContentView?.addSubview(viewheader!)
            viewheader?.setTopAnchor(offset: 20)
            viewheader?.setLeftAnchor(offset: 10)
            viewheader?.setRightAnchor(offset: -10)
        }
    }
    
    private func addScoreLabel() {
        if scoreLabel == nil {
            scoreLabel = UILabel()
            scoreLabel?.translatesAutoresizingMaskIntoConstraints = false
            scoreLabel?.textColor = UIColor.black
            scoreLabel?.numberOfLines = 0
            scoreLabel?.textAlignment = NSTextAlignment.center
            scrollViewContentView?.addSubview(scoreLabel!)
            scoreLabel?.setLeftAnchor(offset: 10)
            scoreLabel?.setRightAnchor(offset: -10)
            scoreLabel?.setTopAnchorRelativeTo(anchor: (viewheader?.bottomAnchor)!, offset: 10)
        }
    }
    
    private func addQuestionsLabel() {
        for _ in 0...9 {
            mainQuestionsList.append(createQuestionLabel())
            solutionsList.append(createSolutionLabel())
        }
        
        mainQuestionsList[0].setTopAnchorRelativeTo(anchor: (scoreLabel?.bottomAnchor)!, offset: 15)
        mainQuestionsList[0].setLeftAnchor(offset: 10)
        mainQuestionsList[0].setRightAnchor(offset: -10)
        
        solutionsList[0].setTopAnchorRelativeTo(anchor: (mainQuestionsList[0].bottomAnchor), offset: 5)
        solutionsList[0].setLeftAnchor(offset: 10)
        solutionsList[0].setRightAnchor(offset: -10)
        
        for i in 1...9 {
            mainQuestionsList[i].setTopAnchorRelativeTo(anchor: (solutionsList[i - 1].bottomAnchor), offset: 15)
            mainQuestionsList[i].setLeftAnchor(offset: 10)
            mainQuestionsList[i].setRightAnchor(offset: -10)
            
            solutionsList[i].setTopAnchorRelativeTo(anchor: (mainQuestionsList[i].bottomAnchor), offset: 5)
            solutionsList[i].setLeftAnchor(offset: 10)
            solutionsList[i].setRightAnchor(offset: -10)
        }
    }
    
    private func createQuestionLabel() -> UILabel {
        let questionLabel = UILabel()
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.textColor = UIColor.black
        questionLabel.numberOfLines = 0
        questionLabel.textAlignment = NSTextAlignment.left
        scrollViewContentView?.addSubview(questionLabel)
        return questionLabel
    }
    
    private func createSolutionLabel() -> UILabel {
        let solutionLabel = UILabel()
        solutionLabel.translatesAutoresizingMaskIntoConstraints = false
        solutionLabel.textColor = UIColor.gray
        solutionLabel.numberOfLines = 0
        solutionLabel.textAlignment = NSTextAlignment.left
        scrollViewContentView?.addSubview(solutionLabel)
        return solutionLabel
    }
    
    private func addSubmitButton() {
        if closeButton == nil {
            closeButton = UIButton(type: UIButton.ButtonType.custom)
            closeButton?.translatesAutoresizingMaskIntoConstraints = false
            closeButton?.addTarget(self, action: #selector(self.closeButtonPressed), for: UIControl.Event.touchUpInside)
            closeButton?.backgroundColor = UIColor.init(redInt: 242, greenInt: 221, blueInt: 163, alpha: 1.0)
            closeButton?.setTitle("Main Page", for: UIControl.State.normal)
            closeButton?.layer.cornerRadius = 5
            closeButton?.setTitleColor(UIColor.gray, for: UIControl.State.normal)
            scrollViewContentView?.addSubview(closeButton!)
            
            closeButton?.setHeight(height: 50)
            closeButton?.setLeftAnchor(offset: 10)
            closeButton?.setRightAnchor(offset: -10)
            closeButton?.setBottomAnchor(offset: -15)
        }
    }
    
    @objc private func closeButtonPressed() {
        self.navigationController?.popToViewController((self.navigationController?.viewControllers[0])!, animated: true)
    }
    
    private func removeScrollView() {
        scrollViewContentView?.removeFromSuperview()
        scrollViewContentView = nil
        scrollView?.removeFromSuperview()
        scrollView = nil
    }
    
    //MARK: Data Porcessing
    
    private func updateSolutionSet() {
        scoreLabel?.text = "10/10"
        for i in 0...9 {
            mainQuestionsList[i].text = questionsSet[i][AppConstants.Questions_Response_Key.QUESTION.rawValue] as? String
            let solutionSet = questionsSet[i][AppConstants.Questions_Response_Key.CORRECT_ANSWER.rawValue] as? String
            let referenceSet = questionsSet[i][AppConstants.Questions_Response_Key.REFERENCE_LINK.rawValue] as? String
            solutionsList[i].text = "-> " + (solutionSet ?? "") + "\nRefernce Link:\n" + (referenceSet ?? "")
        }
    }
    
    public func setQuestionsData(questionsSet: [[String : Any]]) {
        self.questionsSet = questionsSet
    }
}
