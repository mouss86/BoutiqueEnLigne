//
//  Sign-upView.swift
//  BoutiqueEnLigne
//
//  Created by Moussa Cherif on 2024-05-14.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

struct Sign_upView: View {

@State private var username: String = ""
@State private var email: String = ""
@State private var password: String = ""
    
    
    @State private var isLoading = false
    
    @State private var isSigned = false 
    
    @Environment(\.presentationMode) var dismiss


    var body: some View {
        NavigationStack {
            VStack(alignment: .leading,spacing: 40, content:  {
                
                
                VStack( spacing: 15, content: {
                    
                    Image(systemName: "arrow.left")
                        .imageScale(.large)
                        .onTapGesture {
                            dismiss.wrappedValue.dismiss()
                        }
                    Text("Sign-up")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    
                    Text("Enter your email adress and password and continue shopping.")
                        .font(.callout)
                    
                    TextField( "User name", text: $username)
                        .padding(.horizontal)
                        .frame(height: 60)
                        .background(.gray.opacity(0.2))
                        .clipShape(Capsule())
                        .overlay {
                            Capsule()
                                .stroke(.gray.opacity(0.8),lineWidth: 0.5)
                        }
                    
                    TextField("Email Adress", text: $email)
                        .padding(.horizontal)
                        .frame(height: 60)
                        .background(.gray.opacity(0.2))
                        .clipShape(Capsule())
                        .overlay {
                            Capsule()
                                .stroke(.gray.opacity(0.8),lineWidth: 0.5)
                        }
                    SecureField("Password", text: $password)
                        .padding(.horizontal)
                        .frame(height: 60)
                        .background(.gray.opacity(0.2))
                        .clipShape(Capsule())
                        .overlay {
                            Capsule()
                                .stroke(.gray.opacity(0.8),lineWidth: 0.5)
                        }
                })
                Spacer()
                // Login button
                VStack(spacing: 15,content: {
                    Button {
                        // S'enregistrer
                        isLoading.toggle()
                        
                        Auth.auth().createUser(withEmail: email, password:password) {(Result, error)in
                            if error != nil {
                                print(error?.localizedDescription ?? "")
                                withAnimation {
                                    isLoading.toggle()
                                }
                            } else {
                                // ici on stocke les donn'ees basiques de l'suser dans firestore database
                                let db = Firestore.firestore()
                                let data: [String: Any] = ["User Name": username, "Email": email,
                                ]
                                
                                
                                
                                //ici on ajoute le user name et password a la memoire local et on a pas besoin de synchro a chaque fois
                                UserDefaults.standard.setValue(Result?.user.uid, forKey:"UID")
                                // UID est l'unique clée fournie a l'user quand il s'enregistre a firestore database
                                UserDefaults.standard.setValue(username, forKey: "NAME")
                                UserDefaults.standard.setValue(email, forKey: "EMAIL")
                                db.collection("USERS").addDocument(data: data)
                                isLoading.toggle()
                                
                                isSigned = true
                            }
                        }
                        
                    } label: {
                        if isLoading {
                            ProgressView()
                        } else {
                            Text("Continue")
                                .fontWeight(.semibold)
                        }
                        
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(.red)
                    .clipShape(Capsule())
                    .foregroundStyle(.white)
                    .navigationDestination(isPresented: $isSigned) {
                        ContentView()
                    }
                    
                    
                    NavigationLink {
                      Sign_InView()
                    } label: {
                        Text("Alrready have an account? **Sign-in**")
                            .frame(maxWidth: .infinity)
                    }
                    .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                    
                })
                
            })
            
            .padding()
            .preferredColorScheme(.dark)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Sign_upView()
}
