//
//  TrendingCell.swift
//  AR Shop
//
//  Created by Bahadır Sönmez on 12.01.2022.
//

import UIKit

class TrendingCell: BaseCell {
    private lazy var image: UIImageView = UIFactory().createImageView()
    
    private lazy var likeIcon: UIImageView = UIFactory().createImageView(image: UIImage(named: "heart"),
                                                                         backgroundColor: .clear,
                                                                         cornerRadius: 0.0)
    private lazy var productTitle: UILabel = UIFactory().createLabel(text: "VFA Boost",
                                                                     font: .medium18)
    private lazy var subtitle: UILabel = UIFactory().createLabel(text: "Sneakers",
                                                                 textColor: .blueTextColor,
                                                                 font: .regular14)
    private lazy var priceContainer: UIView = UIFactory().createView(backgroundColor: .blueTextColor)
    private lazy var price: UILabel = UIFactory().createLabel(text: "$105.50",
                                                              textColor: .white,
                                                              font: .medium14)
    private lazy var seperator: UIView = UIFactory().createView(backgroundColor: .grayBackground)
    
    override func setupViews() {
        setupView()
    }
    
    var product: ProductItemModel! {
        didSet {
            image.image = UIImage(named: product.imageName)
            productTitle.text = product.title
            subtitle.text = product.category
            price.text = product.discountedPrice.isEmpty ? product.regularPrice : product.discountedPrice
        }
    }

}

extension TrendingCell: SetupCodeView {
    func buildViewHierarchy() {
        self.contentView.addSubviews(image, productTitle, subtitle,
                                     priceContainer, price,
                                     seperator)
    }
    func setupConstraints() {
        image.anchor(top: nil,
                     leading: self.leadingAnchor,
                     bottom: nil,
                     trailing: nil,
                     padding: .init(top: 0, left: 20, bottom: 0, right: 0),
                     size: .init(width: 44, height: 44))
        image.centerY(to: self)
        productTitle.anchor(top: image.topAnchor,
                     leading: image.trailingAnchor,
                     bottom: nil,
                     trailing: self.trailingAnchor,
                     padding: .init(top: 1, left: 12, bottom: 0, right: 8))
        subtitle.anchor(top: productTitle.bottomAnchor,
                     leading: productTitle.leadingAnchor,
                     bottom: nil,
                     trailing: self.trailingAnchor,
                     padding: .init(top: 2, left: 0, bottom: 0, right: 8))
        priceContainer.anchor(top: nil,
                              leading: nil,
                              bottom: nil,
                              trailing: self.trailingAnchor,
                              padding: .init(top: 0, left: 0, bottom: 0, right: 20),
                              size: .init(width: 80, height: 36))
        priceContainer.centerY(to: self)
        price.centerView(to: priceContainer)
        
        seperator.anchor(top: nil,
                         leading: self.leadingAnchor,
                         bottom: self.bottomAnchor,
                         trailing: self.trailingAnchor,
                         padding: .init(top: 0, left: 0, bottom: 0, right: 0),
                         size: .init(width: 0, height: 1))
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = .clear
    }
}
