//
//  WorkRealm.swift
//  Calendar_App
//
//  Created by Алексей Щукин on 10.07.2023.
//

import Foundation
import RealmSwift

// MARK: - Work Realm
class WorkRealm: Object {
    
    @objc dynamic var dateStart = Date()
    @objc dynamic var dateFinish = Date()
    @objc dynamic var name = String()
    @objc dynamic var workDescription = String()
    
}
