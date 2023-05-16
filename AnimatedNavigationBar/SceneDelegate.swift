//
//  SceneDelegate.swift
//  AnimatedNavigationBar
//
//  Created by Hinrik Helgason on 15/05/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = createTabBar()
        window?.makeKeyAndVisible()
    }
    
    
    func createFirstScreenNavigationController() -> UINavigationController {
        let firstScreenVC = FirstScreenVC()
        firstScreenVC.title = "First Screen"
        firstScreenVC.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        
        return UINavigationController(rootViewController: firstScreenVC)
    }
    
    
    func createSecondScreenNavigationController() -> UINavigationController {
        let secondScreenVC = SecondScreenVC()
        secondScreenVC.title = "Second Screen"
        secondScreenVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        return UINavigationController(rootViewController: secondScreenVC)
    }
    
    
    func createThirdScreenNavigationController() -> UINavigationController {
        let thirdScreenVC = ThirdScreenVC()
        thirdScreenVC.title = "Second Screen"
        thirdScreenVC.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 1)
        
        return UINavigationController(rootViewController: thirdScreenVC)
    }
    
    
    func createFourthScreenNavigationController() -> UINavigationController {
        let fourthScreenVC = FourthScreenVC()
        fourthScreenVC.title = "Fourth Screen"
        fourthScreenVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 3)
        
        return UINavigationController(rootViewController: fourthScreenVC)
    }
    
    
    func createFifthScreenNavigationController() -> UINavigationController {
        let fifthScreenVC = FifthScreenVC()
        fifthScreenVC.title = "Fifth Screen"
        fifthScreenVC.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 1)
        
        return UINavigationController(rootViewController: fifthScreenVC)
    }
    
    
    
    func createTabBar() -> UITabBarController {
        UITabBar.appearance().tintColor = .black
        UITabBar.appearance().isSpringLoaded = true
        
        let tabBarController = UITabBarController()
        
        
        let lineView = UIView(frame: CGRect(x: 0, y: 0, width: tabBarController.tabBar.frame.size.width, height: 1))
        lineView.backgroundColor = UIColor.gray
        tabBarController.tabBar.addSubview(lineView)
        
        tabBarController.viewControllers = [createFirstScreenNavigationController(), createSecondScreenNavigationController(), createThirdScreenNavigationController(), createFourthScreenNavigationController(), createFifthScreenNavigationController()]
        
        return tabBarController
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

