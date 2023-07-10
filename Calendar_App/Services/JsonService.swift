//
//  JsonService.swift
//  Calendar_App
//
//  Created by Алексей Щукин on 10.07.2023.
//

import Foundation

class JsonService {
    
// MARK: - Private Properties
    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        return decoder
    }()
    
    private let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        return formatter
    }()

// MARK: - JsonService Functions
    func getWorks(complition: @escaping ([Work]) -> Void) {
        guard let path = Bundle.main.path(forResource: "works", ofType: "json") else { return }
        let url = URL(fileURLWithPath: path)
        guard let jsonData = try? Data(contentsOf: url) else { return }
        decoder.dateDecodingStrategy = .formatted(formatter)
        guard let works = try? self.decoder.decode(Works.self, from: jsonData) else { return }
        complition(works)
    }
}
