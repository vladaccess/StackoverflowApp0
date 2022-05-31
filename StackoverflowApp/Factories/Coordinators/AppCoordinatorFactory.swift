//
//  AppCoordinatorFactory.swift
//  StackoverflowApp
//
//  Created by Краснокутский Владислав on 30.05.2022.
//

import UIKit

final class AppCoordinatorFactory {
	
	private let context = ContextFactory().create()
	
	func createAppCoordinator(with scene: UIWindowScene) -> AppCoordinator {
		let prefferedWindow = UIWindow(windowScene: scene)
		
		let mainInteractorFactory = MainMenuInteractorFactory(context: context, window: prefferedWindow)
		
		let questionListInteractorFactory = QuestionListInteractorFactory(context: context)
		
		return AppCoordinator(questionListInteractorFactory: questionListInteractorFactory,
							  mainInteractorFactory: mainInteractorFactory)
	}
}
