//
//  DimmPresentationController.swift
//  ToDoList
//
//  Created by Magic Jammie on 11/26/21.
//  Copyright © 2021 Magic Jammie. All rights reserved.
//

import UIKit

//MARK: - to darken the parent controller
class BlackoutController: PresentationController {
	
	private lazy var myView: UIView = {
		let view = UIView()
		view.backgroundColor = UIColor(white: 0, alpha: 0.3)
		view.alpha = 0
		return view
	}()
	
	//MARK: - adding a view to the hierarchy, setting the frame and starting the animation
	override func presentationTransitionWillBegin() {
		super.presentationTransitionWillBegin()
		containerView?.insertSubview(myView, at: 0)
		performAlongsideTransitionIfPossible { [unowned self] in
		self.myView.alpha = 1
		}
	}
	
	//MARK: - starting animation
	private func performAlongsideTransitionIfPossible(_ block: @escaping () -> Void) {
		guard let coordinator = self.presentedViewController.transitionCoordinator else {
			block()
			return
		}

		coordinator.animate(alongsideTransition: { (_) in
			block()
		}, completion: nil)
	}
	
	//MARK: - add frame
	override func containerViewDidLayoutSubviews() {
		super.containerViewDidLayoutSubviews()
		myView.frame = containerView!.frame
	}
	
	override func presentationTransitionDidEnd(_ completed: Bool) {
		super.presentationTransitionDidEnd(completed)
		if !completed {
			self.myView.removeFromSuperview()
		}
	}
	
	override func dismissalTransitionWillBegin() {
		super.dismissalTransitionWillBegin()
		performAlongsideTransitionIfPossible { [unowned self] in
			self.myView.alpha = 0
		}
	}

	override func dismissalTransitionDidEnd(_ completed: Bool) {
		super.dismissalTransitionDidEnd(completed)
		if completed {
			self.myView.removeFromSuperview()
		}
	}
}
