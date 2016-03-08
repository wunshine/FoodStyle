//
//  NavigationController.swift
//  FoodStyle
//
//  Created by Woz Wong on 16/3/5.
//  Copyright © 2016年 code4Fun. All rights reserved.
//

import UIKit

class WXNavigationController: UINavigationController {

    override class func initialize(){
        let bar = UINavigationBar.appearance()
        bar.tintColor = UIColor.whiteColor()
        let backImage = UIImage().imageWithColor(GLOBAL_COLOR())
        bar.setBackgroundImage(backImage, forBarMetrics: .Default)
        let dict = [NSForegroundColorAttributeName:UIColor.whiteColor()]
        bar.titleTextAttributes = dict

        let barButtonItem = UIBarButtonItem.appearance()
        let dict2 = [NSForegroundColorAttributeName : UIColor.whiteColor(),NSFontAttributeName:UIFont.systemFontOfSize(14)]
        barButtonItem.setTitleTextAttributes(dict2, forState: UIControlState.Normal)
        super.initialize()
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    override func pushViewController(viewController: UIViewController, animated: Bool) {
        if self.childViewControllers.count>0 {
            viewController.hidesBottomBarWhenPushed = true
                    }
        super.pushViewController(viewController, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
