//
//  LaunchViewController.swift
//  FoodStyle
//
//  Created by Woz Wong on 16/3/5.
//  Copyright © 2016年 code4Fun. All rights reserved.
//

import UIKit
class LaunchViewController: UIViewController,TencentSessionDelegate, TencentLoginDelegate {

    var tencentOAuth:TencentOAuth?

    var permissions:NSArray?

    /**
     delegate implementation
     */

    func tencentDidLogin() {
        if tencentOAuth!.accessToken == nil{
            print("error")
        }else{
            print(tencentOAuth!.accessToken)
        }
    }

    func tencentDidNotLogin(cancelled: Bool) {
        if cancelled {
            print("用户取消")
        }else{
            print("登录失败")
        }

    }

    func tencentDidNotNetWork() {
        print("您的网络有问题")

    }

    func getUserInfoResponse(response: APIResponse!) {

    }

    func tencentDidLogout() {

    }


    override func viewDidLoad() {
        super.viewDidLoad()
        self.tencentOAuth = TencentOAuth(appId: "1105231278", andDelegate: self)
        self.permissions = ["get_user_info","get_simple_userinfo"]

    }

    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.hidden = true 
        super.viewWillAppear(animated)
    }

    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.navigationBar.hidden = false
        super.viewWillDisappear(animated)
    }


    @IBAction func QQLoginButtonClick(sender: AnyObject) {
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            self.tencentOAuth!.authorize(self.permissions! as [AnyObject], inSafari: false)
        }
    }

    @IBAction func SinaLoginButttonClick(sender: AnyObject) {
        UIView.animateWithDuration(0.5) { () -> Void in
            self.view.frame.origin.y += SCREEN_RECT().height
            UIApplication.sharedApplication().keyWindow?.rootViewController = MainViewController()
        }
    }

    @IBAction func DouGuoLoginButtonClick(sender: AnyObject) {
        self.navigationController?.pushViewController(LoginViewController(), animated: true)
    }

    @IBAction func RegisteButtonClick(sender: AnyObject) {
        self.navigationController?.pushViewController(RegisteViewController(), animated: true)

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
