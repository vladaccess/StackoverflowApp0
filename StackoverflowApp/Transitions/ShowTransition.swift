//
//  ShowTransition.swift
//  StackoverflowApp
//
//  Created by Краснокутский Владислав on 30.05.2022.
//

import Foundation
import UIKit

final class ShowTransition {
	
	private let navigationController: UINavigationController
	private let presentedController: UIViewController
	
	init(navigationController: UINavigationController,
		 presentedController: UIViewController) {
		self.navigationController = navigationController
		self.presentedController = presentedController
	}
}

extension ShowTransition: Transition {
	func perform() {
		navigationController.show(presentedController, sender: nil)
	}
}
