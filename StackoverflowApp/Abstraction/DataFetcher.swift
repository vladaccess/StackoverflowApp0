//
//  DataFetcher.swift
//  StackoverflowApp
//
//  Created by Краснокутский Владислав on 01.06.2022.
//

import Foundation

protocol DataFetcher {
	func fetchGenericJSONData<T: Decodable>(
		urlString: String,
		queryItems: [URLQueryItem]?,
		response: @escaping (T?) -> Void)
}
