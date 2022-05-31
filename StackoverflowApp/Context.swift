//
//  Context.swift
//  StackoverflowApp
//
//  Created by Краснокутский Владислав on 30.05.2022.
//

import Foundation
import UIKit

class Context {
	
	let navigationController: UINavigationController
	
	let questionsService: QuestionsService
	
	init(navigationController: UINavigationController,
		 questionsService: QuestionsService) {
		self.navigationController = navigationController
		self.questionsService = questionsService
	}
}
