//
//  Product.swift
//  AR Shop
//
//  Created by Bahadır Sönmez on 19.01.2022.
//

import Foundation

enum Gender: String {
    case male = "Male"
    case female = "Female"
    case unisex = "Unisex"
}

struct Product {
    var title: String
    var category: String
    var imageName: String
    var regularPrice: String
    var discountedPrice: String
    var gender: Gender
}

struct Category {
    var title: String
    var imageName: String
    var products: [Product]
}

struct CategoryList {
    var categories: [Category]
}

struct MainSection {
    var products: [Product]
    var title: String
}

struct MainResponse {
    var newArrivals: MainSection
    var whatsTrending: MainSection
    var history: MainSection
    var banners: [Banner]
}

struct Banner {
    var title: String
    var name: String
    var imageName: String
}
