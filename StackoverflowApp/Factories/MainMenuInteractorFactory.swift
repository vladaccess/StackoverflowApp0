//
//  MainMenuInteractorFactory.swift
//  StackoverflowApp
//
//  Created by Краснокутский Владислав on 30.05.2022.
//

import Foundation
import UIKit

final class MainMenuInteractorFactory {
	
	private let context: Context
	private let window: UIWindow
	
	init(context: Context,
		 window: UIWindow) {
		self.context = context
		self.window = window
	}
	
	func createMainMenuInteractor() -> MainMenuInteractor {
		let windowTransition = WindowTransition(window: window,
												presentedViewController: context.navigationController)
		return MainMenuInteractor(transition: windowTransition)
	}
}
