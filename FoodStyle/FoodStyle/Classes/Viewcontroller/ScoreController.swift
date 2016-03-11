//
//  ScoreController.swift
//  FoodStyle
//
//  Created by Woz Wong on 16/3/11.
//  Copyright © 2016年 code4Fun. All rights reserved.
//

import UIKit
import WebKit
class ScoreController: UIViewController {

    var webView:WKWebView = {
        var web = WKWebView(frame: SCREEN_RECT())
//        web.navigationDelegate = self
        return web
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "积分商城"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "取消", style: UIBarButtonItemStyle.Plain, target: self, action: "cancel")
        view.addSubview(webView)
        let request = NSURLRequest(URL: SCORE_MARKET_URL())
        webView.loadRequest(request)
    }

    @objc func cancel(){
        navigationController?.dismissViewControllerAnimated(true , completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ScoreController:WKNavigationDelegate{
    func webView(webView: WKWebView, didFailNavigation navigation: WKNavigation!, withError error: NSError) {
        print(error)
    }
}
