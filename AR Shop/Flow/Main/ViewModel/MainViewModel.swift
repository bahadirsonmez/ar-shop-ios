//
//  MainViewModel.swift
//  AR Shop
//
//  Created by Bahadır Sönmez on 10.01.2022.
//

import UIKit

enum MainViewItem {
    case banners(_ model: BannersItemModel)
    case newArrivals(_ model: MainSectionItemModel)
    case whatsTrending(_ model: MainSectionItemModel)
    case history(_ model: MainSectionItemModel)
    
    var priority: Int {
        switch self {
        case .banners: return 1
        case .newArrivals: return 2
        case .whatsTrending: return 3
        case .history: return 4
        }
    }
}

class MainViewModel: NSObject {
    let manager: MainAPIManager
    
    init(manager: MainAPIManager) {
        self.manager = manager
        super.init()
    }
    
    private var collectionViewItems: [MainViewItem] = [] {
        didSet {
            collectionViewItems.sort(by: { $0.priority < $1.priority })
            reloadCompletion?()
        }
    }
    
    var reloadCompletion: (() -> Void)?
    
    func configureCollectionViewItems() {
        collectionViewItems.append(.banners(BannersItemModel(with: response.banners)))
        collectionViewItems.append(.newArrivals(MainSectionItemModel(with: response.newArrivals)))
        collectionViewItems.append(.whatsTrending(MainSectionItemModel(with: response.whatsTrending)))
        collectionViewItems.append(.history(MainSectionItemModel(with: response.history)))
    }
    
    // MARK: - Helpers
    
    var numberOfItems: Int {
        collectionViewItems.count
    }
    
    func tableViewItem(at index: Int) -> MainViewItem {
        collectionViewItems[index]
    }
    
    func sizeForItem(at index: Int, width: CGFloat) -> CGSize {
        switch index {
        case 0:
            return CGSize(width: width, height: 200.0)
        case 1:
            return CGSize(width: width, height: 570.0)
        case 2:
            return CGSize(width: width, height: 280.0)
        case 3:
            return CGSize(width: width, height: 315.0)
        default:
            return .zero
        }
    }
    
    let response = MainResponse(
        newArrivals:
            MainSection(products: [
                Product(title: "Pegasus Trail", category: "Sneakers", imageName: "PegasusTrail", regularPrice: "$105.50", discountedPrice: "$70.00", gender: .unisex),
                Product(title: "Air Force", category: "Sneakers", imageName: "AirForce", regularPrice: "$120.50", discountedPrice: "", gender: .unisex),
                Product(title: "Casual Glasses", category: "Glasses", imageName: "CasualGlasses", regularPrice: "$35.00", discountedPrice: "$25.00", gender: .unisex),
                Product(title: "Sun Glasses", category: "Glasses", imageName: "SunGlasses", regularPrice: "$52.00", discountedPrice: "", gender: .unisex)
            ], title: "New Arrivals"),
        whatsTrending:
            MainSection(products: [
                Product(title: "Pegasus Trail", category: "Sneakers", imageName: "PegasusTrail", regularPrice: "$105.50", discountedPrice: "$70.00", gender: .unisex),
                Product(title: "Air Force", category: "Sneakers", imageName: "AirForce", regularPrice: "$120.50", discountedPrice: "", gender: .unisex),
                Product(title: "Casual Glasses", category: "Glasses", imageName: "CasualGlasses", regularPrice: "$35.00", discountedPrice: "$25.00", gender: .unisex),
                Product(title: "Sun Glasses", category: "Glasses", imageName: "SunGlasses", regularPrice: "$52.00", discountedPrice: "", gender: .unisex)
            ], title: "What's Trending?"),
        history:
            MainSection(products: [
                Product(title: "Casual Glasses", category: "Glasses", imageName: "CasualGlasses", regularPrice: "$35.00", discountedPrice: "$25.00", gender: .unisex),
                Product(title: "Sun Glasses", category: "Glasses", imageName: "SunGlasses", regularPrice: "$52.00", discountedPrice: "", gender: .unisex),
                Product(title: "Casual Glasses", category: "Glasses", imageName: "CasualGlasses", regularPrice: "$35.00", discountedPrice: "$25.00", gender: .unisex),
                Product(title: "Sun Glasses", category: "Glasses", imageName: "SunGlasses", regularPrice: "$52.00", discountedPrice: "", gender: .unisex)
            ], title: "History"),
        banners: [
            Banner(title: "New Collection 1", name: "", imageName: ""),
            Banner(title: "New Collection 2", name: "", imageName: ""),
            Banner(title: "New Collection 3", name: "", imageName: ""),
            Banner(title: "New Collection 4", name: "", imageName: "")
        ]
    )
}

class MainSectionItemModel {
    var section: MainSection
    var products: [Product]
        
    init(with section: MainSection) {
        self.section = section
        self.products = section.products
    }
    
    var title: String {
        return section.title
    }
    
    var numberOfItems: Int {
        return products.count
    }
        
    func productItem(for index: Int) -> ProductItemModel {
        return ProductItemModel(with: products[index])
    }
}

class ProductItemModel {
    var product: Product
    
    init(with product: Product) {
        self.product = product
    }
    
    var title: String {
        return product.title
    }
    
    var category: String {
        return product.category
    }
    
    var imageName: String {
        return product.imageName
    }

    var regularPrice: String {
        return product.regularPrice
    }

    var discountedPrice: String {
        return product.discountedPrice
    }

    var gender: Gender {
        return product.gender
    }
}

class BannersItemModel {
    var banners: [Banner]
    
    init(with banners: [Banner]) {
        self.banners = banners
    }
    
    var numberOfItems: Int {
        return banners.count
    }
    
    func bannerItem(for index: Int) -> BannerItemModel {
        return BannerItemModel(with: banners[index])
    }
}

class BannerItemModel {
    var banner: Banner
    
    init(with banner: Banner) {
        self.banner = banner
    }
    
    var title: String {
        return banner.title
    }
    
    var name: String {
        return banner.name
    }
    
    var imageName: String {
        return banner.imageName
    }
}



