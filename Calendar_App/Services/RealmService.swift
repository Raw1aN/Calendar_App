//
//  RealmService.swift
//  Calendar_App
//
//  Created by Алексей Щукин on 10.07.2023.
//

import Foundation
import RealmSwift

class RealmService {

// MARK: - Private Properties
    private let realm = try? Realm()
    
// MARK: - Realm Service Functions
    func addWork(work: WorkRealm) {
        guard let realm = self.realm else { return }
        try? realm.write({
            realm.add(work)
        })
    }
    
    func getAllWork(complition: @escaping (Results<WorkRealm>) -> Void) {
        guard let realm = self.realm else { return }
        let works = realm.objects(WorkRealm.self)
        complition(works)
    }
}
