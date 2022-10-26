//
//  UIFactory.swift
//  AR Shop
//
//  Created by Bahadır Sönmez on 13.01.2022.
//

import UIKit

class UIFactory {
    func createTitleLabel(
        text: String = "",
        textColor: UIColor = .mainTextColor,
        font: UIFont = .semiBold18,
        textAlignment: NSTextAlignment = .center,
        numberOfLines: Int = 0
    ) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = textColor
        label.font = font
        label.textAlignment = textAlignment
        label.numberOfLines = numberOfLines
        return label
    }
    
    func createLabel(
        text: String = "",
        textColor: UIColor = .mainTextColor,
        font: UIFont = .regular18,
        textAlignment: NSTextAlignment = .left,
        numberOfLines: Int = 0
    ) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = textColor
        label.font = font
        label.textAlignment = textAlignment
        label.numberOfLines = numberOfLines
        return label
    }
    
    func createStrikeLabel(
        text: String = "",
        textColor: UIColor = .mainTextColor,
        font: UIFont = .regular18,
        textAlignment: NSTextAlignment = .left,
        numberOfLines: Int = 0
    ) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = textColor
        label.font = font
        label.textAlignment = textAlignment
        label.numberOfLines = numberOfLines
        return label
    }

    func createImageView(
        image: UIImage? = nil,
        backgroundColor: UIColor = .appGray,
        contentMode: UIView.ContentMode = .scaleToFill,
        cornerRadius: CGFloat = 6.0
    ) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = image
        imageView.backgroundColor = backgroundColor
        imageView.contentMode = contentMode
        imageView.layer.cornerRadius = cornerRadius
        imageView.clipsToBounds = true
        return imageView
    }
    
    func createView(
        backgroundColor: UIColor = .white,
        cornerRadius: CGFloat = 6.0
    ) -> UIView {
        let view = UIView()
        view.backgroundColor = backgroundColor
        view.cornerRadius = cornerRadius
        return view
    }
    
}
