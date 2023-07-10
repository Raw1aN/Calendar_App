//
//  MainCollectionViewCell.swift
//  Calendar_App
//
//  Created by Алексей Щукин on 10.07.2023.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
// MARK: - Private Properties
    private let nameLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        title.numberOfLines = 0
        title.textColor = UIColor(named: "ReverseTintColor")
        return title
    }()
    
    private let timeFinishLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        title.numberOfLines = 0
        title.textColor = UIColor(named: "ReverseTintColor")
        return title
    }()
    
    private let timeStartLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        title.numberOfLines = 0
        title.textColor = UIColor(named: "ReverseTintColor")
        return title
    }()
    
// MARK: - INIT
    override init(frame: CGRect) {
        super.init(frame: .zero)
        initialization()
    }
    
// MARK: - Required Init
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Initialization
extension MainCollectionViewCell {
    private func initialization() {
        contentView.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        contentView.addSubview(timeStartLabel)
        timeStartLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        timeStartLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        contentView.addSubview(timeFinishLabel)
        timeFinishLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        timeFinishLabel.leadingAnchor.constraint(equalTo: timeStartLabel.trailingAnchor, constant: 0).isActive = true
        self.layer.cornerRadius = 20
        self.backgroundColor = UIColor(named: "CreamColor")
    }
}

// MARK: - Cell Customization
extension MainCollectionViewCell {
    func custom(work: Work) {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH"
        let dateFinish = formatter.string(from: work.dateFinish)
        let dateStart = formatter.string(from: work.dateStart)
        nameLabel.text = work.name
        timeFinishLabel.text = "- \(dateFinish) "
        timeStartLabel.text = "\(dateStart) "
    }
}
