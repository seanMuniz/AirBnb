//
//  Regions.swift
//  AirBnb
//
//  Created by Sean Muniz on 2024-10-21.
//

import CoreLocation

extension CLLocationCoordinate2D{

    func getCityGrid(_ name: String) -> CLLocationCoordinate2D {
        
        switch name {
            case "Los Angeles":
                return CLLocationCoordinate2D(latitude: 34.0549, longitude: -118.2426)
            case "Miami":
                return CLLocationCoordinate2D(latitude: 25.7602, longitude: -80.1959)
            case "San Francisco":
                return CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)
            case "New York City":
                return CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060)
            case "Las Vegas":
                return CLLocationCoordinate2D(latitude: 36.1716, longitude: -115.1391)
            default:
                return CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)
        
        }
    }
    
}
