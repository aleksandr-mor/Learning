//
//  ShopModel.swift
//  MVC
//
//  Created by Aleksandr Morozov on 30.06.2022.
//

import Foundation

public struct Product {
    public let name: String
}

public struct ProductGroup {
    public let products: [Product]
    public let title: String
}

extension ProductGroup {
    public static func vegetables() -> ProductGroup {
        let products = [
            Product(name: "Tomato"),
            Product(name: "Potato"),
            Product(name: "Cucumber")
        ]
        return ProductGroup(products: products, title: "Vegetables")
    }
}
