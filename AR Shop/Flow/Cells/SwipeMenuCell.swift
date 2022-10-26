//
//  SwipeMenuCell.swift
//  AR Shop
//
//  Created by Bahadır Sönmez on 12.01.2022.
//

import UIKit

class SwipeMenuCell: BaseCell {
    
    lazy var title = UIFactory().createTitleLabel()

    override func setupViews() {
        setupView()
    }
//    func setupCell(withViewModel vm: EventItemModel) {
//        self.cellTitle.text = vm.name
//    }
}

extension SwipeMenuCell: SetupCodeView {
    func buildViewHierarchy() {
        self.contentView.addSubviews(title)
    }
    func setupConstraints() {
        title.centerView(to: self)
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = .clear
    }
}
