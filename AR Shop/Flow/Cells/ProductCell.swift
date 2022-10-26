//
//  ProductCell.swift
//  AR Shop
//
//  Created by Bahadır Sönmez on 12.01.2022.
//

import UIKit

class ProductCell: BaseCell {
    private lazy var image: UIImageView = UIFactory().createImageView()
    
    private lazy var likeIcon: UIImageView = UIFactory().createImageView(image: UIImage(named: "heart"),
                                                                         backgroundColor: .clear,
                                                                         cornerRadius: 0.0)
    private lazy var productTitle: UILabel = UIFactory().createLabel(text: "Falcon Clear Pink",
                                                                     font: .medium16)
    private lazy var subtitle: UILabel = UIFactory().createLabel(text: "Sneakers",
                                                                 textColor: .blueTextColor,
                                                                 font: .thin14)
    private lazy var discountedPrice: UILabel = UIFactory().createLabel(text: "$70.00",
                                                                     font: .thin14)
    private lazy var price: UILabel = UIFactory().createLabel(text: "$105.50",
                                                              textColor: .secondaryTextColor,
                                                                     font: .thin14)
    
    var product: ProductItemModel! {
        didSet {
            image.image = UIImage(named: product.imageName)
            productTitle.text = product.title
            subtitle.text = product.category
            if product.discountedPrice.isEmpty {
                discountedPrice.text = product.regularPrice
                price.text = ""
            } else {
                discountedPrice.text = product.discountedPrice
                price.text = product.regularPrice
            }
        }
    }
    
    override func setupViews() {
        setupView()
    }
}

extension ProductCell: SetupCodeView {
    func buildViewHierarchy() {
        self.contentView.addSubviews(image, likeIcon,
                                     productTitle, subtitle,
                                     discountedPrice, price)
    }
    func setupConstraints() {
        image.anchor(top: self.topAnchor,
                     leading: self.leadingAnchor,
                     bottom: nil,
                     trailing: self.trailingAnchor,
                     padding: .init(top: 0, left: 0, bottom: 0, right: 0),
                     size: .init(width: 160, height: 160))
        likeIcon.anchor(top: self.topAnchor,
                        leading: nil,
                        bottom: nil,
                        trailing: self.trailingAnchor,
                        padding: .init(top: 15, left: 0, bottom: 0, right: 15),
                        size: .init(width: 24, height: 24))
        
        productTitle.anchor(top: image.bottomAnchor,
                     leading: self.leadingAnchor,
                     bottom: nil,
                     trailing: self.trailingAnchor,
                     padding: .init(top: 8, left: 0, bottom: 0, right: 8))
        subtitle.anchor(top: productTitle.bottomAnchor,
                     leading: self.leadingAnchor,
                     bottom: nil,
                     trailing: self.trailingAnchor,
                     padding: .init(top: 4, left: 0, bottom: 0, right: 8))
        discountedPrice.anchor(top: subtitle.bottomAnchor,
                     leading: self.leadingAnchor,
                     bottom: nil,
                     trailing: nil,
                     padding: .init(top: 4, left: 0, bottom: 0, right: 0))
        price.anchor(top: nil,
                     leading: discountedPrice.trailingAnchor,
                     bottom: nil,
                     trailing: nil,
                     padding: .init(top: 0, left: 12, bottom: 0, right: 0))
        price.centerY(to: discountedPrice)
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = .clear
    }
}
