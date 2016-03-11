//
//  WXTabbar.swift
//  FoodStyle
//
//  Created by Woz Wong on 16/3/10.
//  Copyright © 2016年 code4Fun. All rights reserved.
//

import UIKit

class WXTabbar: UITabBar {
    internal func WXTabbar(){
        addSubview(cameroButton)
    }

    private var cameroButton:UIButton = {
        var camero = UIButton(type: .Custom)
        camero.backgroundColor = GLOBAL_COLOR()
        camero.setImage(UIImage(named: "tab_button_camera"), forState: UIControlState.Normal)
        camero.setImage(UIImage(named: "tab_button_camera"), forState: UIControlState.Highlighted)
        camero.sizeToFit()
        return camero
    }()

    var preSelectIndex:NSInteger?

    override func layoutSubviews() {
        addSubview(cameroButton)
        super.layoutSubviews()
        let count = (CGFloat)(subviews.count+1)
        let width = self.frame.width/count
        let height = self.frame.height
        var originX:CGFloat = 0 as CGFloat
        let originY:CGFloat = 10 as CGFloat
        var i:CGFloat =  0 as CGFloat
        for button in self.subviews{
            if i == 2 {
                i += 1
            }
            originX = i * width
            button.frame = CGRectMake(originX, originY, width, height)
//            button.tag = i 
            i++
            let butto:UIButton = button as! UIButton
           butto.addTarget(self, action: "buttonClick:", forControlEvents: .TouchUpInside)
        }
        cameroButton.center = self.center
    }

        func buttonClick(tabbar:UIControl){
//            if tabbar.tag == preSelectIndex{
                print("doubleCick")
//            }
//            preSelectIndex = tabbar.tag

//        }
    }
}
