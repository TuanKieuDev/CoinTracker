//
//  CustomWebViewController.swift
//  CoinTracker
//
//  Created by Kieu Anh Tuan on 06/11/2024.
//

import UIKit
import WebKit

final class CustomWebViewController: UIViewController {
    
    var webview: WKWebView!
    var url: URL?
    var activityIndicator = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webview = WKWebView(frame: self.view.frame)
        webview.navigationDelegate = self
        webview.allowsBackForwardNavigationGestures = true
        
        view.addSubview(webview)

        activityIndicator.center = view.center
        view.addSubview(activityIndicator)

        if let url = url {
            let request = URLRequest(url: url)
            activityIndicator.startAnimating()
            webview.load(request)
        }

        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.tintColor = .black
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @objc 
    func close() {
        dismiss(animated: true, completion: nil)
    }
}

extension CustomWebViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activityIndicator.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        activityIndicator.stopAnimating()
        print("Failed to load page: \(error.localizedDescription)")
    }
}
