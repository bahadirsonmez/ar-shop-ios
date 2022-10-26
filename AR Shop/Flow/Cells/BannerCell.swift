//
//  BannerCell.swift
//  AR Shop
//
//  Created by Bahadır Sönmez on 12.01.2022.
//

import UIKit

class BannerCell: BaseCell {
    
    lazy var image = UIFactory().createImageView(backgroundColor: .blueTextColor.withAlphaComponent(0.5))
    
    lazy var title = UIFactory().createTitleLabel(text: "New\ncollection",
                                                  textColor: .white,
                                                  font: .bold36)
    var banner: BannerItemModel! {
        didSet {
            image.image = UIImage(named: banner.imageName)
            title.text = banner.title
        }
    }
    
    override func setupViews() {
        setupView()
    }
}

extension BannerCell : SetupCodeView {
    func buildViewHierarchy() {
        self.contentView.addSubviews(image, title)
    }
    func setupConstraints() {
        image.fillSuperview()
        title.centerView(to: image)
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = .clear
    }
}
