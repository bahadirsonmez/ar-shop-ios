//
//  HistorySection.swift
//  AR Shop
//
//  Created by Bahadır Sönmez on 12.01.2022.
//

import UIKit

class HistorySection: BaseCell, SetupCodeView {
    
    lazy var collectionView = HistoryView()
    
    private lazy var titleContainer: UIView = UIFactory().createView(cornerRadius: 0)
    private lazy var title: UILabel = UIFactory().createTitleLabel(text: "History",
                                                                   textAlignment: .left)
    private lazy var actionTitle = UIFactory().createLabel(text: "Show All",
                                                           textColor: .blueTextColor,
                                                           textAlignment: .right)
    override func setupViews() {
        setupView()
    }
    
    var rowTapped : ((Int) -> Void)?
    
    var model: MainSectionItemModel! {
        didSet {
            title.text = model.title
        }
    }
    
    func buildViewHierarchy() {
        contentView.addSubview(titleContainer)
        titleContainer.addSubviews(title, actionTitle)
        contentView.addSubview(collectionView)
    }
    func setupConstraints() {
        titleContainer.anchor(top: self.topAnchor,
                              leading: self.leadingAnchor,
                              bottom: nil,
                              trailing: self.trailingAnchor,
                              padding: .init(top: 0, left: 0, bottom: 0, right: 0),
                              size: .init(width: 0, height: 60))
        title.anchor(top: nil,
                     leading: titleContainer.leadingAnchor,
                     bottom: nil,
                     trailing: nil, padding: .init(top: 0, left: 20, bottom: 0, right: 0))
        title.centerY(to: titleContainer)
        actionTitle.anchor(top: nil,
                     leading: nil,
                     bottom: nil,
                     trailing: titleContainer.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 20))
        actionTitle.centerY(to: titleContainer)
        
        collectionView.anchor(top: titleContainer.bottomAnchor,
                              leading: self.leadingAnchor,
                              bottom: self.bottomAnchor,
                              trailing: self.trailingAnchor,
                              padding: .init(top: 0, left: 0, bottom: 0, right: 0),
                              size: .init(width: 0, height: 255))
    }
    
    func setupAdditionalConfiguration() {
        collectionView.rowTapped = { row in
            self.rowTapped?(row)
        }
    }
}

// MARK: - Header olarak kullacaksan "UICollectionReusableView" olmalı

class HistoryView: UICollectionReusableView {
    var accountTapped : (() -> Void)? = nil
    var notificationTapped : (() -> Void)? = nil
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = Constants.Colors.backgroundColor
        return cv
    }()
    
    var rowTapped : ((Int) -> Void)?
    
    var model: MainSectionItemModel! {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        addSubview(collectionView)
        collectionView.fillSuperview()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ProductCell.self,
                                forCellWithReuseIdentifier: "productCellId")
    }
}

extension HistoryView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.numberOfItems
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCellId",
                                                      for: indexPath) as!  ProductCell
        cell.product = model.productItem(for: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150.0, height: 235.0)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.rowTapped?(indexPath.row)
    }
}
