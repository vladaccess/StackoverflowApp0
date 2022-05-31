//
//  QuestionListInteractor.swift
//  StackoverflowApp
//
//  Created by Краснокутский Владислав on 30.05.2022.
//

import Foundation

final class QuestionListInteractor {
	
	private let presentation: QuestionListPresentation
	private let transition: Transition
	private let questionsService: QuestionsService
	private let creationDateFormatter: DateFormatter = {
		let formatter = DateFormatter()
		formatter.dateFormat = "dd.MM.yyyy, HH:mm"
		formatter.locale = Locale(identifier: "ru_RU")
		
		return formatter
	}()
	
	private var questionList: [Question] = []
	
	init(presentation: QuestionListPresentation,
		 transition: Transition,
		 questionsService: QuestionsService) {
		self.presentation = presentation
		self.transition = transition
		self.questionsService = questionsService
	}
}

extension QuestionListInteractor: Interactable {
	func start() {
		transition.perform()
	}
}

extension QuestionListInteractor: QuestionListPresentationDelegate {
	func onViewDidLoad() {
		presentation.displayView(with: .init(shouldDisplayEmptyView: true,
											 questionList: []))
	}
	
	func onDidEnter(_ searchText: String) {
		if searchText.isEmpty {
			presentation.displayView(with: .init(shouldDisplayEmptyView: true,
												 questionList: []))
		} else {
			questionsService.fetchQuestionList(for: searchText) { [weak self] questionList in
				self?.onDidFetch(questionList)
			}
		}
	}
}

private extension QuestionListInteractor {
	func makeQuestionPresentationModel(from question: Question) -> QuestionCell.PresentationModel {
		return .init(questionTitle: question.title,
					 userImageURL: question.owner.profileImage,
					 username: question.owner.displayName,
					 creationDate: creationDateFormatter.string(from: question.creationDate),
					 answers: "\(question.answerCount) answers")
	}
	
	func onDidFetch(_ questionList: [Question]?) {
		self.questionList = questionList ?? []
		
		presentation.displayView(with: .init(shouldDisplayEmptyView: self.questionList.isEmpty,
											 questionList: self.questionList.map{ makeQuestionPresentationModel(from: $0) }))
	}
}
