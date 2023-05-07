//
//  LandmarksList.swift
//  landmark
//
//  Created by Macvps on 5/7/23.
//

import SwiftUI

struct LandmarksList: View {
    var body: some View {
        List(landmarks) { landmark in
            LandmarkRow(landmark: landmark)
        }
    }
}

struct LandmarksList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarksList()
    }
}
