//
//  LandmarksList.swift
//  landmark
//
//  Created by Macvps on 5/7/23.
//

import SwiftUI

struct LandmarksList: View {
    @EnvironmentObject var modelData: ModelData
    
    @State private var favoriteOnly: Bool = false
    
    private var filteredLandmarks: [LandMarkData] {
        modelData.landmarks.filter { landMarkD in
            (!favoriteOnly || landMarkD.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List{
                Toggle("Select Favorites", isOn: $favoriteOnly)
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarksDetails(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarksList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarksList()
            .environmentObject(ModelData())
    }
}
