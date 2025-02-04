//
//  WishlistView.swift
//  AirBnb
//
//  Created by Sean Muniz on 2024-10-14.
//

import SwiftUI

struct WishlistView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 32) {
                    
                VStack(alignment: .leading, spacing: 4){
                    Text("Log in to view your wishlists")
                        .font(.headline)
                        
                    Text(" You can create, view or edit wishlists once You've logged in")
                        .font(.footnote)
                }
                Button {
                    print("SOMETHING")
                } label: {
                    Text("Log in")
                        .frame(width: 360, height: 48)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                
                Spacer()
                    
            }
            .navigationTitle("Wishlists")
            
            

                
        }
        
        

        
    }
}

#Preview {
    WishlistView()
}
