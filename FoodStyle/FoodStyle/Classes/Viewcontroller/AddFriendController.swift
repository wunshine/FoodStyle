//
//  AddFriendController.swift
//  FoodStyle
//
//  Created by Woz Wong on 16/3/9.
//  Copyright © 2016年 code4Fun. All rights reserved.
//

import UIKit

class AddFriendController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "添加好友"
        tableView = UITableView(frame: CGRectZero, style: UITableViewStyle.Grouped)
        tableView.sectionHeaderHeight = 15
        tableView.sectionFooterHeight = 0
        tableView.contentInset = UIEdgeInsetsMake(-20, 0, 0, 0)
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "取消", style: UIBarButtonItemStyle.Plain, target: self, action: "cancel")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "map_icon_zoom_out"), style: UIBarButtonItemStyle.Plain, target: self, action: "searchFriend")
    }

    @objc func cancel(){
        navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }

    @objc func searchFriend(){
        navigationController?.pushViewController(SearchController(), animated: true)
        
    }

}


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


extension AddFriendController{

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let ID = "cell"
        var cell = tableView.dequeueReusableCellWithIdentifier(ID)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: ID)
        }
        cell!.textLabel?.text = "test"
        return cell!
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        switch section{
        case 0 :
            return 1
        case 1:
            return 2
        case 2:
            return 10
        default:
            return 10
        }
    }

    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headLabel = UILabel(frame: CGRectMake(0,0,SCREEN_RECT().width,15))
        switch section{
        case 0:
            headLabel.text = "邀请好友"
            headLabel.font = UIFont.systemFontOfSize(10)
            return headLabel
        case 1:
            headLabel.text = "新的好友"
            headLabel.font = UIFont.systemFontOfSize(10)
            return headLabel
        case 2:
            headLabel.text = "推荐关注"
            headLabel.font = UIFont.systemFontOfSize(10)
            return headLabel
        default:
            return headLabel
        }
    }
}
