//
//  Networking.swift
//  StackoverflowApp
//
//  Created by Краснокутский Владислав on 31.05.2022.
//

import Foundation

protocol Networking {
	func request(
		urlString: String,
		queryItems: [URLQueryItem]?,
		completion: @escaping (Data?, Error?) -> Void
	)
}
