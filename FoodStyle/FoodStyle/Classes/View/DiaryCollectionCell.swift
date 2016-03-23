//
//  DiaryCollectionCell.swift
//  FoodStyle
//
//  Created by Woz Wong on 16/3/24.
//  Copyright © 2016年 code4Fun. All rights reserved.
//

import Foundation
class DiaryCollectionCell:UICollectionViewCell{

    var DiaryZanPeople:ZanPeopleModel{
        set{
            self.DiaryZanPeople = newValue
        }
        get{
            return ZanPeopleModel()
}
    }

    var icon :UIButton = {
        var icon = UIButton()
//        icon.setImage(UIImage(named:self.DiaryZanPeople.icon), forState: UIControlState.Normal)
        return icon
    }()
}