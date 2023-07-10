//
//  WorkView.swift
//  Calendar_App
//
//  Created by Алексей Щукин on 10.07.2023.
//

import UIKit

class WorkView: UIView {
    
// MARK: - INIT
    init(work: Work) {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH"
        let dateStart = formatter.string(from: work.dateStart)
        let dateFinish = formatter.string(from: work.dateFinish)
        super.init(frame: .zero)
        nameLabel.text = work.name
        timeStartLabel.text = "Time:  \(dateStart) - "
        timeFinishLabel.text = dateFinish
        descriptionLabel.text = work.description
        initialize()
    }
    
// MARK: - Required INIT
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

// MARK: - Private Properties
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textColor = UIColor(named: "ReverseTintColor")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let timeStartLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textColor = UIColor(named: "ReverseTintColor")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let timeFinishLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textColor = UIColor(named: "ReverseTintColor")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textColor = UIColor(named: "ReverseTintColor")
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 24
        return label
    }()
}

// MARK: - initialize
extension WorkView {
    private func initialize() {
        self.layer.cornerRadius = 30
        self.backgroundColor = UIColor(named: "CreamColor")
        addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        addSubview(timeStartLabel)
        timeStartLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        timeStartLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        addSubview(timeFinishLabel)
        timeFinishLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        timeFinishLabel.leadingAnchor.constraint(equalTo: timeStartLabel.trailingAnchor, constant: 0).isActive = true
        addSubview(descriptionLabel)
        descriptionLabel.topAnchor.constraint(equalTo: timeStartLabel.bottomAnchor, constant: 10).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
    }
}
