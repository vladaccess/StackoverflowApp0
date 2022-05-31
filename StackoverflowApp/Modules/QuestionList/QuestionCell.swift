//
//  QuestionCell.swift
//  StackoverflowApp
//
//  Created by Краснокутский Владислав on 31.05.2022.
//

import UIKit

final class QuestionCell: UITableViewCell {
	
	var question: QuestionCell.PresentationModel? {
		didSet {
			updateView()
		}
	}
	
	private let nicknameLabel = UILabel()
	private let titleLabel = UILabel()
	private let userImageView = UIImageView()
	private let creationDateLabel = UILabel()
	private let answersLabel = UILabel()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupView()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		setupView()
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
		userImageView.image = nil
	}
}

extension QuestionCell {
	struct PresentationModel {
		let questionTitle: String
		let userImageURL: URL?
		let username: String
		let creationDate: String
		let answers: String
	}
}

private extension QuestionCell {
	func setupView() {
		addSubview(answersLabel)
		answersLabel.font = .systemFont(ofSize: 12)
		answersLabel.leadingToSuperview()
		answersLabel.centerYToSuperview()
		answersLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
		
		addSubview(titleLabel)
		titleLabel.numberOfLines = 1
		titleLabel.font = .boldSystemFont(ofSize: 14)
		titleLabel.leadingToSuperview(answersLabel.trailingAnchor, offset: 8)
		titleLabel.trailingToSuperview()
		titleLabel.topToSuperview()
		
		addSubview(creationDateLabel)
		creationDateLabel.font = .systemFont(ofSize: 12)
		creationDateLabel.trailingToSuperview()
		creationDateLabel.topToSuperview(titleLabel.bottomAnchor, offset: 8)
		
		addSubview(nicknameLabel)
		nicknameLabel.font = .boldSystemFont(ofSize: 12)
		nicknameLabel.topToSuperview(titleLabel.bottomAnchor, offset: 8)
		nicknameLabel.trailingToSuperview(creationDateLabel.leadingAnchor, offset: -8)
		
		addSubview(userImageView)
		userImageView.backgroundColor = .lightGray
		userImageView.widthAnchor.constraint(equalToConstant: 18).isActive = true
		userImageView.heightAnchor.constraint(equalToConstant: 18).isActive = true
		userImageView.trailingToSuperview(nicknameLabel.leadingAnchor, offset: -8)
		userImageView.centerYToSuperview(nicknameLabel.centerYAnchor)
	}
	
	func updateView() {
		guard let question = question else { return }

		answersLabel.text = question.answers
		titleLabel.text = question.questionTitle
		creationDateLabel.text = question.creationDate
		nicknameLabel.text = question.username
		userImageView.setImage(question.userImageURL)
	}
}

extension UIImageView {
	func setImage(_ url: URL?) {
		guard let url = url else { return }
		
		ImageChache.publicCache.loadImage(url) { image in
			self.image = image
		}
	}
}
