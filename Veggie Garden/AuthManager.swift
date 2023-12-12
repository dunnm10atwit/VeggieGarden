//
//  AuthManager.swift
//  Veggie Garden
//
//  
//
import SwiftUI
import Firebase

// class managing user authentication
class AuthManager: ObservableObject {
    @Published var userIsLoggedIn = false
    @Published var userEmail: String?

    // Function to handle user login
    func login(email: String, password: String, completion: @escaping (Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error == nil {
                self.userIsLoggedIn = true
                self.userEmail = Auth.auth().currentUser?.email
                completion(true)
            } else {
                print(error!.localizedDescription)
                completion(false)
            }
        }
    }

    // Function to handle user logout
    func logout() {
        do {
            try Auth.auth().signOut()
            userIsLoggedIn = false
            userEmail = nil
        } catch {
            print(error.localizedDescription)
        }
    }
}

