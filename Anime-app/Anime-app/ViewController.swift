//
//  ViewController.swift
//  Anime-app
//
//  Created by Shi-Wei Fang on 2020-06-07.
//  Copyright © 2020 Shi-Wei Fang. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate, UIScrollViewDelegate {
    var webView: WKWebView!
    var scrollView: UIScrollView!
    
    override func loadView() {
        webView = WKWebView()
        scrollView = UIScrollView()
        
        webView.navigationDelegate = self
        self.scrollView.delegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://4anime.to/")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        
        let elType = "table"
        let removeElementIdScript = "var element = document.getElementByTagName('\(elType)'); element[0].parentElement.removeChild(element);"
        webView.evaluateJavaScript(removeElementIdScript) { (response, error) in
            debugPrint("Am here")
        }
        
        //currently doesnt work this section, cant disable horizontal scroll..
        let body = "body"
        let noHorizontalScroll = "el = document.getElementsByTagName('\(body)'); el[0].style.overflow = 'hidden'"
        webView.evaluateJavaScript(noHorizontalScroll) { (response, error) in
            debugPrint("disablescroll")
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("scrollviewdidscroll")
        if scrollView.contentOffset.x != 0 {
               scrollView.contentOffset.x = 0
        }
    }
}

