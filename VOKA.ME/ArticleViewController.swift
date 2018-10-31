//
//  FirstViewController.swift
//  VOKA.ME
//
//  Created by Максим Руды on 10/26/18.
//  Copyright © 2018 Максим Руды. All rights reserved.
//

import UIKit
import WebKit

class ArticleViewController: UIViewController {

    private var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator = setupActivityIndicator()
        webView.addSubview(activityIndicator)
        setupConstraints()
        activityIndicator.startAnimating()
        
        let url: URL = URL(string: "https://voka.me")!
        let urlRequest: URLRequest = URLRequest(url: url)
        webView.load(urlRequest)
        webView.navigationDelegate = self
        webView.allowsBackForwardNavigationGestures = true
    }

    private func setupActivityIndicator() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.color = UIColor(named: "labelGreen")
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }
    
    private func setupConstraints(){
        activityIndicator.centerXAnchor.constraint(equalTo: webView.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: webView.centerYAnchor).isActive = true
    }

}

extension ArticleViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        activityIndicator.startAnimating()
    }
}

