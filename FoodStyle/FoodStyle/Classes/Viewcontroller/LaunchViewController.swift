//
//  LaunchViewController.swift
//  FoodStyle
//
//  Created by Woz Wong on 16/3/5.
//  Copyright © 2016年 code4Fun. All rights reserved.
//

import UIKit
class LaunchViewController: UIViewController{

    var tencentOAuth:TencentOAuth?
    var weiboUser:WeiboUser?

    var permissions:NSArray?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tencentOAuth = TencentOAuth(appId: TENCENT_APPID(), andDelegate: self)
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

        WeiboSDK.registerApp(SINA_APPKEY())
        let request = WBAuthorizeRequest()
        request.scope = "all"
        request.userInfo = ["myKey":"myValue"]
        WeiboSDK.sendRequest(request)
        
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

extension LaunchViewController : TencentLoginDelegate{
    func tencentDidLogin() {
        if tencentOAuth!.accessToken == nil{
            print("error_get_accessToken")
        }else{
            print(tencentOAuth!.accessToken)
        }
    }

    func tencentDidNotLogin(cancelled: Bool) {
        if cancelled {
            print("用户退出")
        }else{
            self.noticeError("登录失败")
        }
    }

    func tencentDidNotNetWork() {
        self.noticeInfo("未联网!", autoClear: true, autoClearTime: 1)

    }
}

extension LaunchViewController:TencentSessionDelegate {

    func getUserInfoResponse(response: APIResponse!) {

    }

    func tencentDidLogout() {
        self.noticeInfo("退出登录", autoClear: true, autoClearTime: 1)
        
    }
}

extension LaunchViewController : WBHttpRequestDelegate,WeiboSDKDelegate{
    func didReceiveWeiboRequest(request: WBBaseRequest!) {

    }

    func didReceiveWeiboResponse(response: WBBaseResponse!) {

        if response.isKindOfClass(WBAuthorizeResponse){
            let res = response as! WBAuthorizeResponse
            if (res.statusCode as! Int) == 0 {
                let dict = ["userID":res.userID,
                    "accessToken":res.accessToken]
                print(dict)
            }
        }
    }
}


