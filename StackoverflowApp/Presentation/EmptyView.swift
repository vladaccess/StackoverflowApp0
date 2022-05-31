//
//  EmptyView.swift
//  StackoverflowApp
//
//  Created by Краснокутский Владислав on 30.05.2022.
//

import UIKit

final class EmptyView: UIView {
	
	var text: String? = "Список вопросов пуст" {
		didSet {
			updateUI()
		}
	}
	
	private let textLabel = UILabel()
	
	init() {
		super.init(frame: .zero)
		setupUI()
		updateUI()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		setupUI()
		updateUI()
	}
}

private extension EmptyView {
	func setupUI() {
		backgroundColor = .white
		
		addSubview(textLabel)
		textLabel.textColor = .black
		textLabel.numberOfLines = 0
		textLabel.textAlignment = .center
		textLabel.font = .boldSystemFont(ofSize: 24)
		textLabel.leadingToSuperview()
		textLabel.trailingToSuperview()
		textLabel.centerYToSuperview()
	}
	
	func updateUI() {
		textLabel.text = text
	}
}
