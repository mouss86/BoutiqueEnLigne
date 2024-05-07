//
//  OnboardingView.swift
//  BoutiqueEnLigne
//
//  Created by Moussa Cherif on 2024-05-08.
//

import SwiftUI

struct OnboardingView: View {
    @State private var isActive = false
    // now add some animation properties
    @State private var isExpanded = false
    @State private var offset = CGSize.zero
    
    var body: some View {
        
        if isActive {
           Sign_InView()
            // we more to Login Screen after that
        } else {
            //Design of This view
            
            ZStack(alignment: .top) {
                VStack {
                    Spacer()
                    // add a circle in bottom that show animation
                    Circle()
                        .fill(
                            RadialGradient(colors: [.green, .clear,.clear,.clear], center: .center, startRadius: 0, endRadius: UIScreen.main.bounds.width)
                        )
                        
                        .scaleEffect( isExpanded ? 20: 2)
                        .padding(.bottom, -(UIScreen.main.bounds.width / 2))
                }
                .frame(height: .infinity)
            
                VStack(spacing: 15, content:  {
                    Spacer()
                    Image("shoes-onboarding")
                        .resizable()
                        .scaledToFit()
                    Text("Welcome to Store")
                        .font(.largeTitle.bold())
                        .background(.white)
                    
                    Text("The place to find fashionable colection")
                        .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                        .background()
                    Spacer()
                    
                    VStack {
                        Image(systemName: "chevron.up")
                        Text("Get Started")
                            .padding()
                            .background()
                    }
                    .fontWeight(.medium)
                    .background()
                })
                .opacity(isExpanded ? 0 : 1)
                .offset(offset)
                }
           
            // when user swipe up all layout goes up so far that we add swipe up gesture
            .gesture(DragGesture()
                .onEnded({ value in
                    if value.translation.height < 50 {
                        withAnimation(.easeInOut(duration: 2)) {
                            offset = value.translation
                            isExpanded = true
                        }
                        // now when swipe we move to next scene
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0,  execute: {
                            withAnimation {
                                isActive.toggle()
                            }
                        }
                    )}
                    
                }))
                
            
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Image("onboarding_back")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            )
            .preferredColorScheme(.light)
        }
    }
}
   
   #Preview {
       OnboardingView()
   }


