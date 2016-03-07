//
//  RegisteViewController.swift
//  FoodStyle
//
//  Created by Woz Wong on 16/3/5.
//  Copyright © 2016年 code4Fun. All rights reserved.
//

import UIKit
import SnapKit

class RegisteViewController : UIViewController {

    lazy var scrollView : UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.delegate = self
        scrollView.backgroundColor = UIColor.clearColor()
        scrollView.frame = SCREEN_RECT()
        scrollView.contentSize = CGSizeMake(SCREEN_RECT().width, SCREEN_RECT().height+20.0)
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()

    lazy var inputField : WXTextField = {
        var inputField = WXTextField()
        inputField.clearButtonMode = .WhileEditing
        inputField.keyboardType = .NumberPad
        inputField.backgroundColor = UIColor.whiteColor()
        inputField.tintColor = UIColor.redColor()
        inputField.placeholder = "请输入你的手机号码"
        return inputField
    }()

    lazy var mailRegisteButton : UIButton = {
        var mailRegisteButton = UIButton()
        mailRegisteButton.titleLabel?.font = UIFont.systemFontOfSize(12.0)
        mailRegisteButton.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        mailRegisteButton.setTitle("邮箱注册", forState: UIControlState.Normal)
        mailRegisteButton.addTarget(self, action: "mailRegiste", forControlEvents: .TouchUpInside)
        return mailRegisteButton
    }()

    lazy var infoLabel : UILabel = {
        var infoLabel = UILabel()
        infoLabel.font = UIFont.systemFontOfSize(10)
        infoLabel.numberOfLines = 0
        infoLabel.text = "豆果不会在任何地方泄露你的手机号码,也不会发送垃圾信息."
        infoLabel.textColor = UIColor.blackColor()
        infoLabel.font = UIFont.systemFontOfSize(12.0)
        return infoLabel
    }()

    lazy var nextButton : UIButton = {
        var nextButton = UIButton()
        nextButton.titleLabel?.textAlignment = .Center
        nextButton.setTitle("下一步", forState: UIControlState.Normal)
        nextButton.setBackgroundImage(UIImage().imageWithColor(GLOBAL_COLOR()), forState: UIControlState.Normal)
        nextButton.addTarget(self, action: "nextButtonClick", forControlEvents: .TouchUpInside)
        return nextButton
    }()

    @objc private func nextButtonClick(){

    }

    @objc private func mailRegiste(){
        self.navigationController?.pushViewController(MailRegisteViewController(), animated: true)

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "注册"
//        let backButtonItem = UIButton(type: .Custom)
//        backButtonItem.frame = CGRectMake(0, 0, 100, 44)
//        backButtonItem.setTitle("返回", forState: UIControlState.Normal)
//        backButtonItem.setImage(UIImage(named: "left_indicator"), forState: UIControlState.Normal)
//        backButtonItem.addTarget(self, action: "back", forControlEvents: .TouchDown)
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButtonItem)
        self.view.backgroundColor = UIColor.lightGrayColor()
        view.addSubview(self.scrollView)
        scrollView.addSubview(self.inputField)
        scrollView.addSubview(self.nextButton)
        scrollView.addSubview(self.infoLabel)
        scrollView.addSubview(self.mailRegisteButton)

        // Do any additional setup after loading the view.
    }


    @objc private func back(){
        self.navigationController?.popToRootViewControllerAnimated(true)
    }

    override func viewDidLayoutSubviews() {
        super.viewWillLayoutSubviews()
        inputField.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(SCREEN_RECT().width)
            make.height.equalTo(40.0)
            make.top.equalTo(20.0)
        }

        nextButton.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(SCREEN_RECT().width-2*20.0)
            make.height.equalTo(35.0)
            make.topMargin.equalTo(inputField.snp_bottom).offset(20.0)
            make.centerX.equalTo(view.snp_centerX)
        }

        infoLabel.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(nextButton)
            make.centerX.equalTo(view.snp_centerX)
            make.top.equalTo(nextButton.snp_bottom).offset(10.0)
        }

        mailRegisteButton.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(self.view.snp_centerX)
            make.top.equalTo(nextButton.snp_bottom).offset(300.0)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension RegisteViewController : UIScrollViewDelegate{
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        scrollView.setContentOffset(CGPointZero, animated: true)
    }
}

