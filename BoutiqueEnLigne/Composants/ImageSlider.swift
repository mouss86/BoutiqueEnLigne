//
//  ImageSlider.swift
//  BoutiqueEnLigne
//
//  Created by Moussa Cherif on 2024-07-11.
//

import SwiftUI

struct ImageSlider: View {
    
    var images: [String]
    
    var body: some View {
        TabView {
            ForEach(images, id: \.self) { img in
                Image(img)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

