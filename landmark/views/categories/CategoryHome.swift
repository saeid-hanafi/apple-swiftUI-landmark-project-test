//
//  CategoryHome.swift
//  landmark
//
//  Created by Macvps on 5/13/23.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView {
            List {
                FeaturedRow(featured: modelData.featured)
                    .frame(height: 150)
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { cat in
                    CategoryRow(catName: cat, items: modelData.categories[cat]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .navigationTitle("Featured")
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
            
    }
}
