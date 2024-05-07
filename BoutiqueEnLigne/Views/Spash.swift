//
//  Spash.swift
//  BoutiqueEnLigne
//
//  Created by Moussa Cherif on 2024-05-08.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

struct Spash: View {
    
    @State var isActive = false
    var body: some View {
        VStack {
            // ici si user est nil signifie user ne s'est connecté a l'app donc ils vont envoyer vers le onboarding sinon ils l'envoye vers ContentView
            if isActive {
                if Auth.auth().currentUser != nil {
                    ContentView()
                    
                } else {
                    OnboardingView()
                }
               
                
            } else {
                Text("MY STORE")
                    .font(.largeTitle.bold())
            }
        }
        .onAppear(){
            // on va vers l'ecran onboardingView apres 2.5 secs
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    isActive = true
                }
            }
            
        }
    }
}

#Preview {
    Spash()
}
