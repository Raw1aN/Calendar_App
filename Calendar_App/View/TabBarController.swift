//
//  TabBarController.swift
//  Calendar_App
//
//  Created by Алексей Щукин on 10.07.2023.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarConfiguration()
    }
}

extension TabBarController {
// MARK: - Tab Bar Configuration
    private func tabBarConfiguration() {
        viewControllers = [generateVC(viewController: MainNavigationController(rootViewController: MainViewController()),
                                      title: "Главная", image: UIImage(named: "MainIcon")),
                           generateVC(viewController: AddViewController(),
                                      title: "Добавить", image: UIImage(named: "AddIcon"))]
        tabBar.barTintColor = .white
        tabBar.tintColor = UIColor(named: "blue")
    }

// MARK: - Generate VC for Tab Bar
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
}
