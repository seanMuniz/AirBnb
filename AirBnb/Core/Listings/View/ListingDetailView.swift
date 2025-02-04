//
//  ListingDetailView.swift
//  AirBnb
//
//  Created by Sean Muniz on 2024-10-13.
//

import SwiftUI
import MapKit
import CoreLocation

struct ListingDetailView: View {
    
//    var images = [
//        "listing1",
//        "listing2",
//        "listing3",
//        "listing4",
//    ]
    let listing: Listing
    
    @State private var cameraPosition: MapCameraPosition
    
    init(listing: Listing) {
        self.listing = listing
            
        let centerCoordinate = CLLocationCoordinate2D().getCityGrid(listing.city)
        
        let region = MKCoordinateRegion(
            
            center: centerCoordinate,
            
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
        
        self._cameraPosition = State(initialValue: .region(region))
    }
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView{
            ZStack (alignment: .topLeading){
                ListingImageCarouselView(listing: listing)
                    .frame(height: 320)
                
                Button{
                    dismiss()
                    print("HELLO")
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .background{
                            Circle()
                                .fill(.white)
                                .frame(width: 32, height: 32)
                        }
                        .padding(32)
                        .padding(.top, 25)
                }
            }
            
            VStack(alignment: .leading, spacing:8){
                
                Text("\(listing.title)")
                    .font(.title)
                
                VStack(alignment: .leading) {
                    HStack{
                        Image(systemName: "star.fill")
                        
                        Text("\(listing.rating)")
                            
                        Text("28 reviews")
                            .fontWeight(.bold)
                            .underline()
                        Spacer()
                    }
                    .font(.caption)
                    
                    Text("\(listing.city), \(listing.state), US")
                }
                
            }
            .padding()
            
            
            Divider()
            
            // Host info iview
            
            HStack (spacing: 2){
                VStack (alignment: .leading){
                    Text("Entire \(listing.type) in \(listing.city), \(listing.state) hosted by \(listing.ownerName)")
                        .font(.headline)
                    Text("\(listing.numberOfGuests) guests - \(listing.numberOfBedrooms) bedrooms - \(listing.numberOfBeds) beds - \(listing.numberOfBathrooms) baths")
                }
                .font(.caption)
                
                Spacer()
                
                Image("\(listing.ownerImageURL)")
                    .resizable()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
            }
            .padding()
            
            Divider()
            VStack(alignment: .leading, spacing: 16) {
                
                // Makes two HStack which will contain a Vstack in each. 
                ForEach(listing.features){ feature in
                    HStack(spacing: 12){
                        Image(systemName: "\(feature.imageName)")
                        VStack(alignment: .leading){
                            Text(feature.title)
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                            Text(feature.subtitle)
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                    }
                    
                }
            }
            .padding()
            
            
            Divider()
            
            VStack(alignment: .leading){
                Text("Where you'll sleep")
                    .font(.headline)
                
                // This will push the VStack to the side. I'm not sure why though
                ScrollView(.horizontal, showsIndicators: false){
                    
                    HStack(spacing: 16) {
                        
                        // Will create 4 vertical stacks which will appear inline with each other.
                        ForEach(1...listing.numberOfBedrooms, id: \.self){ bedroom in
                            VStack{
                                Image(systemName: "bed.double")
                                
                                Text("Bedroom \(bedroom)")
                            }
                            .frame(width: 132, height: 100)
                            .overlay{
                            RoundedRectangle(cornerRadius: 12)
                                    .stroke(lineWidth: 1)
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                }
                .scrollTargetBehavior(.paging)
            }
            .padding()
            
            
            Divider()
            
            // listing amenities.
            VStack(alignment: .leading, spacing: 16){
                
                Text("What this place offers")
                    .font(.headline)
                
                ForEach(listing.amenities) { amenity in
                    HStack{
                        Image(systemName: amenity.imageName)
                            .frame(width: 32)
                        Text(amenity.title)
                            .font(.footnote)
                        
                        Spacer()
                        
                    }
                }
                
            }
            .padding()
            
            
            Divider()
            
            VStack(alignment: .leading, spacing: 16){
                Text("Where you'll be")
                    .font(.headline)
                
                Map(position: $cameraPosition)
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                
            }
            .padding()
        }
        .toolbar(.hidden, for: .tabBar)
        .ignoresSafeArea(edges: .top)
        .padding(.bottom, 64)
        .padding(.top, 10)
        .overlay(alignment: .bottom) {
            VStack{
 
                Divider()
                    .padding(.bottom)
                
                HStack{
                    VStack (alignment: .leading){
                        Text("\(listing.pricePerNight)")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        Text("Total before taxes")
                            .font(.footnote)
                        
                        Text("Oct 15")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .underline()
                    }
                    
                    Spacer()
                    
                    Button {
                        
                        
                    } label: {
                        Text("Reserve")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 140, height: 40)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                .padding(.horizontal, 32)
            }
            .background(.white)
        }
    }
}

#Preview {
    ListingDetailView(listing: DeveloperPreview.shared.listings[0])
}
