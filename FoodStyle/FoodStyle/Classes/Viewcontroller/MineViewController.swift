//
//  MineViewController.swift
//  FoodStyle
//
//  Created by Woz Wong on 16/3/6.
//  Copyright © 2016年 code4Fun. All rights reserved.
//

import UIKit
import SnapKit

class MineViewController: UIViewController {

    let ID = "cell"

    lazy var toolView:UIView = {
        var tool = UIView()
        tool.backgroundColor = UIColor.yellowColor()
        return tool
    }()

    lazy var backImage:UIImageView = {
        let back = UIImageView(image: UIImage(named: "lol"))
        let tap = UITapGestureRecognizer(target: self, action: "tapBackImage")
        back.addGestureRecognizer(tap)
        back.userInteractionEnabled = true
        return back
    }()

    lazy var icon : UIButton = {
        let image = UIImage(named: "captcha_refresh_hl")
        let conerImage = image!.imageWithCorner()
        var icon = UIButton()
        icon.addTarget(self, action: "iconClick", forControlEvents: .TouchUpInside)
        icon.setImage(conerImage, forState: UIControlState.Normal)
        return icon
    }()

    lazy var nameLabel : UILabel = {
        var name = UILabel()
        name.sizeToFit()
        name.text = "AssKicking"
        name.textColor = UIColor.whiteColor()
        return name
    }()

    lazy var timeLabel: UILabel = {
        var time = UILabel()
        time.sizeToFit()
        time.font = UIFont.systemFontOfSize(10)
        time.textColor = UIColor.whiteColor()
        time.text = "2016-02-29 加入"
        return time
    }()

    lazy var scoreLabel:UIButton = {
        var score = UIButton()
        score.titleLabel?.font = UIFont.systemFontOfSize(8)
        score.layer.cornerRadius = 15
        score.titleEdgeInsets = UIEdgeInsetsMake(0,3,0,3)
        let image = UIImage().imageWithColor(GLOBAL_COLOR())
        score.setBackgroundImage(image, forState: UIControlState.Normal)
        score.addTarget(self, action:"scoreMarket", forControlEvents: .TouchUpInside)
        score.setTitle("39 积分", forState: UIControlState.Normal)
        score.sizeToFit()
        return score
    }()


    lazy var tableView:UITableView = {
        var tab = UITableView(frame: SCREEN_RECT(), style: UITableViewStyle.Grouped)
        tab.tableFooterView = UIView()
        tab.contentInset = UIEdgeInsetsMake(SCREEN_RECT().width*0.8-35,0,0,0)
        tab.sectionHeaderHeight = 0
        tab.sectionFooterHeight = 10
        tab.delegate = self
        tab.dataSource = self
        return tab
    }()

    @objc func tapBackImage(){
        let alertVC = UIAlertController(title: "修改封面", message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
        let camero = UIAlertAction(title: "拍照", style: UIAlertActionStyle.Default, handler: nil)
        let pickPhoto = UIAlertAction(title: "从相册挑选", style: UIAlertActionStyle.Default, handler: nil)
        let cancel = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil)

        alertVC.addAction(camero)
        alertVC.addAction(pickPhoto)
        alertVC.addAction(cancel)
        self.presentViewController(alertVC, animated: true, completion: nil)
    }

    @objc private func iconClick(){
        let alertVC = UIAlertController(title: "修改封面", message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
        let seeBigImage = UIAlertAction(title: "查看大图", style: UIAlertActionStyle.Default, handler: nil)
        let camero = UIAlertAction(title: "拍照", style: UIAlertActionStyle.Default, handler: nil)
        let pickPhoto = UIAlertAction(title: "从相册挑选", style: UIAlertActionStyle.Default, handler: nil)
        let cancel = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil)

        alertVC.addAction(seeBigImage)
        alertVC.addAction(camero)
        alertVC.addAction(pickPhoto)
        alertVC.addAction(cancel)
        self.presentViewController(alertVC, animated: true, completion: nil)
    }

    @objc private func scoreMarket(){

    }

    @objc func set(){
        presentViewController(WXNavigationController(rootViewController:AccountSetController()), animated: true , completion: nil)

    }

    @objc func add(){
        presentViewController(WXNavigationController(rootViewController:AddFriendController()), animated: true, completion: nil)

    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        backImage.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(SCREEN_RECT().width)
            make.height.equalTo(SCREEN_RECT().width*0.8)
            make.top.equalTo(view.snp_top)
        }

        icon.snp_makeConstraints { (make) -> Void in
//            make.width.height.equalTo(80)
            make.centerX.equalTo(view.snp_centerX)
            make.top.equalTo(view).offset(50)
        }

        nameLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(icon.snp_bottom)
            make.centerX.equalTo(view.snp_centerX)
        }

        timeLabel.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(view.snp_centerX)
            make.top.equalTo(nameLabel.snp_bottom).offset(20)
        }

        scoreLabel.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(35)
            make.height.equalTo(15)
            make.centerX.equalTo(view.snp_centerX)
            make.top.equalTo(timeLabel.snp_bottom).offset(5)
        }

        toolView.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(SCREEN_RECT().width)
            make.height.equalTo(44)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "个人信息"
        self.automaticallyAdjustsScrollViewInsets = false
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "my_center_setting_icon"), style: UIBarButtonItemStyle.Plain, target: self, action: "set")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "add_friend_normal"), style: UIBarButtonItemStyle.Plain, target: self, action: "add")
        view.backgroundColor = UIColor.lightGrayColor()
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: ID)
        view.addSubview(tableView)
        view.addSubview(backImage)
        view.addSubview(icon)
        view.addSubview(nameLabel)
        view.addSubview(timeLabel)
        view.addSubview(scoreLabel)
        view.didAddSubview(toolView)

    }
}

extension MineViewController: UITableViewDelegate,UITableViewDataSource{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(ID)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: ID)
        }
        cell?.textLabel?.text = "test"
        return cell!
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {

    }
}