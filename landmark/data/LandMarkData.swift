//
//  LandMarkData.swift
//  landmark
//
//  Created by Macvps on 5/7/23.
//

import Foundation
import SwiftUI
import CoreLocation

struct LandMarkData: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
    var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    var coordinateLocation: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    
    struct Coordinates: Hashable
    , Codable {
        var latitude: Double
        var longitude: Double
    }
}
