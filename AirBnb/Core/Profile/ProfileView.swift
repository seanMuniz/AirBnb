//
//  ProfileView.swift
//  AirBnb
//
//  Created by Sean Muniz on 2024-10-14.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack{
            VStack (alignment: .leading, spacing: 32){
                
                VStack(alignment: .leading, spacing: 8){
                    Text("Profile")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    
                    Text("Log in to start planning your next trip")
                }
                .padding(.horizontal)
                    
                Button {
                    print("Log in ")
                } label : {
                    Text("Log in")
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 48)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                .padding()
                HStack{
                    Text("Don't have an account?")
                    Text("Sign up")
                        .fontWeight(.semibold)
                        .underline()
                }
                .font(.caption)
                .padding(.horizontal)
            }
            
            
            VStack(spacing: 24){
                ProfileOptionView(imageName: "gear", title: "Settings")
                ProfileOptionView(imageName: "gear", title: "Accessibility")
                ProfileOptionView(imageName: "questionmark.circle", title: "Visit the help center")
            }
            .padding(.vertical)
        }
        .padding()
        
        
    }
}

#Preview {
    ProfileView()
}
