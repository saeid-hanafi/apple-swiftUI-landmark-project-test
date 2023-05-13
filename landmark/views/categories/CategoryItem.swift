//
//  CategoryItem.swift
//  landmark
//
//  Created by Macvps on 5/13/23.
//

import SwiftUI

struct CategoryItem: View {
    var item: LandMarkData
    
    var body: some View {
        VStack(alignment: .leading) {
            item.image
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(item.name)
                .font(.caption)
                .tint(.blue)
        }
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(item: ModelData().landmarks[0])
    }
}
