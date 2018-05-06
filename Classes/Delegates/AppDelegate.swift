//
//  AppDelegate.swift
//  flickr
//
//  Created by Mert Ahmet Güneş on 2018-05-06.
//  Copyright © 2018 tretton37. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		
		let window = UIWindow(frame: UIScreen.main.bounds)
		let controller = MainViewController()
		let navController = BaseNavigationController(rootViewController: controller)
		window.rootViewController = navController
		window.makeKeyAndVisible()
		
		self.window = window
		
		return true
	}

	func applicationWillResignActive(_ application: UIApplication) {
		
	}

	func applicationDidEnterBackground(_ application: UIApplication) {
		
	}

	func applicationWillEnterForeground(_ application: UIApplication) {
		
	}

	func applicationDidBecomeActive(_ application: UIApplication) {
		
	}

	func applicationWillTerminate(_ application: UIApplication) {
		
	}
}
