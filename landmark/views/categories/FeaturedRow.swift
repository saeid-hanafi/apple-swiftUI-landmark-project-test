//
//  FeaturedRow.swift
//  landmark
//
//  Created by Macvps on 5/13/23.
//

import SwiftUI

struct FeaturedRow: View {
    var featured: [LandMarkData]
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 5) {
                    ForEach(featured) { feature in
                        NavigationLink {
                            LandmarksDetails(landmark: feature)
                        } label: {
                            feature.image
                                .resizable()
                                .scaledToFill()
                                .frame(width: geometry.size.width, height: 150)
                                .clipped()
                                .listRowInsets(EdgeInsets())
                        }
                    }
                }
            }
        }
    }
}

struct FeaturedRow_Previews: PreviewProvider {
    static var featured = ModelData().featured
    
    static var previews: some View {
        FeaturedRow(featured: featured)
            .environmentObject(ModelData())
    }
}
