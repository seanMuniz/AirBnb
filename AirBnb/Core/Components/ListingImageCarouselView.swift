//
//  ListingImageView.swift
//  AirBnb
//
//  Created by Sean Muniz on 2024-10-13.
//

import SwiftUI

struct ListingImageCarouselView: View {
    
    let listing: Listing
    
    var body: some View {
        
        // each view will represent a separate tab.
        // allows us to navigate between different sections using the
        // tab bar.
        TabView{
            ForEach(listing.imageURLs, id: \.self) { image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    ListingImageCarouselView(listing: DeveloperPreview.shared.listings[0])
}
