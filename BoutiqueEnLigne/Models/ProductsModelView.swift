//
//  ProductsModelView.swift
//  BoutiqueEnLigne
//
//  Created by Moussa Cherif on 2024-05-16.
//

import SwiftUI
struct ProductsModelView: Identifiable, Hashable {
    var id: String // c'est un document id donc pas besoin d'ajouter un champs dans firestore document
    var title: String
    var brand: String
    var description: String
    var images: [String]
    var sizes: [Int]
    var reviews: [ReviewModel]
    var price: Int
}

struct ReviewModel: Identifiable, Hashable {
    var id: String
    var userName: String
    var image: String
    var review: String
    var rating: Int
}

let sampleReview = ReviewModel(id: "review1", userName: "John Doe", image: "review_image", review: "Great product!", rating: 5)

var sampleProducts: [ProductsModelView] = [
    .init(id: "abc1", title: "A ADAM CT", brand: "Nike", description: "Nice. Confortable. Style. Nice and happy to use them.", images: ["Nike_bleu", "Nike_bleuA", "Nike_bleuB", "Nike_bleuH", "Nike_bleuJ"], sizes: [40, 41, 42, 43, 44], reviews: [sampleReview, sampleReview], price: 3458),
    .init(id: "abc2", title: "A ADAM CT", brand: "Adidas", description: "Nice. Confortable. Style. Nice and happy to use them.", images: ["Adidas_compo", "Adidas_compoA", "Adidas_compoAr", "Adidas_compoZ"], sizes: [40, 41, 42, 43, 44], reviews: [], price: 3500),
    .init(id: "abc3", title: "A ADAM CT", brand: "Puma", description: "Nice. Confortable. Style. Nice and happy to use them.", images: ["Puma_compoA", "Puma_compoH", "Puma_compoI", "IMG_8071", "IMG_8072", "IMG_8073"], sizes: [40, 41, 42, 43, 44], reviews: [], price: 3300),
    .init(id: "abc4", title: "A ADAM CT", brand: "New Balance", description: "Nice. Confortable. Style. Nice and happy to use them.", images: ["New_balanceA", "New_balanceB", "New_balanceC"], sizes: [40, 41, 42, 43, 44], reviews: [], price: 3200)
]
