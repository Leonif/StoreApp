//
//  SceneDelegate.swift
//  StoreApp
//
//  Created by Leonid Nifantyev on 02.10.2020.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController = MainViewController()
    }

    


}

