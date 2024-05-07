//
//  CartManager.swift
//  BoutiqueEnLigne
//
//  Created by Moussa Cherif on 2024-07-21.
//

import Foundation

class CartManager: ObservableObject {
    @Published var products: [ProductsModelView] = []
    
    func addToCart(product: ProductsModelView) {
        products.append(product)
    }
}
