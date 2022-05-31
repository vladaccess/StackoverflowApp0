//
//  QuestionListInteractorFactory.swift
//  StackoverflowApp
//
//  Created by Краснокутский Владислав on 30.05.2022.
//

import Foundation
import UIKit

final class QuestionListInteractorFactory {
	
	private let context: Context
	
	init(context: Context) {
		self.context = context
	}
	
	func createQuestionListInteractor() -> QuestionListInteractor {
		let questionListViewController = QuestionListViewController()
		
		let showTransition = ShowTransition(navigationController: context.navigationController,
											presentedController: questionListViewController)
		
		let questionListInteractor = QuestionListInteractor(presentation: questionListViewController,
															transition: showTransition,
															questionsService: context.questionsService)
		
		questionListViewController.delegate = questionListInteractor
		
		return questionListInteractor
	}
}
