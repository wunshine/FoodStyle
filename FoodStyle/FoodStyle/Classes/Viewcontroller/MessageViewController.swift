//
//  MessageViewController.swift
//  FoodStyle
//
//  Created by Woz Wong on 16/3/6.
//  Copyright © 2016年 code4Fun. All rights reserved.
//

import UIKit
import SnapKit

class MessageViewController: UIViewController {

    let identify = "messageCell"

    lazy var trashView:UIButton = {
        var trash = UIButton(frame: CGRectMake(0,0,44,44))
        trash.imageEdgeInsets = UIEdgeInsetsMake(0,0,0,-30)
        trash.setImage(UIImage(named: "message_trash_normal"), forState: UIControlState.Normal)
        trash.addTarget(self , action: "delete", forControlEvents: .TouchUpInside)
        return trash
    }()

    lazy var tableView:UITableView = {
        var tab = UITableView()
        tab.tableFooterView = UIView()
        tab.delegate = self
        tab.dataSource = self
        return tab
    }()

    lazy var segment :UISegmentedControl = {
        var seg = UISegmentedControl(items: ["评论","赞","关注","通知"])
        seg.selectedSegmentIndex = 0
        seg.tintColor = GLOBAL_COLOR()
        seg.addTarget(self, action: "switchSegment", forControlEvents: UIControlEvents.ValueChanged)
        return seg
    }()

    @objc func delete(){

    }

    @objc func switchSegment(){
        let index = segment.selectedSegmentIndex
        switch index{
        case 0 :
            print("0")
            break
        case 1:
            print("1")
            break
        case 2:
            print("2")
            break
        case 3:
            print("3")
            break
        default:
            break
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: self.trashView)
        view.backgroundColor = UIColor.lightGrayColor()
        view.addSubview(segment)
        view.addSubview(tableView)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        segment.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(SCREEN_RECT().width-2*MARGIN())
            make.height.equalTo(25)
            make.centerX.equalTo(view.snp_centerX)
            make.top.equalTo(5)
        }

        tableView.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(SCREEN_RECT().width)
            make.height.equalTo(SCREEN_RECT().height)
            make.top.equalTo(35)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension MessageViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(identify)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: identify)
        }
        cell?.imageView?.image = UIImage(named: "error")
        cell?.textLabel?.text = "test"
        cell?.detailTextLabel?.text = "tooooo"
        cell?.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        return cell!
    }
}
