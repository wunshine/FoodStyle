//
//  WXTabbarController.swift
//  FoodStyle
//
//  Created by Woz Wong on 16/3/5.
//  Copyright © 2016年 code4Fun. All rights reserved.
//

import UIKit

class WXTabbarController: UITabBarController {

    override class func initialize(){

        let item = UITabBarItem.appearance()
//        item.imageInsets = UIEdgeInsetsMake(10, 0, 0, 0)
        let dictSelected = [NSForegroundColorAttributeName:UIColor.blackColor()]
        let dictNormal = [NSForegroundColorAttributeName:UIColor.lightGrayColor()]
        item.setTitleTextAttributes(dictNormal, forState: UIControlState.Normal)
        item.setTitleTextAttributes(dictSelected, forState: UIControlState.Selected)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.tabBar.removeFromSuperview()
//        let tabar = WXTabbar()
//        self.tabBar.addSubview(tabar)
//        self.setValue(tabar, forKeyPath: "tabBar")
        self.view.backgroundColor = UIColor.redColor()
        self.automaticallyAdjustsScrollViewInsets = false
        setChildViewController()
        setTabbar()
    }

    private func setChildViewController(){
        let tastyFoodVC = navigationControllerWithVC(TastyFoodViewController())
        let messageVC = navigationControllerWithVC(MessageViewController())
        let mineVC = navigationControllerWithVC(MineViewController())
        let restaurantVC = navigationControllerWithVC(RestaurantViewController())
        self.addChildViewController(tastyFoodVC)
        self.addChildViewController(restaurantVC)
        self.addChildViewController(CameraViewController())
        self.addChildViewController(messageVC)
        self.addChildViewController(mineVC)
    }

     @objc private func navigationControllerWithVC(viewController:UIViewController)->UINavigationController{
        let nav =  WXNavigationController(rootViewController: viewController)
        return nav
    }

    private func setTabbar(){

        childViewControllers[0].tabBarItem = UITabBarItem(title: "", image: UIImage(named: "tab_button_diaries"), selectedImage: UIImage(named: "tab_button_diaries_hl"))

        childViewControllers[1].tabBarItem = UITabBarItem(title: "", image: UIImage(named: "tab_button_businesses"), selectedImage: UIImage(named: "tab_button_businesses_hl"))

        childViewControllers[2].tabBarItem = UITabBarItem(title: "", image: UIImage(named: "tab_button_camera"), selectedImage: UIImage(named: "tab_button_camera"))

        childViewControllers[3].tabBarItem = UITabBarItem(title: "", image: UIImage(named:"tab_button_messages"), selectedImage: UIImage(named:"tab_button_messages_hl"))

        childViewControllers[4].tabBarItem = UITabBarItem(title: "", image: UIImage(named: "tab_button_mine"), selectedImage: UIImage(named: "tab_button_mine_hl"))
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
