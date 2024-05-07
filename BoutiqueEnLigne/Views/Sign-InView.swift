//
//  Sign-InView.swift
//  BoutiqueEnLigne
//
//  Created by Moussa Cherif on 2024-05-14.
//

import SwiftUI
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore

struct Sign_InView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    @State private var isLoading = false
    
    // ici on ajoute une new var isSigned de sorte a ce que l'user s'est connecté avec succes, il arrivera alors sur l'ecran principal
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
                    
                    
                    Text("Sign-in")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    
                    Text("Enter your email adress and password and continue shopping.")
                        .font(.callout)
                    
                   
                    
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
                        // ici on ajoute isLoading = true parce qu'on voit progressview n'affiche apres le click
                        
                        isLoading = true
                        
                        Auth.auth().signIn(withEmail: email, password: password) {(Result, error) in
                            if error != nil {
                                print(error?.localizedDescription ?? "")
                                withAnimation {
                                    isLoading.toggle()
                                }
                            } else {
                                // on recolt les infos de l'user et on l'envoye a la prochaine view dans l'app.
                                // ici user s'est connecté avec succes donc on change la valeur isSigned a true
                                
                                isSigned = true
                                
                                let db = Firestore.firestore()
                                db.collection("USERS").document(Result?.user.uid ?? "").getDocument{
                                    document, error
                                    in
                                    if let document = document, document.exists{
                                        let name = document.get("User_Name") as? String ?? ""
                                        let email = document.get("Email")
                                        as? String ?? ""
                                        // ici on stocke les noms et email de firestore au conteneurs locol
                                        
                                        UserDefaults.standard.set(name, forKey: "NAME")
                                        UserDefaults.standard.set(email, forKey: "EMAIL")
                                        isLoading.toggle()
                                    }
                                    else {
                                        isLoading.toggle()
                                        print("Document Not Exist")
                                    }
                                }
                            }
                        }
                        // This part is ...
                    } label: {
                        // quand is processing data we show progress sur bouton donc on ajoute
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
                       Sign_upView()
                    } label: {
                        Text("Not having an account? **SignUp**")
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
    Sign_InView()
}
//    Text("Not having an account? **SignUp**")
// Sign_upView()
//  var body: some View {

