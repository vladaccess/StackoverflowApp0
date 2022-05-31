//
//  NetworkDataFetcher.swift
//  StackoverflowApp
//
//  Created by Краснокутский Владислав on 01.06.2022.
//

import Foundation

final class NetworkDataFetcher: DataFetcher {
	
	private let networking: Networking
	private let decoder: JSONDecoder
	
	init(networking: Networking,
		 decoder: JSONDecoder) {
		self.networking = networking
		self.decoder = decoder
	}
	
	func fetchGenericJSONData<T>(
		urlString: String,
		queryItems: [URLQueryItem]?,
		response: @escaping (T?) -> Void
	) where T : Decodable {
		networking.request(urlString: urlString,
						   queryItems: queryItems) { [weak self] data, error in
			guard let data = data else {
				response(nil)
				
				return
			}
			
			guard let decodedData = try? self?.decoder.decode(T.self, from: data) else {
				response(nil)
				
				return
			}
			
			response(decodedData)
		}
	}
}
