//
//  LandmarksModel.swift
//  landmark
//
//  Created by Macvps on 5/7/23.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var landmarks: [LandMarkData] = loadLandmarks("landmarkData.json")
}

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

func updateLandmarks(filename: String, Landmarks: [LandMarkData]) -> Bool {
    var jsonData: String
    guard let url = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("JSON file read Error!!")
    }
    
    do {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        jsonData = String(data: try encoder.encode(Landmarks), encoding: .utf8)!
    }catch {
        fatalError("JSON Data Encode Error : \(error.localizedDescription)")
    }
    
    do {
        try jsonData.write(to: url, atomically: true, encoding: .utf8)
    }catch {
        fatalError("JSON Data Write Error : \(error.localizedDescription)")
    }
    
    return true
}
