//
//  WindowTransition.swift
//  StackoverflowApp
//
//  Created by Краснокутский Владислав on 30.05.2022.
//

import Foundation
import UIKit

final class WindowTransition {
	
	private let window: UIWindow
	private let presentedViewController: UIViewController
	
	init(window: UIWindow,
		 presentedViewController: UIViewController) {
		self.window = window
		self.presentedViewController = presentedViewController
	}
}

extension WindowTransition: Transition {
	func perform() {
		window.rootViewController = presentedViewController
		window.makeKeyAndVisible()
	}
}
