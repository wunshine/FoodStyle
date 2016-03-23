//
//  DiaryTableViewCell.swift
//  FoodStyle
//
//  Created by Woz Wong on 16/3/23.
//  Copyright © 2016年 code4Fun. All rights reserved.
//

import UIKit
class DiaryCell : UITableViewCell {
    var model:DiaryCellModel{
        get{
            return DiaryCellModel()
        }

        set{
            self.model = newValue
        }
    }

    var picture:UIImageView = {
        var pic = UIImageView(image: UIImage(named: "watermark_left_state_1"))
        return pic
    }()

    var diaryName:UILabel = {
        let name = UILabel()
        name.text = "奶油蛋糕"
        name.sizeToFit()
        return name
    }()

    var title:UILabel = {
        let title = UILabel()
        title.text = "吃货志"
        title.sizeToFit()
        return title
    }()

    var zan:UIButton = {
        var zan = UIButton()
        zan.layer.cornerRadius = 3
        zan.backgroundColor = GLOBAL_COLOR()
        zan.setTitle("赞", forState: UIControlState.Normal)
        zan.setTitle("已赞", forState: UIControlState.Selected)
        zan.setImage(UIImage(named: "diary_liked"), forState: UIControlState.Selected)
        zan.setImage(UIImage(named: "diary_like"), forState: UIControlState.Normal)
        return zan
    }()

    var comment:UIButton = {
        var comment = UIButton()
        comment.layer.cornerRadius = 3
        comment.backgroundColor = GLOBAL_COLOR()
        comment.setTitle("评论", forState: UIControlState.Normal)
        comment.setImage(UIImage(named: "diary_comment"), forState: UIControlState.Normal)
        return comment
    }()

    var more:UIButton = {
        var more = UIButton()
        more.backgroundColor = UIColor.lightGrayColor()
        more.layer.cornerRadius = 3
        more.setImage(UIImage(named: "diary_menu"), forState: UIControlState.Normal)
        return more
    }()

    var zanedPeople:UICollectionView = {
        var layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSizeMake(SCREEN_RECT().width-20/8,44)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        var people = UICollectionView(frame: CGRectMake(0,0,SCREEN_RECT().width-20,44), collectionViewLayout: layout)
        var item = UICollectionViewCell()
        item.contentView.addSubview(UIButton())
        return people
    }()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(picture)
        addSubview(title)
        addSubview(diaryName)
        addSubview(zan)
        addSubview(zanedPeople)
        addSubview(comment)
        addSubview(more)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("not imped")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        picture.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(self)
            make.height.equalTo(200)
            make.top.equalTo(self.snp_top)
        }

        diaryName.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(picture.snp_bottom).offset(20)
            make.left.equalTo(self).offset(20)
            make.height.equalTo(20)
        }

        title.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(diaryName.snp_bottom).offset(10)
            make.left.equalTo(diaryName.snp_left)
            make.height.equalTo(20)
        }

        zanedPeople.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(title.snp_bottom).offset(20)
            make.centerX.equalTo(self.snp_centerX)
        }

        zan.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(zanedPeople.snp_bottom).offset(10)
            make.left.equalTo(diaryName.snp_left)
            make.width.equalTo(60)
            make.height.equalTo(25)
        }

        comment.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(zan.snp_right).offset(20)
            make.top.equalTo(zan.snp_top)
            make.height.width.equalTo(zan)
        }

        more.snp_makeConstraints { (make) -> Void in
            make.right.equalTo(self).offset(-10)
            make.top.equalTo(comment.snp_top)
            make.width.equalTo(40)
            make.height.equalTo(comment)
        }
    }
}

