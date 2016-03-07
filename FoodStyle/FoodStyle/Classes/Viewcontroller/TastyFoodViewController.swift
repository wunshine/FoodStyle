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
        self.title = "美食"
        self.view.backgroundColor = UIColor.yellowColor()
        self.navigationItem.titleView = titleView
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView:self.leftButton)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView:self.rightButton)
        choosed()

    }

    @objc private func choosed(){
            selectedButton?.selected = false
            selectedButton?.titleLabel?.font = UIFont.systemFontOfSize(12.0)
            leftButton.selected = true
            selectedButton = leftButton

            if leftButton.selected == true{
                leftButton.titleLabel?.font = UIFont.systemFontOfSize(16.0)
        }
    }

    @objc private func follow(){
        selectedButton?.selected = false
        selectedButton?.titleLabel?.font = UIFont.systemFontOfSize(12.0)
        rightButton.selected = true
        selectedButton = rightButton

        if rightButton.selected == true{
            rightButton.titleLabel?.font = UIFont.systemFontOfSize(16.0)
        }
    }

    @objc private func all(){
        selectedButton?.selected = false
        selectedButton?.titleLabel?.font = UIFont.systemFontOfSize(12.0)
        titleView.selected = true
        selectedButton = titleView

        if titleView.selected == true{
            titleView.titleLabel?.font = UIFont.systemFontOfSize(16.0)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
