//
//  LoginViewController.swift
//  FoodStyle
//
//  Created by Woz Wong on 16/3/5.
//  Copyright © 2016年 code4Fun. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    lazy var scrollView:UIScrollView = {
        var scrollView = UIScrollView(frame: SCREEN_RECT())
        scrollView.delegate = self
        scrollView.showsVerticalScrollIndicator = false
        scrollView.contentSize = CGSizeMake(SCREEN_RECT().width,SCREEN_RECT().height+2*MARGIN())
        return scrollView
    }()

    lazy var accountField:WXTextField = {
        var account = WXTextField()
        account.backgroundColor = UIColor.whiteColor()
        account.placeholder = "手机号/邮箱"
        account.clearButtonMode = .WhileEditing
        account.tintColor = GLOBAL_COLOR()
        return account
    }()

    lazy var seperator:UIView = {
        var sep = UIView()
        sep.backgroundColor = UIColor.lightGrayColor()
        return sep
    }()

    lazy var passwordField:WXTextField = {
        var pwd = WXTextField()
        pwd.backgroundColor = UIColor.whiteColor()
        pwd.placeholder = "密码"
        pwd.tintColor = GLOBAL_COLOR()
        pwd.secureTextEntry = true
        pwd.clearButtonMode = .WhileEditing
        return pwd
    }()

    lazy var forgetPwdButton:UIButton = {
        var btn = UIButton()
        btn.titleLabel?.font = UIFont.systemFontOfSize(10)
        btn.setTitleColor(GLOBAL_COLOR(), forState: UIControlState.Normal)
        btn.setTitle("忘记密码?", forState: UIControlState.Normal)
        btn.addTarget(self, action: "forgetPwd", forControlEvents: .TouchDown)
        return btn
    }()

    lazy var loginButton:UIButton = {
        var login = UIButton()
        login.setBackgroundImage(UIImage().imageWithColor(GLOBAL_COLOR()), forState: UIControlState.Normal)
        login.setTitle("登录", forState: UIControlState.Normal)
        login.addTarget(self, action: "login", forControlEvents: .TouchDown)
        return login
    }()

    lazy var infoButton:UIButton = {
        var info = UIButton()
        info.titleLabel?.font = UIFont.systemFontOfSize(12.0)
        info.setTitleColor(GLOBAL_COLOR(), forState: UIControlState.Normal)
        info.setTitle("还没有账号 马上注册", forState: UIControlState.Normal)
        info.addTarget(self, action: "registe", forControlEvents: .TouchDown)
        return info
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "登录"
        self.view.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(scrollView)
        scrollView.addSubview(self.accountField)
        scrollView.addSubview(self.passwordField)
        scrollView.addSubview(self.seperator)
        scrollView.addSubview(self.forgetPwdButton)
        scrollView.addSubview(self.loginButton)
        scrollView.addSubview(self.infoButton)
    }

    @objc func login(){

    }

    @objc func registe(){
        self.navigationController?.pushViewController(RegisteViewController(), animated: true)

    }

    @objc func forgetPwd(){

    }

    /**
     layoutSubViews
     */

    override func viewWillLayoutSubviews() {
        super.viewDidLayoutSubviews()
        accountField.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(view)
            make.top.equalTo(2*MARGIN())
            make.height.equalTo(4*MARGIN())
        }

        seperator.snp_makeConstraints { (make) -> Void in
            make.height.equalTo(0.5)
            make.top.equalTo(accountField.snp_bottom)
//            make.left.equalTo(view).offset(200.0)
        }

        passwordField.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(view)
            make.height.equalTo(4*MARGIN())
            make.top.equalTo(seperator.snp_bottom)
        }

        forgetPwdButton.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(passwordField.snp_bottom).offset(2*MARGIN())
            make.right.equalTo(view).offset(-2*MARGIN())
        }

        loginButton.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(SCREEN_RECT().width - 2*2*MARGIN())
            make.height.equalTo(35.0)
            make.centerX.equalTo(view.snp_centerX)
            make.top.equalTo(forgetPwdButton.snp_bottom).offset(5.0)
        }

        infoButton.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(view.snp_centerX)
            make.top.equalTo(loginButton.snp_bottom).offset(MARGIN())
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension LoginViewController:UIScrollViewDelegate{
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        scrollView.setContentOffset(CGPointZero, animated: true)
    }
}
