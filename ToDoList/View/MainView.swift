//
//  MainView.swift
//  ToDoList
//
//  Created by Magic Jammie on 11/25/21.
//  Copyright © 2021 Magic Jammie. All rights reserved.
//

import UIKit

class MainView: UIView {
	
	weak var delegate: MainDelegate?
		
	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = .systemGray
	
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
	}
}
