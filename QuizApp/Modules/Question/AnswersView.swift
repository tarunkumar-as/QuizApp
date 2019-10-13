//
//  OptionsView.swift
//  QuizApp
//
//  Created by Tarun Kumar on 9/17/19.
//  Copyright © 2019 Tarun Kumar. All rights reserved.
//

import UIKit

protocol AnswerProtocol: class {
    func answerSelected(answerNumber: Int)
}

class AnswersView: UIView {
    
    private var solutionViews: [UIButton]?
    private var solutionLabels: [UILabel]?
    private weak var answersDelegate: AnswerProtocol?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        solutionViews = [UIButton]()
        solutionLabels = [UILabel]()
        customizeView()
    }
    
    private func customizeView() {
        addBackgroundViews()
        addViewConstraints()
    }
    
    private func addBackgroundViews() {
        for i in 0...3 {
            let view = createBackgroundView()
            view.tag = i
            self.addSubview(view)
            solutionViews?.append(view)
            
            let solutionLabel = createSolutionLabel()
            view.addSubview(solutionLabel)
            solutionLabels?.append(solutionLabel)
        }
    }
    
    private func createBackgroundView() -> UIButton {
        let answerButton = UIButton(type: UIButton.ButtonType.custom)
        answerButton.addTarget(self, action: #selector(self.buttonPressed(_:)), for: UIControl.Event.touchUpInside)
        answerButton.translatesAutoresizingMaskIntoConstraints = false
        answerButton.backgroundColor = UIColor.white
        answerButton.layer.cornerRadius = 3
        answerButton.layer.shadowColor = UIColor.lightGray.cgColor
        answerButton.layer.shadowOpacity = 1
        answerButton.layer.shadowOffset = CGSize.init(width: 0, height: 1)
        answerButton.layer.shadowRadius = 1
        return answerButton
    }
    
    private func createSolutionLabel() -> UILabel {
        let solutionLabel = UILabel()
        solutionLabel.translatesAutoresizingMaskIntoConstraints = false
        solutionLabel.backgroundColor = UIColor.clear
        solutionLabel.textColor = UIColor.black
        return solutionLabel
    }
    
    private func addViewConstraints() {
        solutionViews![0].setTopAnchor(offset: 10)
        for i in 1...3 {
            solutionViews![i].setTopAnchorRelativeTo(anchor: solutionViews![i - 1].bottomAnchor, offset: 15)
        }
        solutionViews![3].setBottomAnchor(offset: -5)
        
        for i in 0...3 {
            solutionViews![i].setLeftAnchor(offset: 10)
            solutionViews![i].setRightAnchor(offset: -10)
            
            solutionLabels![i].setTopAnchor(offset: 15)
            solutionLabels![i].setLeftAnchor(offset: 10)
            solutionLabels![i].setRightAnchor(offset: -10)
            solutionLabels![i].setBottomAnchor(offset: -15)
        }
    }
    
    @objc private func buttonPressed(_ button: UIButton) {
        for i in 0...3 {
            solutionViews![i].backgroundColor = UIColor.white
            solutionLabels![i].textColor = UIColor.black
        }
        solutionViews![button.tag].backgroundColor = UIColor.init(redInt: 15, greenInt: 33, blueInt: 144, alpha: 1.0)
        solutionLabels![button.tag].textColor = UIColor.white
        answersDelegate?.answerSelected(answerNumber: button.tag)
    }
    
    public func setViewValues(solutionStrings: [String]) {
        for i in 0...3 {
            solutionLabels![i].text = solutionStrings[i]
        }
    }
}
