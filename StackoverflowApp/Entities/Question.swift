//
//  Question.swift
//  StackoverflowApp
//
//  Created by Краснокутский Владислав on 30.05.2022.
//

import Foundation

struct Question: Decodable {
	let title: String
	let owner: User
	let creationDate: Date
	let answerCount: UInt
}
