//
//  AppCoordinator.swift
//  StackoverflowApp
//
//  Created by Краснокутский Владислав on 30.05.2022.
//

import Foundation
import UIKit

final class AppCoordinator {
	
	private let mainInteractorFactory: MainMenuInteractorFactory
	private var mainInteraction: Interactable?
	
	private let questionListInteractorFactory: QuestionListInteractorFactory
	private var questionListInteraction: Interactable?
	
	init(questionListInteractorFactory: QuestionListInteractorFactory,
		 mainInteractorFactory: MainMenuInteractorFactory) {
		self.questionListInteractorFactory = questionListInteractorFactory
		self.mainInteractorFactory = mainInteractorFactory
	}
}

extension AppCoordinator: Interactable {
	func start() {
		mainInteraction = mainInteractorFactory.createMainMenuInteractor()
		mainInteraction?.start()
		
		questionListInteraction = questionListInteractorFactory.createQuestionListInteractor()
		questionListInteraction?.start()
	}
}
