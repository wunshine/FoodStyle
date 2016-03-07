//
//  MainViewController.swift
//  FoodStyle
//
//  Created by Woz Wong on 16/3/5.
//  Copyright © 2016年 code4Fun. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.redColor()
        setChildViewController()
        setTabbar()
    }

    func setChildViewController(){
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

    @objc func navigationControllerWithVC(viewController:UIViewController)->UINavigationController{
        let nav =  WXNavigationController(rootViewController: viewController)
        return nav
    }

    func setTabbar(){
        self.tabBarItem.image = UIImage(named: "tab_button_businesses")
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
