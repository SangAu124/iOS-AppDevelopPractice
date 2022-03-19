//
//  AppDelegate.swift
//  ReactotKitEx
//
//  Created by 김상금 on 2022/03/19.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let counterViewController = window?.rootViewController as? ViewController
        let counterViewReactor = CounterViewReactor()
        counterViewController?.reactor = counterViewReactor
        
        return true
    }
}

