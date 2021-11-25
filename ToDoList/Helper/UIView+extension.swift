//
//  UIView+extension.swift
//  ToDoList
//
//  Created by Magic Jammie on 11/25/21.
//  Copyright © 2021 Magic Jammie. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
	func setupConstraints(
		label: UIView,
		topAnchor: NSLayoutYAxisAnchor?,
		botAnchor: NSLayoutYAxisAnchor?,
		leftAnchor: NSLayoutXAxisAnchor?,
		rightAnchor: NSLayoutXAxisAnchor?,
		topConst: CGFloat?,
		botConst: CGFloat?,
		leadingConst: CGFloat?,
		trailingConst: CGFloat?,
		heightConst: CGFloat?,
		widthConst: CGFloat?
	) {
		label.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(label)
		
		if topConst != nil {
			label.topAnchor.constraint(equalTo: topAnchor!, constant: topConst!).isActive = true
		}
		if botConst != nil {
			label.bottomAnchor.constraint(equalTo: botAnchor!, constant: botConst!).isActive = true
		}
		if leadingConst != nil {
			label.leadingAnchor.constraint(equalTo: leftAnchor!, constant: leadingConst!).isActive = true
		}
		if trailingConst != nil {
			label.trailingAnchor.constraint(equalTo: rightAnchor!, constant: trailingConst!).isActive = true
		}
		if widthConst != nil {
			label.widthAnchor.constraint(equalToConstant: widthConst!).isActive = true
		}
		if heightConst != nil {
			label.heightAnchor.constraint(equalToConstant: heightConst!).isActive = true
		}
	}
}
