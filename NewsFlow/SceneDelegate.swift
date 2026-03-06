//
//  SceneDelegate.swift
//  NewsFlow
//
//  Created by Горніч Антон on 04.03.2026.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else {return}
        
        window = UIWindow(windowScene: windowScene)
        
        let homeVC = HomeRouter.createModule()
        let navigationController = UINavigationController(rootViewController: homeVC)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

}

