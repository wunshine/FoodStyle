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
    var permissions:NSArray?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "返回", style: .Plain, target: nil, action: nil)
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

//        WeiboSDK.registerApp(SINA_APPKEY())
//        WeiboSDK.enableDebugMode(true)
//        let request = WBAuthorizeRequest()
//        request.scope = "all"
//        request.redirectURI = SINA_REDIRECTURL()
//        request.userInfo = ["myKey":"myValue"]
//        WeiboSDK.sendRequest(request)
        
        UIView.animateWithDuration(0.5) { () -> Void in
            self.view.frame.origin.y += SCREEN_RECT().height
            UIApplication.sharedApplication().keyWindow?.rootViewController = WXTabbarController()
        }

//        self.navigationController?.dismissViewControllerAnimated(true, completion: nil)

    }

    @IBAction func DouGuoLoginButtonClick(sender: AnyObject) {
        self.navigationController?.pushViewController(LoginViewController(), animated: true)
    }

    @IBAction func RegisteButtonClick(sender: AnyObject) {
        self.navigationController?.pushViewController(RegisteViewController(), animated: true)

    }

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
            self.noticeError("登录失败",autoClear: true, autoClearTime: 1)
        }
    }

    func tencentDidNotNetWork() {
        self.noticeInfo("未联网!", autoClear: true, autoClearTime: 1)

    }
}

extension LaunchViewController:TencentSessionDelegate {

    func getUserInfoResponse(response: APIResponse!) {
        print(response)
    }

    func tencentDidLogout() {
        self.noticeInfo("退出登录", autoClear: true, autoClearTime: 1)
        
    }
}


extension LaunchViewController : WeiboSDKDelegate{
    func didReceiveWeiboResponse(response: WBBaseResponse!) {
        if response.isKindOfClass(WBAuthorizeResponse){
//            let res = response as! WBAuthorizeResponse
//            let code : NSInteger = 0
//            let statusCode = (NSInteger)(res.statusCode)
//            if statusCode == 0 {
//                let dict = ["userID":res.userID,
//                    "accessToken":res.accessToken]
//                print(dict)

                UIView.animateWithDuration(0.5) { () -> Void in
                    self.view.frame.origin.y += SCREEN_RECT().height
                    UIApplication.sharedApplication().keyWindow?.rootViewController = WXTabbarController()
                }
            }
        }
//        print("hehe")
//    }

    func didReceiveWeiboRequest(request: WBBaseRequest!) {
        print(request)
    }
}

extension LaunchViewController: WBHttpRequestDelegate{

    func request(request: WBHttpRequest!, didFailWithError error: NSError!) {
        print(error)
    }

    func request(request: WBHttpRequest!, didFinishLoadingWithResult result: String!) {
        print(result)
    }

    func request(request: WBHttpRequest!, didReceiveResponse response: NSURLResponse!) {
        print(request)
    }

    func request(request: WBHttpRequest!, didFinishLoadingWithDataResult data: NSData!) {
        print(request)
    }

    func request(request: WBHttpRequest!, didReciveRedirectResponseWithURI redirectUrl: NSURL!) {
        print(request)
    }

}


