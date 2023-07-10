//
//  MainNavigationController.swift
//  Calendar_App
//
//  Created by Алексей Щукин on 10.07.2023.
//

import UIKit

class MainNavigationController: UINavigationController {
// MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navBarCustomization()
    }
}

// MARK: - NavBar Cofiguration
extension MainNavigationController {
    private func navBarCustomization() {
        navigationBar.tintColor = UIColor(named: "ReverseTintColor")
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "ReverseTintColor")!]
    }
}
