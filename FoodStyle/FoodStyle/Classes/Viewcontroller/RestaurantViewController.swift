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
        let rightItem = UIButton(frame: CGRectMake(0,0,CANCELBUTTON_WIDTH(),NAVIGATIONBAR_HEIGHT()))
        rightItem.setTitle("取消", forState: UIControlState.Normal)
        rightItem.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Highlighted)
        rightItem.addTarget(self, action: "cancel", forControlEvents: .TouchUpInside)
        return rightItem
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "餐厅"
        self.view.backgroundColor = UIColor.blueColor()
        self.navigationController?.navigationBar.addSubview(rightItem)
        self.navigationController?.navigationBar.addSubview(searchView)
    }

    override func viewWillLayoutSubviews() {
        super.viewDidLayoutSubviews()
        constraintSearchBar()
        constraintRirhtView()
    }

    private func constraintSearchBar(){
        searchView.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(SCREEN_RECT().width-2*MARGIN())
            make.left.equalTo(MARGIN())
            make.bottom.equalTo((self.navigationController?.navigationBar)!)
        }
    }

    private func constraintRirhtView(){
        rightItem.snp_makeConstraints(closure: { (make) -> Void in
            make.left.equalTo(searchView.snp_right).offset(15)
            make.centerY.equalTo(searchView.snp_centerY)
        })

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
