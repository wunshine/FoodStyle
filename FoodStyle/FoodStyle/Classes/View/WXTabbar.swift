//
//  WXTabbar.swift
//  FoodStyle
//
//  Created by Woz Wong on 16/3/10.
//  Copyright © 2016年 code4Fun. All rights reserved.
//

import UIKit

class WXTabbar: UITabBar{

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
        super.layoutSubviews()
        let count = (CGFloat)(self.subviews.count/2+1)
        let width = self.frame.width/count
        let height = self.frame.height
        var originX:CGFloat = 0
        let originY:CGFloat = 10
        var i:CGFloat =  0
        for button in self.subviews{
            if button.isKindOfClass(NSClassFromString("UITabBarButton")!){
//                if i == 2 {
//                    i += 1
//                }
                originX = i * width
                button.frame = CGRectMake(originX, originY, width, height)
                button.tag = NSInteger(i)
                i++
            }
//            print(self.subviews)
//            }
        }
        cameroButton.center = self.center
    }

        @objc private func buttonClick(tabbar:UIButton){
            if tabbar.tag == preSelectIndex{
                print("doubleCick")
            }
            preSelectIndex = tabbar.tag

//        }
    }
}
