//
//  NewArrivalsSection.swift
//  AR Shop
//
//  Created by Bahadır Sönmez on 12.01.2022.
//

import UIKit

class NewArrivalsSection: BaseCell, SetupCodeView {
    
    lazy var collectionView = NewArrivalsView()
    
    private lazy var seperator = UIFactory().createView(cornerRadius: 0)
    
    var rowTapped : ((Int) -> Void)?
    
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
        collectionView.rowTapped = { row in
            self.rowTapped?(row)
        }
    }
}

// MARK: - Header olarak kullacaksan "UICollectionReusableView" olmalı

class NewArrivalsView: UIView {
    private let spacing:CGFloat = 20.0
    
    var safeArea = UILayoutGuide()
    let productCellHeight: CGFloat = 235.0
    let cellHeight: CGFloat = 90.0
    let headerHeight: CGFloat = 240.0
    let cellId = Constants.BasicCell.cellID
    let headerId = Constants.BasicCell.headerID
    
    var rowTapped : ((Int) -> Void)?
    
    var model: MainSectionItemModel! {
        didSet {
            collectionView.reloadData()
        }
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.sectionInset = UIEdgeInsets(top: 0, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.showsHorizontalScrollIndicator = false
        cv.isScrollEnabled = false
        cv.backgroundColor = Constants.Colors.backgroundColor
        return cv
    }()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented")
        
    }
}

extension NewArrivalsView: SetupCodeView {
    func buildViewHierarchy() {
        self.addSubviews(collectionView)
    }
    
    func setupConstraints() {
        safeArea = self.safeAreaLayoutGuide
        collectionView.anchor(top: safeArea.topAnchor,
                              leading: safeArea.leadingAnchor,
                              bottom: safeArea.bottomAnchor,
                              trailing: safeArea.trailingAnchor,
                              padding: Constants.paddingZero)
    }
    
    func setupAdditionalConfiguration() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ProductCell.self,
                                forCellWithReuseIdentifier: cellId)
        collectionView.register(SectionHeader.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: "headerId")
    }
}

extension NewArrivalsView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.numberOfItems
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId,
                                                      for: indexPath) as!  ProductCell
        cell.product = model.productItem(for: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.rowTapped?(indexPath.row)
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfItemsPerRow:CGFloat = 2
        let spacingBetweenCells:CGFloat = 20
        
        let totalSpacing = (2 * self.spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells) //Amount of total spacing in a row
        
        let width = (collectionView.bounds.width - totalSpacing)/numberOfItemsPerRow
        return CGSize(width: width, height: productCellHeight)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    // MARK: - CollectionView Header
    func collectionView(_ collectionView: UICollectionView,
                                 viewForSupplementaryElementOfKind kind: String,
                                 at indexPath: IndexPath) -> UICollectionReusableView {
      switch kind {
      case UICollectionView.elementKindSectionHeader:
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                           withReuseIdentifier: "headerId",
                           for: indexPath)  as! SectionHeader
          headerView.loadHeader(model.title, actionTitle: "Show All")
        return headerView
      default:
        fatalError("Unexpected element kind")
      }
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 60)
    }
}
