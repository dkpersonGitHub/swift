//
//  AppDelegate.swift
//  swiftFirstCode
//
//  Created by dukai on 14-10-21.
//  Copyright (c) 2014年 dk. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,UITabBarControllerDelegate {

    var window: UIWindow?
//    var naviController :UINavigationController?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window?.backgroundColor = UIColor.whiteColor()
        
        var firstController = firstViewController(nibName: "firstViewController", bundle: nil)
        var secController   = secViewController(nibName:   "secViewController"  , bundle: nil)
        var thirdController = thirdViewController(nibName: "thirdViewController", bundle: nil)
        var forthController = forthViewController(nibName: "forthViewController", bundle: nil)
        
        firstController.title = "first"
        secController.title   = "second"
        thirdController.title = "third"
        forthController.title = "forth"
        
        var firstNaviController = UINavigationController(rootViewController: firstController)
        var secNaviController   = UINavigationController(rootViewController:   secController)
        var thirdNaviController = UINavigationController(rootViewController: thirdController)
        var forthNaviController = UINavigationController(rootViewController: forthController)
        
        firstNaviController.navigationBar.setBackgroundImage(UIImage(named: "a24.png"), forBarPosition: UIBarPosition.Top, barMetrics: UIBarMetrics.Default)
        var attributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
        firstNaviController.navigationBar.titleTextAttributes = attributes
        
        firstController.tabBarItem.image = UIImage(named: "") //tabBar单块的图片
        
        var tabBarController = UITabBarController()
        tabBarController.viewControllers = [firstNaviController,secNaviController,thirdNaviController,forthNaviController]
        tabBarController.tabBar.backgroundImage = UIImage(named: "") //背景图片
        tabBarController.tabBar.backgroundColor = UIColor.blackColor() //背景颜色
        tabBarController.tabBarItem.image = UIImage(named: "") //tabbar 图片
        tabBarController.delegate = self
        
        self.window!.rootViewController = tabBarController
        self.window!.makeKeyAndVisible()
        
      
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

