//
//  ContentView.swift
//  Veggie Garden
//
//  Created by Admin on 11/26/23.
//

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLoginscreen = false
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.blue.ignoresSafeArea()
                
                Rectangle()
                    .rotation(Angle(degrees: 90))
                    .scale(0.7)
                    .foregroundColor(.white.opacity(0.5))
                VStack{
                    Text("WELCOME")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                        
                    TextField("Email", text: $username)
                        .padding()
                        .frame(width: 300, height:50)
                        .background()
                        .cornerRadius(10)
                        .border(.red,width: CGFloat(wrongUsername))
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height:50)
                        .background()
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                    Button("Login"){
                        
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(.blue)
                    .cornerRadius(10)
                    Button("Create Account"){
                        
                    }
                    .foregroundColor(.blue)
                    .frame(width: 200, height: 20)
                    .background(.white.opacity(0.5))
                    .cornerRadius(10)
                    
                }
               
            }
            .navigationBarHidden(true)
        }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
