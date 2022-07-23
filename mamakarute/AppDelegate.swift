//
//  AppDelegate.swift
//  mamakarute
//
//  Created by 武久　直幹 on 2022/07/15.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var tabBarController: UITabBarController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        //ナビゲーションバー
                UINavigationBar.appearance().tintColor = UIColor.white
                UINavigationBar.appearance().barTintColor = UIColor.red
                UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
                
                //タブバーコントローラー
                UITabBar.appearance().tintColor = UIColor.orange
                UITabBar.appearance().unselectedItemTintColor = UIColor.gray
                UITabBar.appearance().barTintColor = .purple
                UITabBar.appearance().isTranslucent = false
                
                // ページを格納する配列
                var viewControllers: [UIViewController] = []
                
                let calendarViewController: CalendarViewController? = CalendarViewController()
                calendarViewController?.tabBarItem = UITabBarItem(title: "First", image: UIImage(named: "tab-icon-sample"), tag: 1)
                let calendarNavigationController = UINavigationController(rootViewController: calendarViewController!)
                viewControllers.append(calendarNavigationController)
                
                let graphViewController: GraphViewController? = GraphViewController()
        graphViewController?.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.downloads, tag: 2)
                let graphNavigationController = UINavigationController(rootViewController: graphViewController!)
                viewControllers.append(graphNavigationController)
                
                tabBarController = UITabBarController()
                tabBarController?.setViewControllers(viewControllers, animated: false)
                
                self.window = UIWindow(frame: UIScreen.main.bounds)
                self.window!.makeKeyAndVisible()
                window?.rootViewController = tabBarController
        
    
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

