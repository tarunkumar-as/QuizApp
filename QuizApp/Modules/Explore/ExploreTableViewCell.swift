//
//  ExploreTableViewCell.swift
//  QuizApp
//
//  Created by Tarun Kumar on 9/7/19.
//  Copyright © 2019 Tarun Kumar. All rights reserved.
//

import UIKit

class ExploreTableViewCell: UITableViewCell {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addCellViews()
    }
    
    private func addCellViews() {
        self.contentView.backgroundColor = CURRENT_THEME.appBackgroundColor()
    }
}
