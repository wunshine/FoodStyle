//
//  WXTabbarController.swift
//  FoodStyle
//
//  Created by Woz Wong on 16/3/5.
//  Copyright © 2016年 code4Fun. All rights reserved.
//

import UIKit

class WXTabbarController: UITabBarController {

    var car :UIWindow?
    var carButton:UIButton?
    var clickCount:NSInteger = 0

    var alertWindow:UIWindow?
    var alert:UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.tabBar.removeFromSuperview()
        self.setValue(WXTabbar(), forKeyPath: "tabBar")
        self.view.backgroundColor = UIColor.redColor()
        self.automaticallyAdjustsScrollViewInsets = false
        setChildViewController()
        setTabbar()
        setShopCar()

    }

    private func setShopCar(){
            alert = UIButton(frame: CGRectMake(0,0,30,30))
            alert?.layer.cornerRadius = 15
            alert?.setTitle("卖", forState: UIControlState.Normal)
            alert?.addTarget(self, action: "noShoping", forControlEvents: UIControlEvents.TouchUpInside)

            alertWindow = UIWindow(frame: CGRectMake(SCREEN_RECT().width-40,SCREEN_RECT().height-120,30,30))
            alertWindow?.layer.cornerRadius = 15
            alertWindow?.windowLevel = UIWindowLevelAlert+1
            alertWindow?.backgroundColor = UIColor.orangeColor()
            alertWindow?.addSubview(alert!)
            alertWindow?.makeKeyAndVisible()


            carButton = UIButton(frame: CGRectMake(0,0,30,30))
            carButton?.layer.cornerRadius = 15
            carButton?.setTitle("买", forState: UIControlState.Normal)
            carButton?.addTarget(self, action: "shoping", forControlEvents: UIControlEvents.TouchUpInside)

            car = UIWindow(frame: CGRectMake(SCREEN_RECT().width-40,SCREEN_RECT().height-120,30,30))
            car?.layer.cornerRadius = 15
            car?.windowLevel = UIWindowLevelAlert+2
            car?.backgroundColor = UIColor.purpleColor()
            car?.addSubview(carButton!)
            car?.makeKeyAndVisible()

        }


    @objc func shoping(){
        clickCount++
        if clickCount%2 == 0{
            let rotation = CABasicAnimation(keyPath: "transform.rotation.z")
            rotation.removedOnCompletion = false
            rotation.autoreverses = false
            rotation.fillMode = "forwards"
            rotation.fromValue = 180
            rotation.toValue = 0
            carButton?.layer.addAnimation(rotation, forKey: "")
            self.alertWindow?.frame.origin.x += 40
        }else if clickCount%2 == 1{
            let rotation = CABasicAnimation(keyPath: "transform.rotation.z")
            rotation.autoreverses = false
            rotation.fillMode = "forwads"
            rotation.removedOnCompletion = false
            rotation.fromValue = 0
            rotation.toValue = 180
            carButton?.layer.addAnimation(rotation, forKey: "")
            self.alertWindow?.frame.origin.x -= 40
            print("shoping")
        }
    }

    @objc func noShoping(){
        print("no-shoping")
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
