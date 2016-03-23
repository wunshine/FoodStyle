//
//  TastyFoodViewController.swift
//  FoodStyle
//
//  Created by Woz Wong on 16/3/6.
//  Copyright © 2016年 code4Fun. All rights reserved.
//

import UIKit

class TastyFoodViewController: UITableViewController {

    var selectedButton:UIButton?

//    var headView : SectionHeadView = {
//        let head = SectionHeadView(frame: CGRectMake(0,0,SCREEN_RECT().width,64))
//        print(head)
//        head.backgroundColor = UIColor.redColor()
//        return head
//    }()

    lazy var refresh : UIRefreshControl = {
        var refresh = UIRefreshControl(frame: CGRectMake(0,0,30,30))
        return refresh
    }()

    lazy var rightButton : UIButton = {
        var right = WXButton(frame: CGRectMake(0, 0, 60, 44), title: "关注", target: self, action: "follow")
        return right
    }()

    lazy var leftButton : UIButton = {
        var left = WXButton(frame: CGRectMake(0, 0, 60, 44), title: "精选", target: self, action: "choosed")
        return left
    }()

    lazy var titleView : UIButton = {
        var title = WXButton(frame: CGRectMake(0, 0, 60, 44), title: "全部", target: self, action: "all")
        return title
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: CGRectZero, style: UITableViewStyle.Plain)
        tableView.sectionHeaderHeight = 64
//        tableView.sectionFooterHeight = 0
        view.backgroundColor = UIColor.whiteColor()
        navigationItem.titleView = titleView
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView:self.leftButton)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView:self.rightButton)
        tableView.addSubview(refresh)
        choosed()

    }

    @objc private func choosed(){
            selectedButton?.selected = false
            selectedButton?.titleLabel?.font = UIFont.systemFontOfSize(16.0)
            leftButton.selected = true
            selectedButton = leftButton

            if leftButton.selected == true{
                leftButton.titleLabel?.font = UIFont.systemFontOfSize(20.0)
        }
    }

    @objc private func follow(){
        selectedButton?.selected = false
        selectedButton?.titleLabel?.font = UIFont.systemFontOfSize(16.0)
        rightButton.selected = true
        selectedButton = rightButton

        if rightButton.selected == true{
            rightButton.titleLabel?.font = UIFont.systemFontOfSize(20.0)
        }
    }

    @objc private func all(){
        selectedButton?.selected = false
        selectedButton?.titleLabel?.font = UIFont.systemFontOfSize(16.0)
        titleView.selected = true
        selectedButton = titleView

        if titleView.selected == true{
            titleView.titleLabel?.font = UIFont.systemFontOfSize(20.0)
        }
    }


    override func viewDidLayoutSubviews() {

    }
}

extension TastyFoodViewController{

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 10
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let ID = "cell"
        var cell = tableView.dequeueReusableCellWithIdentifier(ID)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: ID)
        }
        cell?.textLabel?.text = "test"
        return cell!
    }

    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let headView = SectionHeadView(frame: CGRectMake(0,0,SCREEN_RECT().width,64))
        print(headView)
        headView.backgroundColor = UIColor.init(white: 1, alpha: 0.85)
        return headView
    }
}

extension TastyFoodViewController{

    override func scrollViewWillBeginDecelerating(scrollView: UIScrollView) {
        refresh.beginRefreshing()
    }

    override func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
            self.refresh.endRefreshing()
    }

}


