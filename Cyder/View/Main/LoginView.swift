//
//  LoginView.swift
//  Cyder
//
//  Created by Navjeeven Mann on 2023-03-18.
//

import SwiftUI
import AuthenticationServices
struct LoginView: View {
    var body: some View {
        VStack {
            Image("Cyder")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaledToFit()
                .frame(width: 150)
            HStack {
                Text("**Your**")
                    .font(.largeTitle)

                Text("**Data.**")
                    .font(.largeTitle)
                    .foregroundColor(Color("AccentColor"))
            }
            
            HStack {
                Text("**Your**")
                    .font(.largeTitle)
                Text("**Rules.**")
                    .font(.largeTitle)
                    .foregroundColor(Color("AccentColor"))

            }
            
            
            Spacer()
            
            HStack(spacing: 0) {
                Image(systemName: "mail.fill")
                    .imageScale(.medium)
                     Button(" Continue with Email", action: {
                         User.shared.userType = .signedIn
                     })
               
                     
                 }
                 .frame(maxWidth: .infinity)
                 .padding([.top, .bottom], 11)
                 .background(.black)
                 .foregroundColor(.white)
                 .tint(.clear)
                 .cornerRadius(10)
            
            
            SignInWithAppleButton(.continue, onRequest: {(request) in
                
                request.requestedScopes = [.email, .fullName]
                
            }, onCompletion: {(result) in
                
                switch result {
                case .success(let authResult):
                    Task {
                        User.shared.userType = .signedIn
                    }
                case .failure(let error):
                    print("Error: \(error)")
                }
                
            })
            .signInWithAppleButtonStyle(.whiteOutline)
            .frame(maxWidth: .infinity, maxHeight: 45)
           
            
            HStack(spacing: 0) {
                     Image("Google")
                         .resizable()
                         .frame(width: 25, height: 25)
                     Button("Continue with Google", action: {
                         User.shared.userType = .signedIn
                     })
               
                     
                 }
                 .frame(maxWidth: .infinity)
                 .padding([.top, .bottom], 11)
                 .background(.black)
                 .foregroundColor(.white)
                 .tint(.clear)
                 .cornerRadius(10)
            
            
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
