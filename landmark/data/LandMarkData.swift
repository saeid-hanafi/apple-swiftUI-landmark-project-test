//
//  LandMarkData.swift
//  landmark
//
//  Created by Macvps on 5/7/23.
//

import Foundation
import SwiftUI
import CoreLocation

struct LandMarkData: Hashable, Codable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    var coordinateLocation: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitute)
    }
    
    struct Coordinates: Hashable
    , Codable {
        var latitude: Double
        var longitute: Double
    }
}
