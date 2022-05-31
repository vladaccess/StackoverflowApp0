//
//  SceneDelegate.swift
//  StackoverflowApp
//
//  Created by Краснокутский Владислав on 30.05.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
	
	private let appCoordinatorFactory = AppCoordinatorFactory()
	private var appCoordinator: Interactable?

	func scene(_ scene: UIScene,
			   willConnectTo session: UISceneSession,
			   options connectionOptions: UIScene.ConnectionOptions) {
		guard let windowScene = (scene as? UIWindowScene) else { return }
		
		appCoordinator = appCoordinatorFactory.createAppCoordinator(with: windowScene)
		appCoordinator?.start()
	}
}

