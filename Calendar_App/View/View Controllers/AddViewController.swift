//
//  AddViewController.swift
//  Calendar_App
//
//  Created by Алексей Щукин on 10.07.2023.
//

import UIKit

class AddViewController: UIViewController {
    
// MARK: - Private Properties
    private let viewModel = AddViewModel()
    
    private let dialog = UIAlertController(title: "Сongratulations", message: "You added a work", preferredStyle: .alert)
    
    private let okAction = UIAlertAction(title: "OK", style: .default, handler: {(_: UIAlertAction!) -> Void in})
    
    private let wrongDialog = UIAlertController(title: "Wait", message: "You have not filled in all the fields", preferredStyle: .alert)
    
    private let startDateLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        title.numberOfLines = 0
        title.textColor = UIColor(named: "ReverseTintColor")
        title.text = "Введите время начала напоминания"
        return title
    }()
    
    private let finishDateLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        title.numberOfLines = 0
        title.textColor = UIColor(named: "ReverseTintColor")
        title.text = "Введите время конца напоминания"
        return title
    }()
    
    private let nameLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        title.numberOfLines = 0
        title.textColor = UIColor(named: "ReverseTintColor")
        title.text = "Введите название"
        return title
    }()
    
    private let descriptionLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        title.numberOfLines = 0
        title.textColor = UIColor(named: "ReverseTintColor")
        title.text = "Введите описание"
        return title
    }()
    
    private let descriptionTextField: UITextView = {
        let textField = UITextView()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor(named: "CreamColor")
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return textField
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor(named: "CreamColor")
        return textField
    }()
    
    private let startDateTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor(named: "CreamColor")
        return textField
    }()
    
    private let finishDateTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor(named: "CreamColor")
        return textField
    }()
    
    private let dateStartPicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.preferredDatePickerStyle = .wheels
        return datePicker
    }()
    
    private let dateFinishPicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.preferredDatePickerStyle = .wheels
        return datePicker
    }()
    
    private let startDoneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneStartPressed))
    
    private let finishDoneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneFinishPressed))
    
    private let finishToolBar: UIToolbar = {
        let toolBar = UIToolbar()
        toolBar.translatesAutoresizingMaskIntoConstraints = false
        toolBar.sizeToFit()
        return toolBar
    }()
    
    private let startToolBar: UIToolbar = {
        let toolBar = UIToolbar()
        toolBar.translatesAutoresizingMaskIntoConstraints = false
        toolBar.sizeToFit()
        return toolBar
    }()
    
    lazy private var addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Добавить", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(named: "CreamColor")
        button.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        return button
    }()

// MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewConfiguration()
        createStartDatePicker()
        constraints()
        createFinishDatePicker()
    }

}

// MARK: - View Configuration
extension AddViewController {
    private func viewConfiguration() {
        view.backgroundColor = UIColor(named: "BackgroundColor")
        dialog.addAction(okAction)
        wrongDialog.addAction(okAction)
    }
}

// MARK: - Creation Date Pickers
extension AddViewController {
    private func createStartDatePicker() {
        finishToolBar.setItems([startDoneButton], animated: true)
        startDateTextField.inputAccessoryView = finishToolBar
        startDateTextField.inputView = dateStartPicker
    }
    
    private func createFinishDatePicker() {
        startToolBar.setItems([finishDoneButton], animated: true)
        finishDateTextField.inputAccessoryView = startToolBar
        finishDateTextField.inputView = dateFinishPicker
    }
}

// MARK: - Constraints
extension AddViewController {
    private func constraints() {
        view.addSubview(startDateLabel)
        startDateLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        startDateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        view.addSubview(startDateTextField)
        startDateTextField.topAnchor.constraint(equalTo: startDateLabel.bottomAnchor, constant: 10).isActive = true
        startDateTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        startDateTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        startDateTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        view.addSubview(finishDateLabel)
        finishDateLabel.topAnchor.constraint(equalTo: startDateTextField.bottomAnchor, constant: 10).isActive = true
        finishDateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        view.addSubview(finishDateTextField)
        finishDateTextField.topAnchor.constraint(equalTo: finishDateLabel.bottomAnchor, constant: 10).isActive = true
        finishDateTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        finishDateTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        finishDateTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        view.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: finishDateTextField.bottomAnchor, constant: 10).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        view.addSubview(nameTextField)
        nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        view.addSubview(descriptionLabel)
        descriptionLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        view.addSubview(addButton)
        addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        view.addSubview(descriptionTextField)
        descriptionTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10).isActive = true
        descriptionTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        descriptionTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        descriptionTextField.bottomAnchor.constraint(equalTo: addButton.topAnchor, constant: -10).isActive = true
    }
}

// MARK: - Selector Methods
extension AddViewController {
    @objc func doneStartPressed() {
        startDateTextField.text = "\(dateStartPicker.date)"
        self.view.endEditing(true)
    }
    
    @objc func doneFinishPressed() {
        finishDateTextField.text = "\(dateFinishPicker.date)"
        self.view.endEditing(true)
    }
    
    @objc func addButtonTapped() {
        let work = WorkRealm()
        if descriptionTextField.text.isEmpty ||
            startDateTextField.text == nil ||
            finishDateTextField.text == nil ||
            nameTextField.text == nil {
            self.present(wrongDialog, animated: true)
            return
        }
        guard let name = nameTextField.text else { return }
        work.workDescription = descriptionTextField.text
        work.name = name
        work.dateStart = dateStartPicker.date
        work.dateFinish = dateFinishPicker.date
        viewModel.addWorkRealm(work: work)
        descriptionTextField.text = ""
        nameTextField.text = ""
        dateStartPicker.date = Date()
        dateFinishPicker.date = Date()
        startDateTextField.text = ""
        finishDateTextField.text = ""
        self.present(dialog, animated: true)
    }
}
