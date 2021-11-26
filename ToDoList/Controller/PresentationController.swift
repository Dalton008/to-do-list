//
//  PresentationController.swift
//  ToDoList
//
//  Created by Magic Jammie on 11/26/21.
//  Copyright © 2021 Magic Jammie. All rights reserved.
//

import UIKit

class PresentationController: UIPresentationController {
	
	override var frameOfPresentedViewInContainerView: CGRect {
		let bounds = containerView!.bounds
		let halfHeight = bounds.height / 2
			return CGRect(x: 0,
						  y: halfHeight,
						  width: bounds.width,
						  height: halfHeight)
	}
	
	override func presentationTransitionWillBegin() {
		super.presentationTransitionWillBegin()
		containerView?.addSubview(presentedView!)
	}
	
	override func containerViewDidLayoutSubviews() {
		super.containerViewDidLayoutSubviews()
		presentedView?.frame = frameOfPresentedViewInContainerView
	}
}
