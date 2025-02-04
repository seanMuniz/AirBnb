//
//  ExploreService.swift
//  AirBnb
//
//  Created by Sean Muniz on 2024-10-21.
//

import Foundation


class ExploreService {
    func fetchListings() async throws-> [Listing] {
        return DeveloperPreview.shared.listings
        
    }
}
