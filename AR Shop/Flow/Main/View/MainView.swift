//
//  MainView.swift
//  AR Shop
//
//  Created by Bahadır Sönmez on 10.01.2022.
//

import UIKit

class MainView: UIView {
    private let spacing: CGFloat = 20.0
    
    var safeArea = UILayoutGuide()
    let productCellHeight: CGFloat = 235.0
    let cellHeight: CGFloat = 90.0
    let headerHeight: CGFloat = 240.0
    let sliderCellId = "sliderCellId"
    let newArrivalsCellId = "newArrivalsCellId"
    let trendingCellId = "trendingCellId"
    let historyHeaderId = "historyHeaderId"
    let historyCellId = "historyCellId"
    
    var productSelected: ((ProductItemModel?) -> Void)?
    
    var viewModel: MainViewModel! {
        didSet {
            collectionView.reloadData()
        }
    }

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = Constants.Colors.backgroundColor
        return cv
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented")
        
    }
}

extension MainView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch viewModel.tableViewItem(at: indexPath.row) {
        case .banners(let model):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: sliderCellId,
                                                          for: indexPath) as!  BannerSection
            cell.collectionView.model = model
            return cell
        case .newArrivals(let model):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: newArrivalsCellId,
                                                          for: indexPath) as!  NewArrivalsSection
            cell.collectionView.model = model
            cell.rowTapped = { [weak self] row in
                self?.productSelected?(model.productItem(for: row))
            }
            return cell
        case .whatsTrending(let model):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: trendingCellId,
                                                          for: indexPath) as!  TrendingSection
            cell.collectionView.model = model
            cell.rowTapped = { [weak self] row in
                self?.productSelected?(model.productItem(for: row))
            }
            return cell
        case .history(let model):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: historyCellId,
                                                          for: indexPath) as!  HistorySection
            cell.collectionView.model = model
            cell.rowTapped = { [weak self] row in
                self?.productSelected?(model.productItem(for: row))
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        return viewModel.sizeForItem(at: indexPath.row, width: width)
    }
}

extension MainView: SetupCodeView {
    func buildViewHierarchy() {
        self.addSubview(collectionView)
    }
    
    func setupConstraints() {
        safeArea = self.safeAreaLayoutGuide
        collectionView.fillSuperview()
    }
    
    func setupAdditionalConfiguration() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(BannerSection.self,
                                forCellWithReuseIdentifier: sliderCellId)
        collectionView.register(NewArrivalsSection.self,
                                forCellWithReuseIdentifier: newArrivalsCellId)
        collectionView.register(TrendingSection.self,
                                forCellWithReuseIdentifier: trendingCellId)
        collectionView.register(VerticalSectionHeaderCell.self,
                                forCellWithReuseIdentifier: historyHeaderId)
        collectionView.register(HistorySection.self,
                                forCellWithReuseIdentifier: historyCellId)
    }
}

