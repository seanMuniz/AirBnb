//
//  ExploreView.swift
//  AirBnb
//
//  Created by Sean Muniz on 2024-10-13.
//

import SwiftUI

struct ExploreView: View {
    // state property
    
    // this will allow us to show a view when it is true.
    @State private var showDestinationSearchView = false
    
    @StateObject var viewModel = ExploreViewModel(service: ExploreService())
    
    var body: some View {
        // this allows us to navigate to a new screen. when you tap on this stack,
        // A new screen will stack ontop of it.
        NavigationStack{
            
            
            if showDestinationSearchView{
                DestinationSearchView(show: $showDestinationSearchView, viewModel: viewModel)
                    
            }else {
                ScrollView{
                    
                    // inserts our SearchAndFilterBar component
                    SearchAndFilterBar(location: $viewModel.searchLocation)
                        .onTapGesture {
                            withAnimation(.snappy) {
                                
                                // this will cause the view to re-render itself and will also switch its
                                // value to true.
                                showDestinationSearchView.toggle()
                            }
                        }
                        .padding()
                    
                    // Renders only when the image appears on screen.
                    LazyVStack(spacing: 32){
                    
                        
                        // loops through each item from 0 to 10 where each item is a 'listing'
                        // id: \.self indicates that each item has its own unique identifier.
                        ForEach(viewModel.listings){listing in
                            
                            // NavigationLink is a view that acts as button.
                            // (value: listing) - specifies a value that will be passed to the destination view.
                            NavigationLink(value: listing) {
                                ListingItemView(listing: listing)
                                    .frame(height: 400)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                    }

                }
                
                // recall we used a NavigationLink function call and passed the listing as an argument
                // The destination view will be defined here in this view modifier.
                .navigationDestination(for: Listing.self) { listing in
                    ListingDetailView(listing: listing)
                        .navigationBarBackButtonHidden()
                
                }
            }

            
        }
    }
}

#Preview {
    ExploreView()
}
