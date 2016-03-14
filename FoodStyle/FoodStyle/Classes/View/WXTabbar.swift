//
//  WXTabbar.swift
//  FoodStyle
//
//  Created by Woz Wong on 16/3/10.
//  Copyright © 2016年 code4Fun. All rights reserved.
//

import UIKit

class WXTabbar: UITabBar {

    override init(frame: CGRect) {
        super.init(frame:frame)
        addSubview(cameroButton)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("没有实现这个方法")
    }
    
    var preSelectIndex:NSInteger?

    private var cameroButton:UIButton = {
        var camero = UIButton(type: .Custom)
        camero.backgroundColor = GLOBAL_COLOR()
        camero.setImage(UIImage(named: "tab_button_camera"), forState: UIControlState.Normal)
        camero.setImage(UIImage(named: "tab_button_camera"), forState: UIControlState.Highlighted)
        camero.sizeToFit()
        return camero
    }()


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
//            if button.isKindOfClass(UIButton){
//                button.addTarget(self, action: "buttonClick:", forControlEvents: .TouchUpInside)
//            }
        }
        cameroButton.center = self.center
    }

        @objc private func buttonClick(tabbar:UIButton){
//            if tabbar.tag == preSelectIndex{
                print("doubleCick")
//            }
//            preSelectIndex = tabbar.tag

//        }
    }
}
