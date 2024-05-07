//
//  SearchView.swift
//  BoutiqueEnLigne
//
//  Created by Moussa Cherif on 2024-07-21.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @State private var filteredProducts = sampleProducts

    var body: some View {
        NavigationStack {
            VStack {
                // Barre de recherche
                TextField("Search", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .onChange(of: searchText) {
                        filterProducts()
                    }

                // Liste des produits filtrés
                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(filteredProducts) { item in
                            VStack {
                                Image(item.images[0])
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: UIScreen.main.bounds.width - 40, height: 200)
                                    .clipShape(Rectangle())

                                Text(item.title)
                                    .font(.headline.bold())

                                Text("$\(item.price)")
                                    .font(.callout)
                            }
                            .padding(.bottom)
                            .background(Color.gray.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                        }
                    }
                }
            }
            .navigationTitle("Search")
        }
    }

    private func filterProducts() {
        if searchText.isEmpty {
            filteredProducts = sampleProducts
        } else {
            filteredProducts = sampleProducts.filter { product in
                product.title.lowercased().contains(searchText.lowercased()) ||
                product.brand.lowercased().contains(searchText.lowercased()) ||
                product.description.lowercased().contains(searchText.lowercased())
            }
        }
    }
}

#Preview {
    SearchView()
 }
