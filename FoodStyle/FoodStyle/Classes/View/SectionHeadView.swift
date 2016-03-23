//
//  SectionHeadView.swift
//  FoodStyle
//
//  Created by Woz Wong on 16/3/23.
//  Copyright © 2016年 code4Fun. All rights reserved.
//

import UIKit
import SnapKit

class SectionHeadView : UIView{

    var model : SectionHeadViewModel{
        set{
            self.model = newValue
//            icon = self.model.icon
        }

        get{
            return self.model
        }
    }

    lazy var icon:UIImageView = {
        var icon = UIImageView()
        icon.image = UIImage(named: "add_friends_button_contact_normal")!.imageWithCorner()
        return icon
    }()

    lazy var nickName:UILabel = {
        var name = UILabel()
        name.text = "ssssssssssss"
        name.sizeToFit()
        return name
    }()

    lazy var location:UIButton = {
        var location = UIButton()
        location.setTitle("ffffffffffffffffffffffffffffffff", forState: UIControlState.Normal)
        location.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        location.titleLabel?.lineBreakMode = NSLineBreakMode.ByTruncatingTail
        location.setImage(UIImage(named: "location_normal"), forState: UIControlState.Normal)
        location.titleEdgeInsets = UIEdgeInsetsMake(0,5,0,0)
        location.sizeToFit()
        return location
    }()

    lazy var follow:UIButton = {
        var follow = UIButton()
        follow.setTitle("关注", forState: UIControlState.Normal)
        follow.setTitle("已关注", forState: UIControlState.Selected)
        let imageNormal = UIImage().imageWithColor(GLOBAL_COLOR())
        let imageSelect = UIImage().imageWithColor(UIColor.lightGrayColor())
        follow.setBackgroundImage(imageNormal, forState: UIControlState.Normal)
        follow.setBackgroundImage(imageSelect, forState: UIControlState.Selected)
        return follow
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(icon)
        addSubview(location)
        addSubview(nickName)
        addSubview(follow)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("not impEd")
    }


    override func layoutSubviews() {
        super.layoutSubviews()
        icon.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(15)
            make.width.equalTo(44)
            make.height.equalTo(44)
            make.centerY.equalTo(self.snp_centerY)
        }

        nickName.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(icon.snp_right).offset(10)
            make.top.equalTo(icon.snp_top)
        }

        location.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(nickName.snp_left)
            make.right.equalTo(follow.snp_left).offset(-10)
            make.bottom.equalTo(icon.snp_bottom)
        }

        follow.snp_makeConstraints { (make) -> Void in
            make.right.equalTo(self).offset(-10)
            make.centerY.equalTo(self.snp_centerY)
            make.width.equalTo(60)
            make.height.equalTo(25)
        }

    }
}