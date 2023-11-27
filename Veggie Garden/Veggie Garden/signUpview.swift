//
//  signUpview.swift
//  Veggie Garden
//
//  Created by Admin on 11/26/23.
//

import SwiftUI

struct signUpview: View {
    @State private var username = ""
    @State private var password = ""
    var body: some View {
        NavigationView{
            ZStack{
                Color.blue.ignoresSafeArea()
                
                Rectangle()
                    .rotation(Angle(degrees: 90))
                    .scale(1.4)
                    .foregroundColor(.white.opacity(0.5))
                VStack{
                    Text("Enter your email:")
                        .padding()
                        .frame(width: 340, height: 20, alignment: .leading)
                        
                    TextField("Email", text: $username)
                        .padding()
                        .frame(width: 300, height:50)
                        .background()
                        .cornerRadius(10)
                    Text("Confirm your email:")
                        .padding()
                        .frame(width: 340, height: 20, alignment: .leading)
                    TextField("Confirm Email", text: $username)
                        .padding()
                        .frame(width: 300, height:50)
                        .background()
                        .cornerRadius(10)
                    Text("Create Password:")
                        .padding()
                        .frame(width: 340, height: 20, alignment: .leading)
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height:50)
                        .background()
                        .cornerRadius(10)
                    Text("Confirm Password:")
                        .padding()
                        .frame(width: 340, height: 20, alignment: .leading)
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height:50)
                        .background()
                        .cornerRadius(10)
                    Button("Sign up"){
                        
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(.blue)
                    .cornerRadius(10)
                    
                    
                }
               
            }
            .navigationBarHidden(true)
        }
        
}

struct signUpview_Previews: PreviewProvider {
    static var previews: some View {
        signUpview()
    }
}
}
