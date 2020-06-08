//
//  ViewController.swift
//  Anime-app
//
//  Created by Shi-Wei Fang on 2020-06-07.
//  Copyright © 2020 Shi-Wei Fang. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://4anime.to/")!
        webView.load(URLRequest(url: url))
        webView.scrollView.showsHorizontalScrollIndicator = false
        webView.allowsBackForwardNavigationGestures = true
        
        print("finish to load")
        let elType = "right_sidebar"
        let removeElementIdScript = "var element = document.getElementByTagName('\(elType)'); element.parentElement.removeChild(element);"
        webView.evaluateJavaScript(removeElementIdScript) { (response, error) in
            debugPrint("Am here")
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
       if (scrollView.contentOffset.x > 0){
           scrollView.contentOffset = CGPoint(x: 0, y: scrollView.contentOffset.y)
       }
    }
}

