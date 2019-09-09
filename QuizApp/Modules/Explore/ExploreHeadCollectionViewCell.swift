//
//  ExploreHeadCollectionViewCell.swift
//  QuizApp
//
//  Created by Tarun Kumar on 9/9/19.
//  Copyright © 2019 Tarun Kumar. All rights reserved.
//

import UIKit

class ExploreHeadCollectionViewCell: UICollectionViewCell {
    
    private var cellTitleLabel: UILabel?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customizeCellView()
        addCellContentViews()
    }
    
    private func customizeCellView() {
        contentView.layer.shadowColor = UIColor.lightGray.cgColor
        contentView.layer.shadowOpacity = 1
        contentView.layer.shadowOffset = CGSize.init(width: 0, height: 0)
        contentView.layer.shadowRadius = 2
    }
    
    private func addCellContentViews() {
        addCellTitle()
    }
    
    private func addCellTitle() {
        if cellTitleLabel == nil {
            cellTitleLabel = UILabel()
            cellTitleLabel?.translatesAutoresizingMaskIntoConstraints = false
            cellTitleLabel?.textColor = UIColor.white
        }
        contentView.addSubview(cellTitleLabel!)
        
        cellTitleLabel?.setCenterYAnchor()
        cellTitleLabel?.setLeftAnchor(offset: 10)
    }
    
    public func updateCellView(cellColor: UIColor, cellTitle: String) {
        contentView.backgroundColor = cellColor
        cellTitleLabel?.text = cellTitle
    }
}
