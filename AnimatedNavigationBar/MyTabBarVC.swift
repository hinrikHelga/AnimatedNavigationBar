//
//  MyTabBarVC.swift
//  AnimatedNavigationBar
//
//  Created by Hinrik Helgason on 16/05/2023.
//

import UIKit

class MyTabBarVC: UITabBarController, UITabBarControllerDelegate {
    
    init() {
        
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("Storyboard are a pain")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        let myTabBar = MyTabBar()
        self.setValue(myTabBar, forKey: "tabBar")
                
        self.createTabBar()
        self.setupMiddleButton()
    }
        
    func createTabBar() {
        UITabBar.appearance().tintColor = .black
        
        self.viewControllers = [createFirstScreenNavigationController(), createSecondScreenNavigationController(), createFourthScreenNavigationController(), createFifthScreenNavigationController()]
        
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
    
    
    
    func createFourthScreenNavigationController() -> UINavigationController {
        let thirdScreenVC = ThirdScreenVC()
        thirdScreenVC.title = "Third Screen"
        thirdScreenVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 3)
        thirdScreenVC.tabBarItem.isSpringLoaded = true
        
        return UINavigationController(rootViewController: thirdScreenVC)
    }
    
    
    func createFifthScreenNavigationController() -> UINavigationController {
        let fourthScreenVC = FourthScreenVC()
        fourthScreenVC.title = "Fourth Screen"
        fourthScreenVC.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 4)
        
        return UINavigationController(rootViewController: fourthScreenVC)
    }
    
    
    func setupMiddleButton()  {

        let middleBtn = UIButton(frame: CGRect(x: (self.view.bounds.width / 2) - 25, y: -20, width: 50, height: 50))
        
        //STYLE THE BUTTON YOUR OWN WAY
        //middleBtn.setIcon(icon: .fontAwesomeSolid(.home), iconSize: 20.0, color: UIColor.white, backgroundColor: UIColor.white, forState: .normal)

        middleBtn.setImage(UIImage(named: "heart"), for: .normal)
        
        //add to the tabbar and add click event
        self.tabBar.addSubview(middleBtn)
        middleBtn.addTarget(self, action: #selector(self.menuButtonAction), for: .touchUpInside)

        self.view.layoutIfNeeded()
    }

    // Menu Button Touch Action
    @objc func menuButtonAction(sender: UIButton) {
        self.selectedIndex = 2   //to select the middle tab. use "1" if you have only 3 tabs.
    }
}
