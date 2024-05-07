//
//  FonctionAddCart.swift
//  BoutiqueEnLigne
//
//  Created by Moussa Cherif on 2024-07-20.
//

import Foundation

class CartManager: ObservableObject {
    @Published var items: [ProductsModelView] = []
    
    func addToCart(product: ProductsModelView) {
        items.append(product)
    }
    
    func removeFromCart(product: ProductsModelView) {
        items.removeAll { $0.id == product.id }
    }
}
