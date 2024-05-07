//
//  CartView.swift
//  BoutiqueEnLigne
//
//  Created by Moussa Cherif on 2024-07-21.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(cartManager.products) { product in
                        VStack(alignment: .leading) {
                            Text(product.title)
                                .font(.headline)
                            Text("$\(product.price)")
                                .font(.subheadline)
                        }
                    }
                }
                .navigationTitle("Cart")
            }
        }
    }
}

#Preview {
    CartView()
        .environmentObject(CartManager())
}
