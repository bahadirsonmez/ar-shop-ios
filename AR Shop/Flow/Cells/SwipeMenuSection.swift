//
//  SwipeMenuSection.swift
//  AR Shop
//
//  Created by Bahadır Sönmez on 12.01.2022.
//

import UIKit

class SwipeMenuSection: BaseCell, SetupCodeView {
    
    private lazy var collectionView = SwipeMenu()
    
    private lazy var seperator: UIView = UIFactory().createView(backgroundColor: .grayBackground, cornerRadius: 0)
    
    func setupSection(items: [String]) {
        collectionView.setupMenu(items: items)
    }
    
    override func setupViews() {
        setupView()
    }
    func buildViewHierarchy() {
        contentView.addSubviews(collectionView, seperator)
    }
    func setupConstraints() {
        collectionView.anchor(top: self.topAnchor,
                              leading: self.leadingAnchor,
                              bottom: seperator.topAnchor,
                              trailing: self.trailingAnchor,
                              padding: .init(top: 0, left: 0, bottom: 0, right: 0))
        seperator.anchor(top: nil,
                         leading: self.leadingAnchor,
                         bottom: self.bottomAnchor,
                         trailing: self.trailingAnchor,
                         padding: .init(top: 0, left: 0, bottom: 0, right: 0),
                         size: .init(width: 0, height: 1))
    }
    
    func setupAdditionalConfiguration() {
    }
}

class SwipeMenu: UIView {
    var tapped: (() -> Void)? = nil
//    var viewModel: BasketViewModel!
//    var location: Location!
    
    let cellId = "cellId"
    let minLineSpacing = Constants.BasicCell.minLineSpacing
    let cellHeight = Constants.BasicCell.cellHeight
    let sectionInset = Constants.BasicCell.sectionInset
    let sectionInsetZero = Constants.BasicCell.sectionInsetZero
    
//    private lazy var basketTotalView = BasketTotalView()
//    private lazy var voucherView = VoucherView()
    
    private var menuItems: [String] = ["All", "Clothing", "Shoes", "Accessories", "Beauty", "Fruit", "Vegetable"]

    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 12, right: 12)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 20
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = Constants.Colors.backgroundColor
        return cv
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        self.backgroundColor = Constants.Colors.backgroundColor
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
    
//    func loadView(withViewModel vm: BasketViewModel) {
//        viewModel = vm
//    }
    
    func setupMenu(items: [String]) {
        menuItems = items
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SwipeMenu: SetupCodeView {
    func buildViewHierarchy() {
        self.addSubviews(collectionView)
    }
    
    func setupConstraints() {
        collectionView.fillSuperview()
    }
    
    func setupAdditionalConfiguration() {
        self.backgroundColor = Constants.Colors.backgroundColor
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(SwipeMenuCell.self,
                                forCellWithReuseIdentifier: "cellId")
    }
}

extension SwipeMenu: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuItems.count
        //return self.viewModel.numberOfEvents
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId",
                                                      for: indexPath) as! SwipeMenuCell
        cell.title.text = menuItems[indexPath.row]
        if indexPath.row == 0 {
            cell.title.textColor = Constants.Colors.blueTextColor
        }
//        if let vm = self.viewModel.viewModelForEventItem(at: indexPath.row) {
//            cell.setupCell(withViewModel: vm)
//        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //self.rowTapped?(indexPath.row)
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = menuItems[indexPath.row]
        let itemSize = item.size(withAttributes: [
                    NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18, weight: .semibold)
                ])
        return CGSize(width: itemSize.width,
                      height: 52)
    }
}
