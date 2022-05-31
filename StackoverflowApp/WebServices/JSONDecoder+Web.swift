//
//  WebJSONDecoder.swift
//  StackoverflowApp
//
//  Created by Краснокутский Владислав on 31.05.2022.
//

import Foundation

extension JSONDecoder {
	static var webDecoder: JSONDecoder {
		let decoder = JSONDecoder()
		decoder.dateDecodingStrategy = .secondsSince1970
		decoder.keyDecodingStrategy = .convertFromSnakeCase
		
		return decoder
	}
}
