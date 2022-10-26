//
//  OnFaceViewController.swift
//  AR Shop
//
//  Created by Bahadır Sönmez on 23.01.2022.
//

import UIKit

class OnFaceViewController: BaseViewController {
    var item: ProductItemModel!
    var viewModel: MainViewModel!
    
    private let thisView: OnFaceView = OnFaceView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindActions()
        bindViewModel()
        self.title = "Glasses"
//        viewModel.configureCollectionViewItems()
    }
        
    private func setupUI() {
        self.view.addSubview(thisView)
        thisView.fillSuperview()
    }
    
    private func bindActions() {
    }
    
    private func bindViewModel() {
        thisView.item = item
//        viewModel.reloadCompletion = { [weak self] in
//            self?.thisView.collectionView.reloadData()
//        }
    }

}
