//
//  landmarkApp.swift
//  landmark
//
//  Created by Macvps on 5/7/23.
//

import SwiftUI

@main
struct landmarkApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
