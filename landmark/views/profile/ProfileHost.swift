//
//  ProfileHost.swift
//  landmark
//
//  Created by Macvps on 5/13/23.
//

import SwiftUI

struct ProfileHost: View {
    @State private var draftProfile = Profile.default
    @EnvironmentObject var modelData: ModelData
    @Environment(\.editMode) var editMode
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Spacer()
                    EditButton()
                }
                
                if editMode?.wrappedValue == .inactive {
                    ProfileSummary(profile: modelData.profile)
                }else {
                    ProfileEditor(profile: $draftProfile)
                }
            }
            .padding()
        }
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}
