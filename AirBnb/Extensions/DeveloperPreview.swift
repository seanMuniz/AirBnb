//
//  DeveloperPreview.swift
//  AirBnb
//
//  Created by Sean Muniz on 2024-10-21.
//

import Foundation

class DeveloperPreview {
    static let shared = DeveloperPreview()
    var listings: [Listing] = [
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "John Smith",
            ownerImageURL: "IMG_3310",
            numberOfBedrooms: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 4,
            numberOfBeds: 4,
            pricePerNight: 567,
            latitude: 25.7858,
            longitude: -80.1936,
            imageURLs: ["listing1_1", "listing1_2", "listing1_3", "listing1_4"],
            address: "124 Main Street",
            city: "Miami",
            state: "Florida",
            title: "Miami Villa",
            rating: 4.86,
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .alarmSystem, .balcony, .laundry, .tv],
            type: .villa
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Tung Lam",
            ownerImageURL: "IMG_3310",
            numberOfBedrooms: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 4,
            numberOfBeds: 4,
            pricePerNight: 567,
            latitude: 25.7858,
            longitude: -80.1936,
            imageURLs: ["listing3_1", "listing3_2", "listing3_3", "listing3_4"],
            address: "124 Main Street",
            city: "San Francisco",
            state: "California",
            title: "Room in aparthotel",
            rating: 4.86,
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .alarmSystem, .balcony, .laundry, .tv],
            type: .villa
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Linh",
            ownerImageURL: "IMG_3310",
            numberOfBedrooms: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 4,
            numberOfBeds: 4,
            pricePerNight: 567,
            latitude: 25.7858,
            longitude: -80.1936,
            imageURLs: ["listing5_1", "listing5_2", "listing5_3", "listing5_4"],
            address: "124 Main Street",
            city: "Los Angeles",
            state: "California",
            title: "Apartment",
            rating: 4.86,
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .alarmSystem, .balcony, .laundry, .tv],
            type: .villa
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Kabir",
            ownerImageURL: "IMG_3310",
            numberOfBedrooms: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 4,
            numberOfBeds: 4,
            pricePerNight: 567,
            latitude: 25.7858,
            longitude: -80.1936,
            imageURLs: ["listing4_1", "listing4_2", "listing4_3"],
            address: "124 Main Street",
            city: "Las Vegas",
            state: "Nevada",
            title: "Entire condo",
            rating: 4.86,
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .alarmSystem, .balcony, .laundry, .tv],
            type: .villa
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Vlad",
            ownerImageURL: "IMG_3310",
            numberOfBedrooms: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 4,
            numberOfBeds: 4,
            pricePerNight: 567,
            latitude: 25.7858,
            longitude: -80.1936,
            imageURLs: ["listing2_1", "listing2_2", "listing2_3", "listing2_4"],//
            address: "124 Main Street",
            city: "New York City",
            state: "New York",
            title: "Room",
            rating: 4.86,
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .alarmSystem, .balcony, .laundry, .tv],
            type: .villa
        )
    ]
}
