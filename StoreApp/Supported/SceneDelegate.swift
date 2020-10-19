//
//  SceneDelegate.swift
//  StoreApp
//
//  Created by Leonid Nifantyev on 02.10.2020.
//

import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        self.window?.makeKeyAndVisible()
        
        switch Auth.auth().currentUser {
        case .some:
            self.window?.rootViewController = UINavigationController(rootViewController: MainViewController())
        default:
            self.window?.rootViewController = UINavigationController(rootViewController: LoginViewController())
            
        }
    }
}

