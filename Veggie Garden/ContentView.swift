//
//  ContentView.swift
//  Veggie Garden
//
// 
//
import SwiftUI
import Firebase

// login view responsible for handling user authentication
struct ContentView: View {
    // variables for user input and authentication status
    @State private var email = ""
    @State private var password = ""
    @State private var wrongEmail = 0
    @State private var wrongPassword = 0
    @State private var showAlert = false
    @StateObject private var authManager = AuthManager()

    // variable to control the presentation of SignUpView
    @State private var isSignUpViewPresented = false

    var body: some View {
        if authManager.userIsLoggedIn {
            // If user is logged in, navigate to the Homeview
            NavigationView {
                Homeview()
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
            }
            .environmentObject(authManager)
        } else {
            // If user is not logged in, show the login/signup content
            content
                .environmentObject(authManager)
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Login Failed"), message: Text("Incorrect email or password. Try again"), dismissButton: .default(Text("OK")))
                }
        }
    }

    var content: some View {
        NavigationView {
            ZStack {
            
                Color.blue.ignoresSafeArea()
                Color.white.opacity(0.5).ignoresSafeArea()

                VStack {
                    
                    Image("logo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 300, height: 300)

                    
                    Text("WELCOME")
                        .font(.largeTitle)
                        .bold()
                        .padding()

                    
                    TextField("Email", text: $email)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background()
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongEmail))

                    
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background()
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))

                    
                    Button("Login") {
                        login()
                    }
                    .foregroundColor(.blue)
                    .frame(width: 200, height: 20)
                    .background(.white.opacity(0.5))
                    .cornerRadius(10)

                    
                    Button("Create Account") {
                        isSignUpViewPresented = true
                    }
                    .foregroundColor(.blue)
                    .frame(width: 200, height: 20)
                    .background(.white.opacity(0.5))
                    .cornerRadius(10)
                }
            }
            .onAppear {
                // Check authentication status when view appears
                Auth.auth().addStateDidChangeListener { auth, user in
                    authManager.userIsLoggedIn = user != nil
                    authManager.userEmail = user?.email
                }
            }
            .navigationBarHidden(true)
            .fullScreenCover(isPresented: $isSignUpViewPresented) {
                // Present SignUpView when isSignUpViewPresented is true
                SignUpView()
            }
        }
    }

    //  handles user login
    private func login() {
        authManager.login(email: email, password: password) { success in
            if !success {
                showAlert = true
                wrongEmail += 1
                wrongPassword += 1
            }
        }
    }
}
