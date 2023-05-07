//
//  LandmarksDetails.swift
//  landmark
//
//  Created by Macvps on 5/7/23.
//

import SwiftUI

struct LandmarksDetails: View {
    var landmark: LandMarkData
    
    var body: some View {
        ScrollView {
            VStack {
                MapView(coordinate: landmark.coordinateLocation)
                            .frame(height: 300)
                            .padding(.bottom, -130)

                LandmarkView(image: landmark.image)
                            .offset(y: -130)
                            .padding(.bottom, -130)

                        VStack(alignment: .leading) {
                            Text(landmark.name)
                                .font(.title)

                            HStack {
                                Text(landmark.park)
                                    .font(.subheadline)
                                Spacer()
                                Text(landmark.state)
                                    .font(.subheadline)
                            }
                            .font(.subheadline)
                                           .foregroundColor(.secondary)

                                           Divider()

                            Text(landmark.description)
                        }
                        .padding()
                        Spacer()
                    }
        }
        
    }
}

struct LandmarksDetails_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(devicesNames, id: \.self) { deviceName in
            LandmarksDetails(landmark: landmarks[1])
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
