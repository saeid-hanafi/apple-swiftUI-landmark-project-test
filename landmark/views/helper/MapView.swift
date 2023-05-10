//
//  MapView.swift
//  landmark
//
//  Created by Macvps on 5/7/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion()

       var body: some View {
           Map(coordinateRegion: $region)
       }
    
    private func setRegion(coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    }
}

struct MapView_Previews: PreviewProvider {
    private static var landmarks = ModelData().landmarks
    
    static var previews: some View {
        MapView(coordinate: landmarks[1].coordinateLocation)
    }
}
