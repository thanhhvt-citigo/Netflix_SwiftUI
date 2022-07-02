//
//  WebVC.swift
//  Netflix_SwiftUI
//
//  Created by thanh tien on 03/07/2022.
//

import UIKit
import WebKit

class WebVC: Controller<WebViewModel> {
    @IBOutlet private var progressBar: UIProgressView!
    @IBOutlet private var webView: WKWebView!
        
    private var myContext = 0
    
    override func setup() {
        super.setup()
        setupNavigationBar()
        setupWebView()
        setupProgressBar()
        WKWebView.clean()
        removeCachedResponse()
        loadRequest()
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        guard let change = change else { return }
        if context != &myContext {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
            return
        }
        if keyPath == "estimatedProgress" {
            if let progress = (change[NSKeyValueChangeKey.newKey] as AnyObject).floatValue {
                progressBar.progress = progress
            }
            return
        }
    }
}

extension WebVC {
    private func setupNavigationBar() {
        let leftBarButtonItem = UIBarButtonItem(image: Asset.Assets.chevronLeftNormal.image, style: .plain, target: self, action: #selector(disAppear))
        
        navigationController?.navigationBar.tintColor = .black
        navigationItem.leftBarButtonItem = leftBarButtonItem
        navigationController?.navigationBar.backgroundColor = .white
        
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: 120, height: 40))
        let logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 80, height: 40))
        logoImageView.center = titleView.center
        logoImageView.image = Asset.Assets.netflixLogotypeNormal.image
        logoImageView.contentMode = .scaleAspectFit
        titleView.addSubview(logoImageView)
        navigationItem.titleView = titleView
    }
    
    @objc private func disAppear() {
        dismiss(animated: true)
    }
    
    private func setupWebView() {
        webView.configuration.allowsInlineMediaPlayback = false
        webView.allowsBackForwardNavigationGestures = true
        webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: &myContext)
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.canGoBack), options: .new, context: &myContext)
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.canGoForward), options: .new, context: &myContext)
    }
    
    private func setupProgressBar() {
        progressBar.trackTintColor = .clear
        progressBar.progressTintColor = .red
    }
}

extension WebVC {
    private func removeCachedResponse() {
        URLCache.shared.removeAllCachedResponses()
    }
    
    private func loadRequest() {
        if webView.isLoading {
            webView.stopLoading()
        }
        
        if let url = URL(string: vm.outputs.url) {
            let urlRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 60)
            webView.load(urlRequest)
        }
    }
}
