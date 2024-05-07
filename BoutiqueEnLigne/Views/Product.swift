//
//  Product.swift
//  BoutiqueEnLigne
//
//  Created by Moussa Cherif on 2024-07-11.
//
import SwiftUI

struct Product: View {
    var data: ProductsModelView
    @State var selectedSize = 40
    @Environment(\.presentationMode) var dismiss
    
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    VStack {
                        ZStack(alignment: .top) {
                            ImageSlider(images: data.images)
                                .frame(height: 400)
                                .clipShape(RoundedRectangle(cornerRadius: 50))
                                .padding(10)
                            
                            HStack {
                                Button(action: {
                                    dismiss.wrappedValue.dismiss()
                                    }) {
                                    Image(systemName: "arrow.left")
                                    .font(.system(size: 20))
                                    .padding(.top, safeArea().top)
                                   
                                    }
                                Spacer()
                             Image(systemName: "heart")
                                    .padding(.top, safeArea().top)
                            }
                            .padding(.horizontal, 30)
                            .imageScale(.large)
                        }
                        
                        Image(data.brand.lowercased())
                        Text(data.title)
                            .font(.largeTitle.bold())
                        Text("$\(data.price)")
                            .font(.title.bold())
                        
                        VStack(alignment: .leading) {
                            Text("Size")
                                .font(.title2.bold())
                            
                            ScrollView(.horizontal) {
                                HStack {
                                    ForEach(data.sizes, id: \.self) { item in
                                        Text("\(item)")
                                            .font(.headline)
                                            .frame(width: 65, height: 65)
                                            .background(selectedSize == item ? .black : .gray.opacity(0.07))
                                            .foregroundStyle(selectedSize == item ? .white : .blue)
                                            .clipShape(RoundedRectangle(cornerRadius: 28))
                                            .onTapGesture {
                                                selectedSize = item
                                            }
                                    }
                                }
                            }
                            .scrollIndicators(.hidden)
                        }
                        .padding()
                        
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Details")
                                .font(.title2.bold())
                                .foregroundStyle(.blue)
                            Text(data.description)
                                .multilineTextAlignment(.leading)
                                .foregroundStyle(.blue)
                        }
                        .padding()
                    }
                }
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("$\(data.price)")
                            .font(.title2.bold())
                            .foregroundStyle(.blue)
                    }
                    .frame(width: UIScreen.main.bounds.width / 2.7, height: 60)
                    .clipShape(.rect(cornerRadius: 26))
                    
                    Button("Add to Cart") {
                        
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(.black)
                    .clipShape(.rect(cornerRadius: 26))
                    .foregroundStyle(.blue)
                    .fontWeight(.semibold)
                }
                .padding(.horizontal)
            }
            .edgesIgnoringSafeArea(.top)
        }
        .scrollIndicators(.hidden)
    }
}


// pr padding de safe area, on besoin de taille prce q differents appareils ont differentes tailles

extension View {
    func safeArea () -> UIEdgeInsets {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else  {
            return .zero
        }
        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            return .zero
        }
        return safeArea
        
    }
}
