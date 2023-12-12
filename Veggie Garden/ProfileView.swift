//
//  ProfileView.swift
//  Veggie Garden
//
//  
//

import SwiftUI
import Firebase

// ProfileView displays user profile information
struct ProfileView: View {
    @EnvironmentObject var authManager: AuthManager
    @State private var navigateToHomeview = false

    var body: some View {
        ZStack {
           
            Color.blue.ignoresSafeArea()
            Color.white.opacity(0.5).ignoresSafeArea()

            VStack {
                
                Image("user")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)

                // Display user email or show "Not available" if email is nil
                if let userEmail = authManager.userEmail {
                    Text("User Email: \(userEmail)")
                        .padding()
                } else {
                    Text("User Email: Not available")
                        .padding()
                }

                // Button to navigate back to Homeview
                Button("Back to Home page") {
                    navigateToHomeview.toggle()
                }
                .foregroundColor(.blue)
                .padding()
                .fullScreenCover(isPresented: $navigateToHomeview) {
                    Homeview()
                        .environmentObject(authManager)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

