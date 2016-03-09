//
//  SearchController.swift
//  FoodStyle
//
//  Created by Woz Wong on 16/3/10.
//  Copyright © 2016年 code4Fun. All rights reserved.
//

import UIKit

class SearchController: UITableViewController {

    lazy var searchController:UISearchController = {
        var search = UISearchController(searchResultsController: nil)
        search.searchBar.placeholder = "寻找好友"
        search.searchBar.delegate = self
        search.searchResultsUpdater = self
        search.hidesNavigationBarDuringPresentation = false
        return search
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "搜索用户"
        tableView.scrollEnabled = false
        tableView.tableFooterView = UIView()
        tableView.addSubview(searchController.searchBar)

    }

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        if searchController.active {
            searchController.active = false
        }
        searchController.removeFromParentViewController()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        if (self.searchController.active) {
            return 1
        }else{
            return 2
        }
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let ID = "cell"
        var cell = tableView.dequeueReusableCellWithIdentifier(ID)
        if cell == nil{
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: ID)
        }

        if self.searchController.active {
            cell?.textLabel?.text = "hehe"
        }
        else{
            cell?.textLabel?.text = "haha"
        }
        return cell!
   }
}

extension SearchController:UISearchResultsUpdating{
    func updateSearchResultsForSearchController(searchController: UISearchController) {

    }
}

extension SearchController:UISearchBarDelegate{
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
    }

    func searchBarTextDidEndEditing(searchBar: UISearchBar) {

    }
}