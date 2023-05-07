//
//  LandmarkRow.swift
//  landmark
//
//  Created by Macvps on 5/7/23.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: LandMarkData
    
    var body: some View {
        HStack{
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .overlay{
                    Circle().stroke(.blue, lineWidth: 1)
                }
                .shadow(radius: 2)
            Text(landmark.name)
            Spacer()
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkRow(landmark: landmarks[1])
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
