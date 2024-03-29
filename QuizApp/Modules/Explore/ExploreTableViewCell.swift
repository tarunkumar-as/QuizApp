//
//  ExploreTableViewCell.swift
//  QuizApp
//
//  Created by Tarun Kumar on 9/7/19.
//  Copyright © 2019 Tarun Kumar. All rights reserved.
//

import UIKit

protocol ExploreTableViewDelegate: class {
    func courseSelected(index: Int)
}

class ExploreTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    weak var delegate: ExploreTableViewDelegate?
    
    private var collectionView: UICollectionView?
    private var _layout: UICollectionViewFlowLayout?
    private var layout: UICollectionViewFlowLayout {
        if _layout == nil {
            _layout = UICollectionViewFlowLayout()
            _layout?.scrollDirection = UICollectionView.ScrollDirection.horizontal
        }
        return _layout!
    }
    
    private var sectionTitle: String = ""
    private var sectionColor: UIColor = UIColor.black
    private var sectionData: [[String : Any]] = []
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addCellViews()
    }
    
    public func populateDate(sectionColor: UIColor, sectionTitle: String, sectionData: [[String : Any]]) {
        self.sectionTitle = sectionTitle
        self.sectionColor = sectionColor
        self.sectionData = sectionData
        collectionView?.reloadData()
        collectionView?.contentOffset = CGPoint(x: 0, y: 0)
    }
    
    private func addCellViews() {
        addCollectionView()
    }
    
    private func addCollectionView() {
        if collectionView == nil {
            collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
            collectionView?.translatesAutoresizingMaskIntoConstraints = false
            collectionView?.isOpaque = true
            collectionView?.backgroundColor = UIColor.clear
            collectionView?.alpha = 1.0
            collectionView?.delegate = self
            collectionView?.dataSource = self
            collectionView?.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: -10)
            collectionView?.register(ExploreHeadCollectionViewCell.self, forCellWithReuseIdentifier: "ExploreHeadCell")
            collectionView?.register(ExploreCollectionViewCell.self, forCellWithReuseIdentifier: "ExploreCollectionViewCell")
        }
        contentView.addSubview(collectionView!)
        collectionView?.setTopAnchor()
        collectionView?.setLeftAnchor()
        collectionView?.setRightAnchor()
        collectionView?.setBottomAnchor()
    }
    
    //MARK: UICollectionViewDelegate Methods
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (indexPath.item == 0) {
            let cell: ExploreHeadCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExploreHeadCell", for: indexPath) as! ExploreHeadCollectionViewCell
            cell.updateCellView(cellColor: sectionColor, cellTitle: sectionTitle)
            return cell
        }
        else {
            let cell: ExploreCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExploreCollectionViewCell", for: indexPath) as! ExploreCollectionViewCell
            let cellData = sectionData[indexPath.item]
            let cellImage = UIImage(named: cellData[AppConstants.Courses_Response_Key.COURSE.rawValue] as! String)
            let cellTitle = cellData[AppConstants.Courses_Response_Key.COURSE.rawValue] as? String
            let cellSubtitle = cellData[AppConstants.Courses_Response_Key.SECTION.rawValue] as? String
            cell.updateCellView(cellImage: cellImage, cellTitle: cellTitle, cellSubtitle: cellSubtitle)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (indexPath.item != 0) {
            delegate?.courseSelected(index: indexPath.item)
        }
    }
    
    //MARK: UICollectionViewDelegateFlowLayout Methods
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 175, height: 235)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
