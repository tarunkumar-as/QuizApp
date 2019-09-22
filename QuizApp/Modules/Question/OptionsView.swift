//
//  OptionsView.swift
//  QuizApp
//
//  Created by Tarun Kumar on 9/17/19.
//  Copyright © 2019 Tarun Kumar. All rights reserved.
//

import UIKit

class OptionsView: UIView {
    
    private var solutionViews: [UIView]?
    private var solutionLabels: [UILabel]?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        solutionViews = [UIView]()
        solutionLabels = [UILabel]()
        customizeView()
    }
    
    private func customizeView() {
        addBackgroundViews()
        addViewConstraints()
    }
    
    private func addBackgroundViews() {
        for _ in 0...3 {
            let view = createBackgroundView()
            self.addSubview(view)
            solutionViews?.append(view)
            
            let solutionLabel = createSolutionLabel()
            view.addSubview(solutionLabel)
            solutionLabels?.append(solutionLabel)
        }
    }
    
    private func createBackgroundView() -> UIView {
        let backgroundView = UIView()
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.backgroundColor = UIColor.white
        backgroundView.layer.cornerRadius = 3
        backgroundView.layer.shadowColor = UIColor.lightGray.cgColor
        backgroundView.layer.shadowOpacity = 1
        backgroundView.layer.shadowOffset = CGSize.init(width: 0, height: 1)
        backgroundView.layer.shadowRadius = 1
        return backgroundView
    }
    
    private func createSolutionLabel() -> UILabel {
        let solutionLabel = UILabel()
        solutionLabel.translatesAutoresizingMaskIntoConstraints = false
        solutionLabel.backgroundColor = UIColor.white
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
    
    public func setViewValues(solutionStrings: [String]) {
        for i in 0...3 {
            solutionLabels![i].text = solutionStrings[i]
        }
    }
}
