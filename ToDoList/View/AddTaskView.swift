//
//  MainView.swift
//  ToDoList
//
//  Created by Magic Jammie on 11/25/21.
//  Copyright © 2021 Magic Jammie. All rights reserved.
//

import UIKit

class AddTaskView: UIView {
	
	weak var delegate: AddTaskControllerDelegate?
	
	private lazy var mainTitle: UILabel = {
		let label = UILabel()
		label.text = "Add a new task"
		let fontSize = label.font.pointSize
		label.font = UIFont(name: "appetite-italic", size: 24)
		return label
	}()
	
	private lazy var closeButton: UIButton = {
		let button = UIButton()
		button.backgroundColor = .systemPurple
		button.setTitle("X", for: .normal)
		button.layer.cornerRadius = 20
		button.setTitleColor(.white, for: .normal)
		button.addTarget(self, action: #selector(didTapClose), for: .touchUpInside)
		return button
	}()
	
	private lazy var mainTextField: UITextField = {
		let textField = UITextField()
		textField.backgroundColor = .systemGray4
		textField.layer.cornerRadius = 10
		return textField
	}()
	
	private lazy var priorityTitle: UILabel = {
		let label = UILabel()
		label.text = "Priority"
		let fontSize = label.font.pointSize
		label.font = UIFont(name: "appetite-italic", size: fontSize)
		return label
	}()
	
	private lazy var highPriorityButton: UIButton = {
		let button = UIButton()
		button.backgroundColor = .systemGray4
		button.setTitle("High", for: .normal)
		button.layer.cornerRadius = 10
		button.addTarget(self, action: #selector(highPriorityButtonTap), for: .touchUpInside)
		return button
	}()
	
	private lazy var normalPriorityButton: UIButton = {
		let button = UIButton()
		button.backgroundColor = .systemOrange
		button.setTitle("Normal", for: .normal)
		button.layer.cornerRadius = 10
		button.addTarget(self, action: #selector(normalPriorityButtonTap), for: .touchUpInside)
		return button
	}()
	
	private lazy var lowPriorityButton: UIButton = {
		let button = UIButton()
		button.backgroundColor = .systemGray4
		button.setTitle("Low", for: .normal)
		button.layer.cornerRadius = 10
		button.addTarget(self, action: #selector(lowPriorityButtonTap), for: .touchUpInside)
		return button
	}()
	
	private lazy var saveButton: UIButton = {
		let button = UIButton()
		button.backgroundColor = .systemPurple
		button.setTitle("Save", for: .normal)
		button.layer.cornerRadius = 10
		button.addTarget(self, action: #selector(didTapSave), for: .touchUpInside)
		return button
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = .white
		self.layer.cornerRadius = 24
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		createMainTitle()
		createCloseButton()
		createMainTextField()
		createPriorityTitle()
		creatHighPriorityButton()
		createNormalPriorityButton()
		createLowPriorityButton()
		createSaveButton()
	}
	
	private func createMainTitle() {
		self.setupConstraints(label: mainTitle, topAnchor: self.topAnchor, botAnchor: nil, leftAnchor: self.leadingAnchor, rightAnchor: nil, topConst: 20, botConst: nil, leadingConst: 30, trailingConst: nil, heightConst: 40, widthConst: nil)
	}
	
	private func createCloseButton() {
		self.setupConstraints(label: closeButton, topAnchor: self.topAnchor, botAnchor: nil, leftAnchor: nil, rightAnchor: self.trailingAnchor, topConst: 20, botConst: nil, leadingConst: nil, trailingConst: -30, heightConst: 40, widthConst: 40)
	}
	
	@objc private func didTapClose() {
		delegate?.closeButtonDidTap()
		closeButton.backgroundColor = UIColor(red: 231.0/255.0, green: 184.0/255.0, blue: 252.0/255.0, alpha: 1)
	}
	
	private func createMainTextField() {
		self.setupConstraints(label: mainTextField, topAnchor: mainTitle.bottomAnchor, botAnchor: nil, leftAnchor: self.leadingAnchor, rightAnchor: self.trailingAnchor, topConst: 16, botConst: nil, leadingConst: 16, trailingConst: -16, heightConst: 50, widthConst: nil)
	}
	
	private func createPriorityTitle() {
		self.setupConstraints(label: priorityTitle, topAnchor: mainTextField.bottomAnchor, botAnchor: nil, leftAnchor: self.leadingAnchor, rightAnchor: self.trailingAnchor, topConst: 8, botConst: nil, leadingConst: 30, trailingConst: -16, heightConst: 50, widthConst: nil)
	}
	
	private func creatHighPriorityButton() {
		self.setupConstraints(label: highPriorityButton, topAnchor: priorityTitle.bottomAnchor, botAnchor: nil, leftAnchor: self.leadingAnchor, rightAnchor: nil, topConst: 4, botConst: nil, leadingConst: 16, trailingConst: nil, heightConst: 40, widthConst: 80)
	}
	
	@objc func highPriorityButtonTap() {
		highPriorityButton.backgroundColor = .systemOrange
		lowPriorityButton.backgroundColor = .systemGray4
		normalPriorityButton.backgroundColor = .systemGray4
	}
	
	private func createNormalPriorityButton() {
		self.setupConstraints(label: normalPriorityButton, topAnchor: priorityTitle.bottomAnchor, botAnchor: nil, leftAnchor: highPriorityButton.trailingAnchor, rightAnchor: nil, topConst: 4, botConst: nil, leadingConst: 8, trailingConst: nil, heightConst: 40, widthConst: 100)
	}
	
	@objc private func normalPriorityButtonTap() {
		highPriorityButton.backgroundColor = .systemGray4
		lowPriorityButton.backgroundColor = .systemGray4
		normalPriorityButton.backgroundColor = .systemOrange
	}
	
	private func createLowPriorityButton() {
		self.setupConstraints(label: lowPriorityButton, topAnchor: priorityTitle.bottomAnchor, botAnchor: nil, leftAnchor: normalPriorityButton.trailingAnchor, rightAnchor: nil, topConst: 4, botConst: nil, leadingConst: 8, trailingConst: nil, heightConst: 40, widthConst: 80)
	}
	
	@objc private func lowPriorityButtonTap() {
		highPriorityButton.backgroundColor = .systemGray4
		lowPriorityButton.backgroundColor = .systemOrange
		normalPriorityButton.backgroundColor = .systemGray4
	}
	
	private func createSaveButton() {
		self.setupConstraints(label: saveButton, topAnchor: highPriorityButton.bottomAnchor, botAnchor: nil, leftAnchor: self.leadingAnchor, rightAnchor: self.trailingAnchor, topConst: 16, botConst: nil, leadingConst: 16, trailingConst: -16, heightConst: 50, widthConst: nil)
	}
	
	@objc func didTapSave() {
		guard let text = mainTextField.text, !text.isEmpty else {
			return
		}
		delegate?.saveButtonDidTap(taskName: text)
		saveButton.backgroundColor = UIColor(red: 231.0/255.0, green: 184.0/255.0, blue: 252.0/255.0, alpha: 1)
	}
}
