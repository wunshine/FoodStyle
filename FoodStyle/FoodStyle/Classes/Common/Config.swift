//
//  Config.swift
//  FoodStyle
//
//  Created by Woz Wong on 16/3/5.
//  Copyright © 2016年 code4Fun. All rights reserved.
//

import Foundation
import UIKit
//let SCREEN_RECT = UIScreen.mainScreen().bounds
func SCREEN_RECT()->CGRect{
    return UIScreen.mainScreen().bounds
}

func GLOBAL_COLOR()->UIColor{
    return UIColor(red: 0.8, green: 0.18, blue: 0.05, alpha: 1)
}

func WXButton(frame frame:CGRect, title:String, target:AnyObject?, action:Selector)->UIButton{
    let button = UIButton(frame: frame)
    button.setTitle(title, forState: UIControlState.Normal)
    button.titleLabel?.font = UIFont.systemFontOfSize(12.0)
    button.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)
    button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Selected)
    button.addTarget(target, action: action, forControlEvents: .TouchDown)
    return button
}

func tabbarButton(normalImage normalImage:String)->UIButton{
    let tabbar = UIButton()
    tabbar.setImage(UIImage(named: normalImage), forState: UIControlState.Normal)
    tabbar.setImage(UIImage(named: normalImage+"_hl"), forState: UIControlState.Highlighted)
    return tabbar
}