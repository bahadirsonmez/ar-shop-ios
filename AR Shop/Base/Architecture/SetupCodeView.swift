//
//  SetupCodeView.swift
//  AR Shop
//
//  Created by Bahadır Sönmez on 9.01.2022.
//

import Foundation

protocol SetupCodeView {
    func buildViewHierarchy()
    func setupConstraints()
    func setupAdditionalConfiguration()
    func setupView()
}

extension SetupCodeView {
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
}
