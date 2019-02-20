//
//  AppDelegate.swift
//  FixPayment
//
//  Created by Anton Skorodumov on 20/02/2019.
//  Copyright © 2019 chameleon production. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        ServiceRegister.register()
        
        ServiceLocator.resolve(TodayPaymentManager.self).registerToday(ammount: 500)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let controller = DayHistoryPaymentVC()
        let nc = NavigationController.init(rootViewController: controller)
        window?.rootViewController = nc
        window?.makeKeyAndVisible()
        
        return true
    }
    
}

