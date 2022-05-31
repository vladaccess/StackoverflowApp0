//
//  NetworkService.swift
//  StackoverflowApp
//
//  Created by Краснокутский Владислав on 31.05.2022.
//

import Foundation

final class NetworkService: Networking {
	func request(
		urlString: String,
		queryItems: [URLQueryItem]?,
		completion: @escaping (Data?, Error?) -> Void
	) {
		var urlComponents = URLComponents(string: urlString)
		urlComponents?.queryItems = queryItems
		
		guard let url = urlComponents?.url else {
			completion(nil, nil)
			return
		}
		
		URLSession.shared.dataTask(with: url) { data, response, error in
			DispatchQueue.main.async {
				completion(data, error)
			}
		}.resume()
	}
}
