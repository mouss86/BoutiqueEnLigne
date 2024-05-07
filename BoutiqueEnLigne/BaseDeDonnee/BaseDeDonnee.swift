//
//  BaseDeDonnee.swift
//  BoutiqueEnLigne
//
//  Created by Moussa Cherif on 2024-07-11.
//

import SwiftUI

import FirebaseFirestore

// on cree une classe appélé baseDeDonnée qui va recupperer les données de Firebase firesTore

class BaseDeDonnee: ObservableObject {
    @Published var productList = [ProductsModelView]()
    
    init() {
        getProducts()
    }
    func getProducts() {
        let db = Firestore.firestore()
        db.collection("PRODUCTS").addSnapshotListener {
            snapshot, error in
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    self.productList.append(ProductsModelView(
                        id: document.documentID,
                        title: document.get("title") as! String,
                        brand: document.get("brand") as! String,
                        description: document.get("description") as! String,
                        images: document.get("images") as! [String],
                        sizes: document.get("sizes") as! [Int],
                        reviews: [sampleReview],
                        price: document.get("price") as! Int))
                }
            }
        }
    }
}
