//
//  MainViewModel.swift
//  Calendar_App
//
//  Created by Алексей Щукин on 09.07.2023.
//

import Foundation
import SwiftyJSON

class MainViewModel {
// MARK: - Properties
    var currentWorks = [Work]()
    
// MARK: - Private Properties
    private var works = [Work]()
    private let jsonService = JsonService()
    private let realmService = RealmService()

// MARK: - INIT
    init() {
        addJsonData()
        addRealmData()
    }
}

// MARK: - View Model Functions
extension MainViewModel {
    func getCurrentWorks(date: Date, complition: @escaping () -> Void) {
        currentWorks = []
        var dateComponent = DateComponents()
        var dateComponentNext = DateComponents()
        var formattedDay = Date()
        var formattedDayNext = Date()
        for datePlus in 0..<24 {
            dateComponent.hour = datePlus
            dateComponentNext.hour = datePlus + 1
            formattedDay = Calendar.current.date(byAdding: dateComponent, to: date)!
            formattedDayNext = Calendar.current.date(byAdding: dateComponentNext, to: date)!
            for work in self.works {
                if work.dateStart <= formattedDay && work.dateFinish >= formattedDayNext {
                    let result = Work(dateStart: formattedDay, dateFinish: formattedDayNext, name: work.name, description: work.description)
                    currentWorks.append(result)
                } else if work.dateFinish >= formattedDay && work.dateFinish <= formattedDayNext {
                    let result = Work(dateStart: formattedDay, dateFinish: formattedDayNext, name: work.name, description: work.description)
                    currentWorks.append(result)
                }
            }
        }
        complition()
    }
    
    private func addRealmData() {
        realmService.getAllWork { result in
            for work in result {
                let workResult = Work(dateStart: work.dateStart, dateFinish: work.dateFinish, name: work.name, description: work.workDescription)
                self.works.append(workResult)
            }
        }
    }
    
    private func addJsonData() {
        jsonService.getWorks { result in
            self.works = result
        }
    }
}
