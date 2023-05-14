//
//  ProfileSummary.swift
//  landmark
//
//  Created by Macvps on 5/13/23.
//

import SwiftUI

struct ProfileSummary: View {
    var profile: Profile
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.username)
                    .bold()
                    .font(.title)
                Text("Notification : ")
                    .bold()
                    .font(.title2)
                + Text(profile.prefersNotifications ? "on" : "off")
                    .foregroundColor(.blue)
                    .bold()
                
                Text("Seasonal Photos : ")
                    .bold()
                    .font(.title2)
                + Text(profile.seasonalPhoto.rawValue)
                
                Text("Goal Date : ")
                    .bold()
                    .font(.title2)
                + Text(profile.goalDate, style: .date)
                    .foregroundColor(.blue)
                    .bold()
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Completed Badges")
                        .font(.headline)
                    
                    ScrollView(.horizontal) {
                        HStack{
                            HikeBadge(name: "First Hike")
                            HikeBadge(name: "Earth Hike")
                                .grayscale(0.5)
                                .hueRotation(Angle(degrees: 90))
                            HikeBadge(name: "Final Hike")
                                .hueRotation(Angle(degrees: 45))
                        }
                    }
                }
                
                Divider()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Recent Hikes")
                        .font(.headline)
                    
                    HikeView(hike: modelData.hikes[0])
                }
            }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
            .environmentObject(ModelData())
    }
}
