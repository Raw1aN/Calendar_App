//
//  AddViewModel.swift
//  Calendar_App
//
//  Created by Алексей Щукин on 10.07.2023.
//

import Foundation

class AddViewModel {
    
// MARK: - Private Properties
    private let realmService = RealmService()
    
// MARK: - View Model Methods
    func addWorkRealm(work: WorkRealm) {
        realmService.addWork(work: work)
    }
}
