//
//  QuestionsWebService.swift
//  StackoverflowApp
//
//  Created by Краснокутский Владислав on 30.05.2022.
//

import Foundation

protocol QuestionsService {
	func fetchQuestionList(for searchText: String, completion: @escaping ([Question]?) -> Void)
}

final class QuestionsWebService: QuestionsService {
	
	private let dataFetcher: DataFetcher
	private let baseURL = "https://api.stackexchange.com/2.2/search"
	
	init(dataFetcher: DataFetcher) {
		self.dataFetcher = dataFetcher
	}
	
	func fetchQuestionList(for searchText: String,
						   completion: @escaping ([Question]?) -> Void) {
		dataFetcher.fetchGenericJSONData(
			urlString: baseURL,
			queryItems: [URLQueryItem(name: "order", value: "desc"),
						 URLQueryItem(name: "sort", value: "activity"),
						 URLQueryItem(name: "site", value: "stackoverflow"),
						 URLQueryItem(name: "intitle", value: searchText)],
			response: { (response: Optional<QuestionsContainer>) in
				completion(response?.items)
			}
		)
	}
}

private extension QuestionsWebService {
	struct QuestionsContainer: Decodable {
		let items: [Question]
	}
}
