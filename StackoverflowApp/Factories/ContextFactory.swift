//
//  ContextFactory.swift
//  StackoverflowApp
//
//  Created by Краснокутский Владислав on 01.06.2022.
//

import UIKit

final class ContextFactory {
	
	lazy var navigationController = UINavigationController()
	
	lazy var networkService = NetworkService()
	
	lazy var networkDataFetcher = NetworkDataFetcher(networking: networkService,
													 decoder: .webDecoder)
	
	lazy var questionsWebService = QuestionsWebService(dataFetcher: networkDataFetcher)
	
	func create() -> Context {
		return Context(navigationController: navigationController,
					   questionsService: questionsWebService)
	}
}
