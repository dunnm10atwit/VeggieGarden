//
//  SIgnUpView.swift
//  Veggie Garden
//
//  
//

import SwiftUI
import Firebase

// SignUpView for user registration
struct SignUpView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        ZStack {
           
            Color.blue.ignoresSafeArea()
            Color.white.opacity(0.5).ignoresSafeArea()

            VStack {
              
                Text("REGISTER")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 40)
                    .foregroundColor(.white)

               
                TextField("Email", text: $email)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background()
                    .cornerRadius(10)

               
                SecureField("Password", text: $password)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background()
                    .cornerRadius(10)

               
                Button("Sign Up") {
                    signUp()
                }
                .foregroundColor(.blue)
                .frame(width: 200, height: 20)
                .background(.white.opacity(0.5))
                .cornerRadius(10)
                .padding(.bottom, 40)
            }
        }
        .padding()
    }

    // Function to handle user sign-up
    private func signUp() {
        Auth.auth().createUser(withEmail: email, password: password) { _, error in
            if error == nil {
                // Sign-up successful, dismiss SignUpView
                presentationMode.wrappedValue.dismiss()
            } else {
                print(error!.localizedDescription)
                // Handle sign-up error
            }
        }
    }
}
