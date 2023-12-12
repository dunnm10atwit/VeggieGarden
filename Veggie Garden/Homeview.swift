//
//  Homeview.swift
//  Veggie Garden
//
//  
//

import SwiftUI

// Homeview displays main app features
struct Homeview: View {
    @EnvironmentObject var authManager: AuthManager
    @State private var navigateToProfile = false

    var body: some View {
        NavigationView {
            ZStack {
                
                Color.blue.ignoresSafeArea()
                Color.white.opacity(0.5).ignoresSafeArea()

                VStack {
                    
                    Image("home")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 300, height: 300)

                    Spacer().frame(height: 100)

                    
                    Link("UPLOAD", destination: URL(string: "https://brezzy.us/")!)
                        .foregroundColor(.blue)
                        .frame(width: 300, height: 50)
                        .background(.white)
                        .cornerRadius(10)
                        .padding(.top, 20)

                    Button("Profile") {
                        navigateToProfile.toggle()
                    }
                    .foregroundColor(.blue)
                    .frame(width: 300, height: 50)
                    .background(.white)
                    .cornerRadius(10)
                    .fullScreenCover(isPresented: $navigateToProfile) {
                        ProfileView()
                            .environmentObject(authManager)
                    }

                    Spacer()

                  
                    Button("Logout") {
                        authManager.logout()
                    }
                    .foregroundColor(.blue)
                    .frame(width: 300, height: 50)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(10)
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}
