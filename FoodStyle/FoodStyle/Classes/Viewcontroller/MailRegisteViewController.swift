//
//  MailRegisteViewController.swift
//  FoodStyle
//
//  Created by Woz Wong on 16/3/5.
//  Copyright © 2016年 code4Fun. All rights reserved.
//

import UIKit

class MailRegisteViewController: UIViewController {

    lazy var scrollView:UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.backgroundColor = UIColor.clearColor()
        scrollView.frame = SCREEN_RECT()
        scrollView.contentSize = CGSizeMake(SCREEN_RECT().width,SCREEN_RECT().height+20)
        return scrollView
    }()

    lazy var mail:WXTextField = {
        var mail = WXTextField()
        mail.clearButtonMode = .WhileEditing
        mail.backgroundColor = UIColor.whiteColor()
        mail.tintColor = UIColor.redColor()
        mail.placeholder = "邮箱"
        return mail
    }()

    lazy var passWord:WXTextField = {
        var pwd = WXTextField()
        pwd.clearButtonMode = .WhileEditing
        pwd.backgroundColor = UIColor.whiteColor()
        pwd.tintColor = UIColor.redColor()
        pwd.secureTextEntry = true
        pwd.placeholder = "密码"
        return pwd
    }()

    lazy var name:WXTextField = {
        var name = WXTextField()
        name.clearButtonMode = .WhileEditing
        name.backgroundColor = UIColor.whiteColor()
        name.tintColor = UIColor.redColor()
        name.placeholder = "昵称"
        return name
    }()

    lazy var seperator1:UIView = {
        var sep = UIView()
        sep.backgroundColor = UIColor.lightGrayColor()
        return sep
    }()

    lazy var seperator2:UIView = {
    var sep = UIView()
        sep.backgroundColor = UIColor.lightGrayColor()
        return sep
    }()

    lazy var container:UIView = {
        var contain = UIView()
        contain.backgroundColor = UIColor.clearColor()
        return contain
    }()

    lazy var verifyImage:UIButton = {
        var vry = UIButton()
        vry.backgroundColor = UIColor(red: 0.95, green: 0.84, blue: 0.36, alpha: 1)
        vry.addTarget(self, action: "refreshCode", forControlEvents: .TouchDown)
        return vry
    }()

    lazy var refreshButton : UIButton = {
        var ref = UIButton()
        ref.setImage(UIImage(named: "captcha_refresh_normal"), forState: UIControlState.Normal)
        ref.setImage(UIImage(named: "captcha_refresh_hl"), forState: UIControlState.Highlighted)
        ref.addTarget(self, action: "refreshCode", forControlEvents: .TouchDown)
        return ref
    }()

    lazy var verifyField:UITextField = {
        var vf = UITextField()
        vf.backgroundColor = UIColor.whiteColor()
        vf.clearButtonMode = .WhileEditing
        vf.font = UIFont.systemFontOfSize(12.0)
        vf.textAlignment = .Center
        vf.placeholder = "输入验证码"
        vf.tintColor = GLOBAL_COLOR()
        return vf
    }()

    lazy var registeButton:UIButton = {
        var registe = UIButton()
        registe.titleLabel?.font = UIFont.systemFontOfSize(12.0)
        registe.setTitle("注册", forState: UIControlState.Normal)
        registe.addTarget(self, action: "registe", forControlEvents: .TouchDown)
        registe.setBackgroundImage(UIImage().imageWithColor(GLOBAL_COLOR()), forState: UIControlState.Normal)
        return registe
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "邮箱注册"
        self.view.backgroundColor = UIColor.lightGrayColor()
        view.addSubview(self.scrollView)
        scrollView.addSubview(self.mail)
        scrollView.addSubview(self.passWord)
        scrollView.addSubview(self.name)
        scrollView.addSubview(self.seperator1)
        scrollView.addSubview(self.seperator2)
        scrollView.addSubview(self.container)
        container.addSubview(self.verifyImage)
        container.addSubview(self.refreshButton)
        container.addSubview(self.verifyField)
        scrollView.addSubview(self.registeButton)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        mail.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(SCREEN_RECT().width)
            make.height.equalTo(35.0)
            make.top.equalTo(20.0)
        }

        seperator1.snp_makeConstraints { (make) -> Void in
            make.height.equalTo(0.5)
            make.top.equalTo(mail.snp_bottom)
        }

        passWord.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(SCREEN_RECT().width)
            make.height.equalTo(35.0)
            make.top.equalTo(seperator1.snp_bottom)
        }

        seperator2.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(SCREEN_RECT().width)
            make.height.equalTo(0.5)
            make.top.equalTo(passWord.snp_bottom)
        }

        name.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(SCREEN_RECT().width)
            make.height.equalTo(35.0)
            make.top.equalTo(seperator2.snp_bottom)
        }

        container.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(SCREEN_RECT().width - 2*20)
            make.centerX.equalTo(view.snp_centerX)
            make.height.equalTo(30.0)
            make.top.equalTo(name.snp_bottom).offset(20.0)
        }

        verifyImage.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(100.0)
            make.height.equalTo(30.0)
            make.left.equalTo(container)
            make.top.equalTo(container)
        }

        refreshButton.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(30.0)
            make.height.equalTo(30.0)
            make.top.equalTo(container)
            make.centerX.equalTo(container.snp_centerX)
        }

        verifyField.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(10*MARGIN())
            make.height.equalTo(3*MARGIN())
            make.top.equalTo(container)
            make.right.equalTo(container)
        }

        registeButton.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(SCREEN_RECT().width -  2*2*MARGIN())
            make.height.equalTo(35.0)
            make.centerX.equalTo(view.snp_centerX)
            make.top.equalTo(container.snp_bottom).offset(2*MARGIN())
        }
    }

    @objc func refreshCode(){

    }

    @objc func registe(){

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
