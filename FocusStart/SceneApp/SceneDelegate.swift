//
//  SceneDelegate.swift
//  FocusStart
//
//  Created by Alexander Rozhdestvenskiy on 28.01.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    let onboarding = OnboardingViewController()
    let viewController = UINavigationController(rootViewController: MainViewController())

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = DataState.hasOnboarded ? viewController : onboarding
        window?.makeKeyAndVisible()
        
        onboarding.delegate = self
    }
}

extension SceneDelegate {
    func setRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window, duration: 0.75, options: .transitionCrossDissolve, animations: nil, completion: nil)
    }
}

extension SceneDelegate: OnboardingViewControllerDelegate {
    func didFinishOnboarding() {
        DataState.hasOnboarded = true
        setRootViewController(viewController)
    }
}
