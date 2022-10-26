//
//  CategoriesViewController.swift
//  AR Shop
//
//  Created by Bahadır Sönmez on 13.01.2022.
//

import UIKit

class CategoriesViewController: BaseViewController {
    var onShowSubCategory: (() -> Void)?

    var viewModel: CategoriesViewModel!
    
    // MARK: - Vars & Lets
    private let thisView: CategoriesView = CategoriesView()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindActions()
        self.title = "Kategoriler"
    }
    
    private func setupUI() {
        view.addSubview(thisView)
        thisView.fillSuperview()
    }
    
    private func bindActions() {
        thisView.onCategorySelect = {
            self.onShowSubCategory?()
        }
    }    
}
