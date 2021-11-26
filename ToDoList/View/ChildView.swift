//
//  MainView.swift
//  ToDoList
//
//  Created by Magic Jammie on 11/25/21.
//  Copyright © 2021 Magic Jammie. All rights reserved.
//

import UIKit

class ChildView: UIView {
	
	weak var delegate: ChildControllerDelegate?
	
	private lazy var mainTitle: UILabel = {
		let label = UILabel()
		label.text = "Add a new task"
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
	
	private lazy var saveButton: UIButton = {
		let button = UIButton()
		button.backgroundColor = .systemPurple
		button.setTitle("Save", for: .normal)
		button.layer.cornerRadius = 20
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
	}
	
	private func createMainTextField() {
		self.setupConstraints(label: mainTextField, topAnchor: mainTitle.bottomAnchor, botAnchor: nil, leftAnchor: self.leadingAnchor, rightAnchor: self.trailingAnchor, topConst: 16, botConst: nil, leadingConst: 16, trailingConst: -16, heightConst: 50, widthConst: nil)
	}
	
	private func createSaveButton() {
		self.setupConstraints(label: saveButton, topAnchor: mainTextField.bottomAnchor, botAnchor: nil, leftAnchor: self.leadingAnchor, rightAnchor: self.trailingAnchor, topConst: 16, botConst: nil, leadingConst: 16, trailingConst: -16, heightConst: 50, widthConst: nil)
	}
	
	@objc func didTapSave() {
		guard let text = mainTextField.text, !text.isEmpty else {
			return
		}
		delegate?.saveButtonDidTap(taskName: text)
	}
}
