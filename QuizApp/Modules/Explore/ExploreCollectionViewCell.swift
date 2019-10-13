//
//  ExploreCollectionViewCell.swift
//  QuizApp
//
//  Created by Tarun Kumar on 9/7/19.
//  Copyright © 2019 Tarun Kumar. All rights reserved.
//

import UIKit

class ExploreCollectionViewCell: UICollectionViewCell {
    
    private var cellView: UIView?
    private var cellImageView: UIImageView?
    private var cellTitleLabel: UILabel?
    private var cellSubtitleLabel: UILabel?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addCellContentViews()
    }
    
    private func addCellContentViews() {
        addCellView()
        addCellImageView()
        addCellTitle()
        addCellSubtitle()
        addCellConstraints()
    }
    
    private func addCellView() {
        if cellView == nil {
            cellView = UIView()
            cellView?.translatesAutoresizingMaskIntoConstraints = false
            cellView?.backgroundColor = UIColor.white
            cellView?.layer.shadowColor = UIColor.lightGray.cgColor
            cellView?.layer.shadowOpacity = 1
            cellView?.layer.shadowOffset = CGSize.init(width: 0, height: 0)
            cellView?.layer.shadowRadius = 2
            contentView.addSubview(cellView!)
        }
    }
    
    private func addCellImageView() {
        if cellImageView == nil {
            cellImageView = UIImageView()
            cellImageView?.translatesAutoresizingMaskIntoConstraints = false
            cellImageView?.contentMode = UIView.ContentMode.scaleAspectFit
            contentView.addSubview(cellImageView!)
        }
    }
    
    private func addCellTitle() {
        if cellTitleLabel == nil {
            cellTitleLabel = UILabel()
            cellTitleLabel?.translatesAutoresizingMaskIntoConstraints = false
            cellTitleLabel?.textColor = UIColor.black
            cellTitleLabel?.numberOfLines = 0
            contentView.addSubview(cellTitleLabel!)
        }
    }
    
    private func addCellSubtitle() {
        if cellSubtitleLabel == nil {
            cellSubtitleLabel = UILabel()
            cellSubtitleLabel?.translatesAutoresizingMaskIntoConstraints = false
            cellSubtitleLabel?.textColor = UIColor.gray
            cellSubtitleLabel?.numberOfLines = 0
            contentView.addSubview(cellSubtitleLabel!)
        }
    }
    
    private func addCellConstraints() {
        cellView?.setDimensionEqualContainerView()
        
        cellImageView?.setTopAnchor(offset: 5)
        cellImageView?.setLeftAnchor()
        cellImageView?.setRightAnchor()
        cellImageView?.setRelativeHeight(multiplier: 0.4)
        
        cellTitleLabel?.setTopAnchorRelativeTo(anchor: (cellImageView?.bottomAnchor)!, offset: 7)
        cellTitleLabel?.setLeftAnchor(offset: 7)
        cellTitleLabel?.setRightAnchor(offset: -7)
        
        cellSubtitleLabel?.setTopAnchorRelativeTo(anchor: (cellTitleLabel?.bottomAnchor)!, offset: 2)
        cellSubtitleLabel?.setLeftAnchor(offset: 7)
        cellSubtitleLabel?.setRightAnchor(offset: -7)
    }
    
    public func updateCellView(cellImage: UIImage?, cellTitle: String?, cellSubtitle: String?) {
        cellImageView?.image = cellImage
        cellTitleLabel?.text = cellTitle
        cellSubtitleLabel?.text = cellSubtitle
    }
}
