//
//  WorkViewController.swift
//  Calendar_App
//
//  Created by Алексей Щукин on 10.07.2023.
//

import UIKit

class WorkViewController: UIViewController {

// MARK: - Private Properties
    private let workView: WorkView
    
// MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        workViewConstraints()
        viewConfiguration()
    }

// MARK: - INIT
    init(work: Work) {
        self.workView = WorkView(work: work)
        super.init(nibName: nil, bundle: nil)
        navigationItem.title = work.name
    }
    
// MARK: - Required Init
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Constraints
extension WorkViewController {
    private func workViewConstraints() {
        view.addSubview(workView)
        workView.translatesAutoresizingMaskIntoConstraints = false
        workView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        workView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        workView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        workView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    }
}

// MARK: - View Configuration
extension WorkViewController {
    private func viewConfiguration() {
        view.backgroundColor = UIColor(named: "BackgroundColor")
    }
}
