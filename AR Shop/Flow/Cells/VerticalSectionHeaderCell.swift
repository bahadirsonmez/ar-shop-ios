//
//  VerticalSectionHeaderCell.swift
//  AR Shop
//
//  Created by Bahadır Sönmez on 12.01.2022.
//

import UIKit

class VerticalSectionHeaderCell: BaseCell {
    private lazy var title: UILabel = UIFactory().createTitleLabel(text: "New Arrivals",
                                                                   textAlignment: .left)
    private lazy var actionTitle = UIFactory().createLabel(text: "Show All",
                                                           textColor: .blueTextColor,
                                                           textAlignment: .right)

    override func setupViews() {
        setupView()
    }
}

extension VerticalSectionHeaderCell: SetupCodeView {
    func buildViewHierarchy() {
        self.contentView.addSubviews(title, actionTitle)
    }
    func setupConstraints() {
        title.anchor(top: nil,
                     leading: self.leadingAnchor,
                     bottom: nil,
                     trailing: nil, padding: .init(top: 0, left: 20, bottom: 0, right: 0))
        title.centerY(to: self)
        actionTitle.anchor(top: nil,
                     leading: nil,
                     bottom: nil,
                     trailing: self.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 20))
        actionTitle.centerY(to: self)
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = .clear
    }
}
