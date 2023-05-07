//
//  LandmarkView.swift
//  landmark
//
//  Created by Macvps on 5/7/23.
//

import SwiftUI

struct LandmarkView: View {
    var body: some View {
        Image("twinlake")
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.blue, lineWidth: 1)
            }
            .shadow(radius: 5)
    }
}

struct LandmarkView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkView()
    }
}
