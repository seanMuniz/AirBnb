//
//  ProfileOptionView.swift
//  AirBnb
//
//  Created by Sean Muniz on 2024-10-14.
//

import SwiftUI

struct ProfileOptionView: View {
    
    let imageName: String
    
    let title: String
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: imageName)
                
                Text(title)
                    .font(.subheadline)
                
                Spacer()
            }
            
            Divider()
        }
    }
}

#Preview {
    ProfileOptionView(imageName: "gear", title: "Settings")
}
