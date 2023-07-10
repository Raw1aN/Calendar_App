//
//  ViewController.swift
//  Calendar_App
//
//  Created by Алексей Щукин on 08.07.2023.
//

import UIKit
import FSCalendar

class MainViewController: UIViewController {

// MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        calendarConstraints()
        collectionViewConstraints()
        makeDelegates()
        configurationView()
    }
    
// MARK: - Private Properties
    private var viewModel = MainViewModel()
    
    private let calendar: FSCalendar = {
        let calendar = FSCalendar()
        calendar.translatesAutoresizingMaskIntoConstraints = false
        calendar.scrollDirection = .vertical
        calendar.scope = .week
        calendar.appearance.titleDefaultColor = UIColor(named: "ReverseTintColor")
        calendar.appearance.headerTitleColor = UIColor(named: "ReverseTintColor")
        return calendar
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = UIColor(named: "BackgroundColor")
        return collectionView
    }()
    
    private let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        return formatter
    }()
}

// MARK: - View Configuration
extension MainViewController {
    private func configurationView() {
        view.backgroundColor = UIColor(named: "BackgroundColor")
    }
}

// MARK: - Constraints
extension MainViewController {
    private func calendarConstraints() {
        view.addSubview(calendar)
        calendar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        calendar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        calendar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -50).isActive = true
        calendar.heightAnchor.constraint(equalToConstant: 300).isActive = true
    }
    
    private func collectionViewConstraints() {
        view.addSubview(collectionView)
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        collectionView.topAnchor.constraint(equalTo: calendar.bottomAnchor, constant: -190).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    }
}

// MARK: - Delegates
extension MainViewController {
    private func makeDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
        calendar.delegate = self
    }
}

// MARK: - Reload Data
extension MainViewController {
    private func reloadData() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout , UICollectionViewDataSource
extension MainViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.currentWorks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? MainCollectionViewCell
        else { return UICollectionViewCell()}
        cell.custom(work: viewModel.currentWorks[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height/8)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController = WorkViewController(work: viewModel.currentWorks[indexPath.item])
        navigationController?.pushViewController(viewController, animated: true)
    }
}

// MARK: - FSCalendarDelegate
extension MainViewController: FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        self.viewModel = MainViewModel()
        viewModel.getCurrentWorks(date: date) {
            self.reloadData()
        }
    }
}
