//
//  CustomTableViewCell.swift
//  ToDoList
//
//  Created by Magic Jammie on 11/26/21.
//  Copyright © 2021 Magic Jammie. All rights reserved.
//

import UIKit

final class CustomTableViewCell: UITableViewCell {
	
	let mainLabel = UILabel()
	let firstButton = UIButton()
	let priorityColor = UILabel()
	let myTextLable = UILabel()
	
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
		let constY = NSLayoutConstraint(item: firstButton, attribute: .centerY, relatedBy: .equal, toItem: mainLabel, attribute: .centerY, multiplier: 1.0, constant: 1)
		self.setupConstraints(label: firstButton, topAnchor: nil, botAnchor: nil, leftAnchor: mainLabel.leadingAnchor, rightAnchor: nil, topConst: nil, botConst: nil, leadingConst: 8, trailingConst: nil, heightConst: 24, widthConst: 24)
		NSLayoutConstraint.activate([constY])
		firstButton.setImage(UIImage(named: "circle"), for: .normal)
		firstButton.isSelected = false
	}
	
	private func addPriorityColor() {
		let constY = NSLayoutConstraint(item: priorityColor, attribute: .centerY, relatedBy: .equal, toItem: mainLabel, attribute: .centerY, multiplier: 1.0, constant: 1)
		mainLabel.setupConstraints(label: priorityColor, topAnchor: nil, botAnchor: nil, leftAnchor: nil, rightAnchor: mainLabel.trailingAnchor, topConst: nil, botConst: nil, leadingConst: nil, trailingConst: -4, heightConst: 10, widthConst: 10)
		NSLayoutConstraint.activate([constY])
		priorityColor.backgroundColor = .systemOrange
		priorityColor.layer.cornerRadius = 5
		priorityColor.layer.masksToBounds = true
	}
	
	private func addTextLabel(text: String) {
		myTextLable.text = text
		mainLabel.setupConstraints(label: myTextLable, topAnchor: mainLabel.topAnchor, botAnchor: mainLabel.bottomAnchor, leftAnchor: firstButton.trailingAnchor, rightAnchor: priorityColor.leadingAnchor, topConst: 8, botConst: -8, leadingConst: 8, trailingConst: -4, heightConst: nil, widthConst: nil)
		myTextLable.lineBreakMode = NSLineBreakMode.byWordWrapping
		myTextLable.numberOfLines = 0
	}
}
