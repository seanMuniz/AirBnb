//
//  ListingItemView.swift
//  AirBnb
//
//  Created by Sean Muniz on 2024-10-13.
//

import SwiftUI

struct ListingItemView: View {
    
    let listing: Listing
    
    
    
    
    var body: some View{
        VStack(spacing: 10){
            
            //images
            
            ListingImageCarouselView(listing: listing)
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))

                        
            //listing detail
            HStack(alignment: .top){
                // details
                VStack(alignment: .leading) {
                    Text("\(listing.city), \(listing.state)")
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(.black))
                    
                    Text("12 mi away")
                        .foregroundStyle(.gray)
                        .foregroundStyle(Color(.black))
                    
                    Text("Nov 3 - 10")
                        .foregroundStyle(.gray)
                    // Pricing Details
                    HStack(spacing: 4){
                        Text("$\(listing.pricePerNight)")
                            .fontWeight(.semibold)
                        Text("Night")
                    }
                    .foregroundStyle(Color(.black))
                }
                
                Spacer()
                
                // Pricinhg
                HStack{
                    Image(systemName: "star.fill")
                    
                    Text("\(listing.rating)")
                }
                .foregroundStyle(Color(.black))
            }
            .font(.footnote)
        }
        .padding()
    }
}

#Preview {
    ListingItemView(listing: DeveloperPreview.shared.listings[0])
}
