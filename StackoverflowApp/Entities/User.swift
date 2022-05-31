//
//  User.swift
//  StackoverflowApp
//
//  Created by Краснокутский Владислав on 30.05.2022.
//

import Foundation

struct User: Decodable {
	let displayName: String
	let profileImage: URL?
}
