//
//  ProfileView.swift
//  BoutiqueEnLigne
//
//  Created by Moussa Cherif on 2024-07-21.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct ProfileView: View {
    @State private var username: String = ""
    @State private var email: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Profile")
                .font(.largeTitle)
                .bold()
            
            Text("Username: \(username)")
                .font(.title2)
            
            Text("Email: \(email)")
                .font(.title2)
            
            Spacer()
        }
        .padding()
        .onAppear {
            loadUserData()
        }
        .navigationTitle("Profile")
    }
    
    func loadUserData() {
        if let storedUsername = UserDefaults.standard.string(forKey: "NAME"),
           let storedEmail = UserDefaults.standard.string(forKey: "EMAIL") {
            username = storedUsername
            email = storedEmail
        } else {
            // Vous pouvez également récupérer les données depuis Firestore ici si nécessaire
            if let uid = Auth.auth().currentUser?.uid {
                let db = Firestore.firestore()
                db.collection("USERS").document(uid).getDocument { document, error in
                    if let document = document, document.exists {
                        username = document.data()?["User Name"] as? String ?? ""
                        email = document.data()?["Email"] as? String ?? ""
                    }
                }
            }
        }
    }
}
