//
//  CategoryRow.swift
//  landmark
//
//  Created by Macvps on 5/13/23.
//

import SwiftUI

struct CategoryRow: View {
    var catName: String
    var items: [LandMarkData]
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(catName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 5, content: {
                    ForEach(items) { item in
                        NavigationLink {
                            LandmarksDetails(landmark: item)
                        } label: {
                            CategoryItem(item: item)
                        }
                    }
                })
            }

        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    
    static var previews: some View {
        CategoryRow(catName: landmarks[0].category.rawValue, items: Array(landmarks.prefix(5)))
            .environmentObject(ModelData())
    }
}
