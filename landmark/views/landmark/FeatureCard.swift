//
//  FeatureCard.swift
//  landmark
//
//  Created by Macvps on 5/14/23.
//

import SwiftUI

struct FeatureCard: View {
    var landmark: LandMarkData
    
    var body: some View {
        landmark.featureImage?
            .resizable()
            .aspectRatio(3 / 2, contentMode: .fit)
            .overlay {
                TextOverLay(landmark: landmark)
            }
    }
}

struct TextOverLay: View {
    var landmark: LandMarkData
    var gradient: LinearGradient {
        .linearGradient(colors: [.black.opacity(0.5), .black.opacity(0)], startPoint: .bottom, endPoint: .center)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .bold()
                    .font(.title)
                
                Text(landmark.park)
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(landmark: ModelData().featured[0])
    }
}
