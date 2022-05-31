//
//  QuestionListViewController.swift
//  StackoverflowApp
//
//  Created by Краснокутский Владислав on 30.05.2022.
//

import UIKit

protocol QuestionListPresentationDelegate: AnyObject {
	func onViewDidLoad()
	func onDidEnter(_ searchText: String)
}

protocol QuestionListPresentation: AnyObject {
	func displayView(with model: QuestionListViewController.PresentationModel)
}

final class QuestionListViewController: UIViewController {
	
	weak var delegate: QuestionListPresentationDelegate?
	
	private let emptyView = EmptyView()
	private let tableView = UITableView()
	
	private var questionList: [QuestionCell.PresentationModel] = []
	
	init() {
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupUI()
		
		delegate?.onViewDidLoad()
	}
	
	func setupUI() {
		view.backgroundColor = .white
		
		view.addSubview(emptyView)
		emptyView.leadingToSuperview()
		emptyView.trailingToSuperview()
		emptyView.topToSuperview()
		emptyView.bottomToSuperview()
		
		tableView.register(QuestionCell.self, forCellReuseIdentifier: "QuestionCell")
		tableView.dataSource = self
		view.addSubview(tableView)
		tableView.leadingToSuperview()
		tableView.trailingToSuperview()
		tableView.topToSuperview()
		tableView.bottomToSuperview()
		
		let searchBar = UISearchBar()
		searchBar.delegate = self
		navigationItem.titleView = searchBar
	}
}

extension QuestionListViewController {
	struct PresentationModel {
		let shouldDisplayEmptyView: Bool
		let questionList: [QuestionCell.PresentationModel]
	}
}

extension QuestionListViewController: UISearchBarDelegate {
	func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
		delegate?.onDidEnter(searchText)
	}
}

extension QuestionListViewController: QuestionListPresentation {
	func displayView(with model: PresentationModel) {
		questionList = model.questionList
		
		emptyView.isHidden = !model.shouldDisplayEmptyView
		
		tableView.isHidden = model.shouldDisplayEmptyView
		tableView.reloadData()
	}
}

extension QuestionListViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return questionList.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! QuestionCell
		cell.question = questionList[indexPath.row]
		
		return cell
	}
}
