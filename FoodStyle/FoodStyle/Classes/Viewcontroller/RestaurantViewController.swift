//
//  RestaurantViewController.swift
//  FoodStyle
//
//  Created by Woz Wong on 16/3/6.
//  Copyright © 2016年 code4Fun. All rights reserved.
//

import UIKit
import SnapKit

class RestaurantViewController: UIViewController {

    lazy var searchView : UISearchBar = {
        var search = UISearchBar()
        search.delegate = self
        search.placeholder = "搜索餐厅"
        search.tintColor = UIColor.redColor()
        return search
    }()

    lazy var rightItem : UIButton = {
        let rightItem = UIButton()
        rightItem.setTitle("取消", forState: UIControlState.Normal)
        rightItem.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Highlighted)
        rightItem.addTarget(self, action: "cancel", forControlEvents: .TouchUpInside)
        return rightItem
    }()

    lazy var location:UIButton = {
        var location = UIButton()
        location.userInteractionEnabled = false
        location.titleLabel?.font = UIFont.systemFontOfSize(12)
        location.titleEdgeInsets = UIEdgeInsetsMake(0,10,0,0)
        location.setImage(UIImage(named: "location_nearby_position"), forState: UIControlState.Normal)
        location.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        location.setTitle("第八区", forState: UIControlState.Normal)
        return location
    }()

    lazy var refresh:UIButton = {
        var refresh = UIButton()
        refresh.setImage(UIImage(named: "location_nearby_refresh"), forState: UIControlState.Normal)
        refresh.highlighted = true
        refresh.addTarget(self, action: "refreshLocation", forControlEvents: .TouchUpInside)
        return refresh
    }()

    lazy var toolView:UIView = {
        var tool = UIView()
        tool.backgroundColor = UIColor.lightGrayColor()
        tool.addSubview(self.location)
        tool.addSubview(self.refresh)
        return tool
    }()

    @objc func refreshLocation(){

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blueColor()
        navigationController?.navigationBar.addSubview(rightItem)
        navigationController?.navigationBar.addSubview(searchView)
        view.addSubview(toolView)
    }

    override func viewWillLayoutSubviews() {
        super.viewDidLayoutSubviews()
        constraintSearchBar()
        constraintRightView()
        constraintTool()
    }

    private func constraintSearchBar(){
        searchView.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(SCREEN_RECT().width-2*MARGIN())
            make.left.equalTo(MARGIN())
            make.bottom.equalTo((self.navigationController?.navigationBar)!)
        }
    }

    private func constraintRightView(){
        rightItem.snp_makeConstraints(closure: { (make) -> Void in
            make.left.equalTo(searchView.snp_right).offset(15)
            make.centerY.equalTo(searchView.snp_centerY)
        })

    }

    private func constraintTool(){
        toolView.snp_makeConstraints { (make) -> Void in
            make.bottom.equalTo(-49)
            make.width.equalTo(SCREEN_RECT().width)
            make.height.equalTo(24)
        }

        location.snp_makeConstraints { (make) -> Void in
            make.center.equalTo(toolView.snp_center)
            make.height.equalTo(20)
            make.width.equalTo(100)
        }

        refresh.snp_makeConstraints { (make) -> Void in
            make.right.equalTo(-10)
            make.height.width.equalTo(20)
            make.centerY.equalTo(toolView.snp_centerY)
        }
    }
}


extension RestaurantViewController : UISearchBarDelegate{
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        searchView.snp_updateConstraints { (make) -> Void in
            make.left.equalTo(MARGIN())
            make.width.equalTo(SCREEN_RECT().width-2*MARGIN()-CANCELBUTTON_WIDTH())
            make.bottom.equalTo((self.navigationController?.navigationBar)!)
            rightItem.hidden = false
        }
    }

    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
//        var frame = searchView.frame
//        frame.size.width += 60
//        searchView.frame = frame
        constraintSearchBar()
    }

    @objc private func cancel(){
        rightItem.hidden = true
        var frame = searchView.frame
        frame.size.width += 60
        searchView.frame = frame
        searchView.endEditing(true)
//        searchView.resignFirstResponder()

    }
}
