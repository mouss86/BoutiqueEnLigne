//
//  HomeView.swift
//  BoutiqueEnLigne
//
//  Created by Moussa Cherif on 2024-05-17.
//

import SwiftUI

struct HomeView: View {
    @State var currentCategory = "All"
    @State var productsList = sampleProducts
    
    @State var product: ProductsModelView? = nil
    
    @State var showProduct = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Text("**Sneakers**\nWith Quality")
                            .font(.largeTitle)
                            .padding(.horizontal, 20)
                        Spacer()
                        
                        Image(systemName: "bell")
                            .padding(.vertical, 23)
                            .padding(.horizontal, 20)
                            .imageScale(.large)
                            .overlay {
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.white.opacity(0.05), lineWidth: 3)
                            }
                    }
                    
                    // Categories view
                    categoriesView
                        .zIndex(1)
                    
                    // Products List
                    productsView
                        .fullScreenCover(isPresented: $showProduct, content: {
                            Product(data: product ?? sampleProducts[0])
                        })
                }
                .padding()
            }
            .scrollIndicators(.hidden)
        }
    }
    
    // Mark: Categories View
    var categoriesView: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 15) {
                ForEach(sampleBrands) { item in
                    HStack {
                        if !item.icon.isEmpty {
                            Image(item.icon)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35, height: 35)
                        }
                        if currentCategory == item.title || item.title == "All" {
                            Text(item.title)
                        }
                    }
                    .foregroundStyle(currentCategory == item.title ? .white : .black)
                    .padding()
                    .background(currentCategory == item.title ? .black : .gray.opacity(0.09))
                    .clipShape(Capsule())
                    .onTapGesture {
                        withAnimation {
                            currentCategory = item.title
                                
                            // non veut montrer les chaussures en fonction de la marque selectionnée donc on va mettre un filtre dans la liste pr sa on fait une nouvelle liste
                            
                            if item.title == "All" {
                                productsList = sampleProducts
                            } else {
                                productsList = sampleProducts.filter {$0.brand == item.title }
                            }
                            
                            
                        }
                    }
                }
            }
        
            .scrollIndicators(.hidden)
        }
    }
    
    // Mark: Products View
    var productsView: some View {
        ScrollView(.vertical) {
            VStack(spacing: 15) {
                ForEach(productsList) { item in
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
                    .onTapGesture {
                        product = item
                        showProduct = true
                    }
                }
            }
            .zIndex(0)
        }
    }
}

#Preview {
   ContentView()
}

//  .frame(width: UIScreen.main.bounds.width - 40, height: 200)
//clipShape(Rectangle())
//Text(item.title)
//    .font(.headline.bold())
//Text("$\(item.price)")
//  ForEach (sampleProducts, id: \.id) { item in
//  ProgressView()
// sampleProducts
