//
//  MainMenuInteractor.swift
//  StackoverflowApp
//
//  Created by Краснокутский Владислав on 30.05.2022.
//

import Foundation

final class MainMenuInteractor {
	
	private let transition: Transition
	
	init(transition: Transition) {
		self.transition = transition
	}
}

extension MainMenuInteractor: Interactable {
	func start() {
		transition.perform()
	}
}
