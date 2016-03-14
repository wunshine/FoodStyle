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
    var tableViewConstraint:Constraint?
    var originOffset :CGFloat = 0


    lazy var toolView:UIView = {
        var tool = UIView()
        tool.backgroundColor = UIColor.yellowColor()
        return tool
    }()

    lazy var backImage:UIImageView = {
        let back = UIImageView(image: UIImage(named: "lol"))
        return back
    }()

    lazy var containView:UIView = {
        var view = UIView()
        let tap = UITapGestureRecognizer(target: self, action: "tapBackImage")
        view.addGestureRecognizer(tap)
        view.userInteractionEnabled = true
        view.backgroundColor = UIColor.clearColor()
        view.addSubview(self.icon)
        view.addSubview(self.nameLabel)
        view.addSubview(self.timeLabel)
        view.addSubview(self.scoreLabel)
        return view
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
        var tab = UITableView(frame:CGRectZero, style: UITableViewStyle.Grouped)
        tab.tableFooterView = UIView()
        tab.scrollEnabled = false
        tab.contentInset = UIEdgeInsetsMake(-40,0,0,0)
        tab.sectionHeaderHeight = 0
        tab.sectionFooterHeight = 10
        tab.delegate = self
        tab.dataSource = self

        return tab
    }()

    lazy var scrollView:UIScrollView = {
        var s = UIScrollView(frame: SCREEN_RECT())
        s.contentSize = CGSizeMake(SCREEN_RECT().size.width,SCREEN_RECT().size.height*1.01)
        s.userInteractionEnabled = true
        s.showsVerticalScrollIndicator = false
        s.backgroundColor = UIColor.whiteColor()
        s.delegate = self
        return s
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
        navigationController?.presentViewController(WXNavigationController(rootViewController:ScoreController()), animated: true , completion: nil)

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
            make.height.equalTo(SCREEN_RECT().width)
            make.top.equalTo(-44)
        }

        tableView.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(SCREEN_RECT().width)
            make.height.equalTo(200)
            tableViewConstraint = make.top.equalTo(backImage.snp_bottom).offset(-65).constraint
        }

        containView.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(SCREEN_RECT().width)
            make.height.equalTo(SCREEN_RECT().width*0.6)
            make.bottom.equalTo(tableView.snp_top)
        }

        icon.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(containView.snp_centerX)
            make.top.equalTo(containView).offset(50)
        }

        nameLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(icon.snp_bottom)
            make.centerX.equalTo(containView.snp_centerX)
        }

        timeLabel.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(containView.snp_centerX)
            make.top.equalTo(nameLabel.snp_bottom).offset(20)
        }

        scoreLabel.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(35)
            make.height.equalTo(15)
            make.centerX.equalTo(containView.snp_centerX)
            make.top.equalTo(timeLabel.snp_bottom).offset(5)
        }

//        toolView.snp_makeConstraints { (make) -> Void in
//            make.width.equalTo(SCREEN_RECT().width)
//            make.height.equalTo(44)
////            make.top.equalTo(containView.snp_bottom)
//        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clearColor()
        self.automaticallyAdjustsScrollViewInsets = false
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "my_center_setting_icon"), style: UIBarButtonItemStyle.Plain, target: self, action: "set")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "add_friend_normal"), style: UIBarButtonItemStyle.Plain, target: self, action: "add")
        view.backgroundColor = UIColor.lightGrayColor()
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: ID)
        view.addSubview(scrollView)
        scrollView.addSubview(backImage)
        scrollView.addSubview(tableView)
        scrollView.addSubview(containView)
//        scrollView.didAddSubview(toolView)
    }
}

extension MineViewController: UITableViewDelegate,UITableViewDataSource{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
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

}

extension MineViewController : UIScrollViewDelegate{
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        if offset < 0 {
            if abs(offset) < 45 {
                tableViewConstraint?.uninstall()
                tableView.snp_updateConstraints(closure: { (make) -> Void in
                    make.top.equalTo(backImage.snp_bottom).offset(-45+abs(offset))
                })
            }
            else if abs(offset) > 45{
                tableViewConstraint?.uninstall()
                tableView.snp_updateConstraints { (make) -> Void in
                    make.top.equalTo(backImage.snp_bottom)
                }
            }
        }else if offset > 0 {
            tableViewConstraint?.uninstall()
            tableView.snp_updateConstraints(closure: { (make) -> Void in
                make.top.equalTo(backImage.snp_bottom).offset(-45-abs(offset))
            })
        }
    }

    func scrollViewWillBeginDecelerating(scrollView: UIScrollView) {
        backImage.frame.origin.y = 0
        tableViewConstraint?.uninstall()
        tableView.snp_updateConstraints { (make) -> Void in
            make.top.equalTo(backImage.snp_bottom).offset(-45)
        }
    }
}