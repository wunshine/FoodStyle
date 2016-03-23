//
//  DiaryZanPeopleModel.swift
//  FoodStyle
//
//  Created by Woz Wong on 16/3/24.
//  Copyright © 2016年 code4Fun. All rights reserved.
//

import Foundation
class ZanPeopleModel:NSObject{
    internal var icon :String?

    func valueWithDict(dict:[String:String])->ZanPeopleModel{
        self.icon = dict["icon"]
        return ZanPeopleModel()
    }

}