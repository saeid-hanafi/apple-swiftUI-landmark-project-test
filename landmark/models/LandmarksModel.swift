//
//  LandmarksModel.swift
//  landmark
//
//  Created by Macvps on 5/7/23.
//

import Foundation
var landmarks: [LandMarkData] = loadLandmarks("landmarkData.json")

func loadLandmarks<T: Decodable>(_ filename: String) -> T {
    var data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    }catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}