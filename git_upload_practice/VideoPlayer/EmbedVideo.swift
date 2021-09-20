//
//  EmbedVideo.swift
//  git_upload_practice
//
//  Created by Jyoti1 Yadav on 03/09/21.
//  Copyright © 2021 Jyoti1 Yadav. All rights reserved.
//

import UIKit
import WebKit


class EmbedVideo: UIViewController, WKUIDelegate {

    @IBOutlet var webPlayerView: UIView!
    
    var webView: WKWebView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.allowsInlineMediaPlayback = true
        
        DispatchQueue.main.async {
        
        
            self.webView = WKWebView(frame: self.webPlayerView.bounds, configuration: webConfiguration)
            self.webPlayerView.addSubview(self.webView)
        
        
 
        
        let myURL = URL(string:"https://www.youtube.com/embed/YE7VzlLtp-4?playsinline=1")
        let myRequest = URLRequest(url: myURL!)
        self.webView.load(myRequest)

        }
       
    }
    

    

}
//"https://www.youtube.com/embed/IQ1JiveuhvM\"
/*
 class WebView: UIViewController {
     @IBOutlet var webPlayerView: UIView!
     
     var webPlayer: WKWebView!
     
     override func viewDidLoad() {
         super.viewDidLoad()
         
         let webConfiguration = WKWebViewConfiguration()
         webConfiguration.allowsInlineMediaPlayback = true
         
         DispatchQueue.main.async {
             self.webPlayer = WKWebView(frame: self.webPlayerView.bounds, configuration: webConfiguration)
             self.webPlayerView.addSubview(self.webPlayer)
             
             guard let videoURL = URL(string: "https://www.youtube.com/embed/YE7VzlLtp-4?playsinline=1") else { return }
             let request = URLRequest(url: videoURL)
             self.webPlayer.load(request)
         }
     }
 }
 */
