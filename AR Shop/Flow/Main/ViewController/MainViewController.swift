//
//  MainViewController.swift
//  AR Shop
//
//  Created by Bahadır Sönmez on 9.01.2022.
//

import UIKit
import QuickLook
import ARKit

class MainViewController: BaseViewController {
    var onFaceView: ((ProductItemModel?) -> Void)?
    var viewModel: MainViewModel!
    var name: String!
    
    private let thisView: MainView = MainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindActions()
        bindViewModel()
        self.title = "Ana Sayfa"
        viewModel.configureCollectionViewItems()
    }
        
    private func setupUI() {
        self.view.addSubview(thisView)
        thisView.fillSuperview()
    }
    
    private func bindActions() {
    }
    
    private func bindViewModel() {
        thisView.viewModel = viewModel
        thisView.productSelected = { product in
            if product?.category == "Sneakers" {
                self.openQuickLook(with: product?.imageName)
            } else if product?.category == "Glasses" {
                self.onFaceView?(product)
            }
        }
        viewModel.reloadCompletion = { [weak self] in
            self?.thisView.collectionView.reloadData()
        }
    }
    
    private func openQuickLook(with name: String?) {
        guard let name = name else { return }
        self.name = name
        
        let previewController = QLPreviewController()
        previewController.dataSource = self
        previewController.delegate = self
        self.present(previewController, animated: true)

    }
    
}

extension MainViewController: QLPreviewControllerDelegate, QLPreviewControllerDataSource {
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
      return 1
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        guard let path  = Bundle.main.path(forResource: self.name,
                                                ofType: "usdz")
        else { fatalError("Couldn't find a model") }

        let url = URL(fileURLWithPath: path)
        return url as QLPreviewItem
    }
}
