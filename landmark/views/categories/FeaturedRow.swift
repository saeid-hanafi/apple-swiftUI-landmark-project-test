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
    private var gradient: LinearGradient {
        .linearGradient(colors: [.black.opacity(1), .black.opacity(0)], startPoint: .bottom, endPoint: .center)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 5) {
                    ForEach(featured) { feature in
                        NavigationLink {
                            LandmarksDetails(landmark: feature)
                        } label: {
                            ZStack(alignment: .bottomTrailing) {
                                ZStack(alignment: .bottomLeading) {
                                    gradient
                                        .frame(width: geometry.size.width, height: 200)
                                    
                                    feature.image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: geometry.size.width, height: 200)
                                        .clipped()
                                    
                                    VStack(alignment: .leading) {
                                        Text(feature.name)
                                            .bold()
                                            .font(.headline)
                                        
                                        Text(feature.park)
                                            .font(.caption)
                                    }
                                    .padding()
                                }

                                HStack {
                                    ForEach(featured) { featureItem in
                                        if feature == featureItem {
                                            Image(systemName: "smallcircle.filled.circle.fill")
                                                .resizable()
                                                .frame(width: 12, height: 12)
                                                .clipped()
                                        }else{
                                            Image(systemName: "smallcircle.filled.circle")
                                                .resizable()
                                                .frame(width: 12, height: 12)
                                                .clipped()
                                        }
                                    }
                                }
                                .padding()
                            }
                            .listRowInsets(EdgeInsets())
                            .foregroundColor(.white)
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
