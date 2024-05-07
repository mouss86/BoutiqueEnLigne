//
//  BrandModelView.swift
//  BoutiqueEnLigne
//
//  Created by Moussa Cherif on 2024-05-16.
//

import SwiftUI

struct BrandModelView: Identifiable, Hashable {
    var id: UUID = .init()
    var title: String
    var icon: String
}

var sampleBrands: [BrandModelView] = [
    .init(title: "All", icon: ""),
    .init(title: "Nike", icon: "Nike_affichage"),
    .init(title: "Adidas", icon: "Adidas_affichage"),
    .init(title: "Puma", icon: "Puma_affichage"),
    .init(title: "New Balance", icon: "NewBalance_affichage")
]

