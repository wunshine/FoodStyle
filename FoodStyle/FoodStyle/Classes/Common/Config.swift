//
//  Config.swift
//  FoodStyle
//
//  Created by Woz Wong on 16/3/5.
//  Copyright © 2016年 code4Fun. All rights reserved.
//

import Foundation
import UIKit

func TENCENT_APPID()->String{
    return "1105231278"
}

func TENCENT_APPKEY()->String{
    return "R88sF9ohK7VKkQfQ"
}

func SINA_APPKEY()->String{
    return "599511907"
}

func SINA_APPSECRET()->String{
    return "5d5f349a891fae0b907de9dfa66c65b0"
}

func SINA_REDIRECTURL()->String{
    return "https://github.com/wunshine"
}

func SCREEN_RECT()->CGRect{
    return UIScreen.mainScreen().bounds
}

func SCORE_MARKET_URL()->NSURL{
    return NSURL(string: "http://m.douguo.com/special/jifen/?aggressive=QrDdqKtzWQ&clientkey=f984c5379ba0c871&device=iPhone6,2&imei=F397FDA5-BF1D-4269-940F-8076222C9ABF&sdk=9.2.1&timestamp=1457707483&user_id=16718286&version=211")!
}

func GLOBAL_COLOR()->UIColor{
    return UIColor(red: 0.8, green: 0.18, blue: 0.05, alpha: 1)
}

func NAVIGATIONBAR_HEIGHT()->CGFloat{
        return 44
}

func CANCELBUTTON_WIDTH()->CGFloat{
    return 60
}

func MARGIN()->CGFloat{
    return 10
}

func WXButton(frame frame:CGRect, title:String, target:AnyObject?, action:Selector)->UIButton{
    let button = UIButton(frame: frame)
    button.setTitle(title, forState: UIControlState.Normal)
    button.titleLabel?.font = UIFont.systemFontOfSize(16.0)
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