//
//  CustomTableViewCell.swift
//  ToDoList
//
//  Created by Magic Jammie on 11/26/21.
//  Copyright © 2021 Magic Jammie. All rights reserved.
//

import UIKit

final class CustomTableViewCell: UITableViewCell {
	
	private lazy var mainLabel: UILabel = {
		let label = UILabel()
		return label
	}()
	
	private let completeButton = UIButton()
	
	private lazy var priorityColor: UILabel = {
		let label = UILabel()
		label.backgroundColor = .systemOrange
		label.layer.cornerRadius = 5
		label.layer.masksToBounds = true
		return label
	}()
	
	private let myTextLable: UILabel = {
		let label = UILabel()
		label.lineBreakMode = NSLineBreakMode.byWordWrapping
		label.numberOfLines = 0
		return label
	}()
	
	init(id: String, text: String) {
		super.init(style: .default, reuseIdentifier: nil)
		addLabel()
		addFirstButton()
		addPriorityColor()
		addTextLabel(text: text)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func addLabel() {
		self.setupConstraints(label: mainLabel, topAnchor: self.topAnchor, botAnchor: self.bottomAnchor, leftAnchor: self.leadingAnchor, rightAnchor: self.trailingAnchor, topConst: 0, botConst: 0, leadingConst: 16, trailingConst: -16, heightConst: nil, widthConst: nil)
	}

	private func addFirstButton() {
		let constY = NSLayoutConstraint(item: completeButton, attribute: .centerY, relatedBy: .equal, toItem: mainLabel, attribute: .centerY, multiplier: 1.0, constant: 1)
		self.setupConstraints(label: completeButton, topAnchor: nil, botAnchor: nil, leftAnchor: mainLabel.leadingAnchor, rightAnchor: nil, topConst: nil, botConst: nil, leadingConst: 8, trailingConst: nil, heightConst: 24, widthConst: 24)
		NSLayoutConstraint.activate([constY])
	}
	
	private func addPriorityColor() {
		let constY = NSLayoutConstraint(item: priorityColor, attribute: .centerY, relatedBy: .equal, toItem: mainLabel, attribute: .centerY, multiplier: 1.0, constant: 1)
		mainLabel.setupConstraints(label: priorityColor, topAnchor: nil, botAnchor: nil, leftAnchor: nil, rightAnchor: mainLabel.trailingAnchor, topConst: nil, botConst: nil, leadingConst: nil, trailingConst: -4, heightConst: 10, widthConst: 10)
		NSLayoutConstraint.activate([constY])
	}
	
	private func addTextLabel(text: String) {
		myTextLable.text = text
		mainLabel.setupConstraints(label: myTextLable, topAnchor: mainLabel.topAnchor, botAnchor: mainLabel.bottomAnchor, leftAnchor: completeButton.trailingAnchor, rightAnchor: priorityColor.leadingAnchor, topConst: 8, botConst: -8, leadingConst: 8, trailingConst: -4, heightConst: nil, widthConst: nil)
	}
	
	func changeCompleteButton(tag: Int) {
		completeButton.tag = tag
	}
	
	func addTargetCompleteButton(target: Any, action: Selector) {
		completeButton.addTarget(target, action: action, for: .touchUpInside)
	}
	
	func setTitleCompleteButton(title: String) {
		completeButton.setTitle(title, for: .normal)
	}
	
	func setImageCompleteButton(image: UIImage) {
		completeButton.setImage(image, for: .normal)
	}
	
	func setSelectedCompleteButton(isSelected: Bool) {
		completeButton.isSelected = isSelected
	}
}
