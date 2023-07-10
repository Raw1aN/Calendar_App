//
//  Work.swift
//  Calendar_App
//
//  Created by Алексей Щукин on 09.07.2023.
//

import Foundation

// MARK: - Work
struct Work: Codable {
    
    let dateStart, dateFinish: Date
    let name, description: String

    enum CodingKeys: String, CodingKey {
        case dateStart = "date_start"
        case dateFinish = "date_finish"
        case name, description
    }
}

typealias Works = [Work]
