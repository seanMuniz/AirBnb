//
//  ExploreviewModel.swift
//  AirBnb
//
//  Created by Sean Muniz on 2024-10-21.
//

import Foundation

class ExploreViewModel: ObservableObject {
    
    @Published var listings = [Listing]()
    @Published var searchLocation = ""
    
    
    private let service: ExploreService
    
    private var listingsCopy = [Listing]()
    
    
    
    init(service: ExploreService){
        self.service = service
        
        Task {await fetchListings() }
    }
        
    func fetchListings() async {
        do {
            self.listings = try await service.fetchListings()
            self.listingsCopy = listings
        } catch {
            print("DEBUG failed tyo fetch listings with error")
        }
        
    }

    
    func updateListingsForLocaiton(){
        // user searches for a listing
        let filteredListings = listings.filter({
            $0.city.lowercased() == searchLocation.lowercased() ||
            $0.state.lowercased() == searchLocation.lowercased()
        })
        
        
        self.listings = filteredListings.isEmpty ? listingsCopy : filteredListings
    }
    
}
