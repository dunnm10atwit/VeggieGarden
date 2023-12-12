//
//  Veggie_GardenApp.swift
//  Veggie Garden
//
//  
//

import SwiftUI
import Firebase
@main
struct Veggie_GardenApp: App {
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
