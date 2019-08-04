//
//  WebViewViewController.swift
//  HomeLoginSwift
//
//  Created by Apostol, Alexandru on 04/08/2019.
//  Copyright © 2019 Apostol, Alexandru. All rights reserved.
//

import UIKit
import WebKit

class WebViewViewController: UIViewController , WKUIDelegate{
    
    
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.uiDelegate = self
        

        let request = URLRequest(url: URL(string: "https://google.com")!)
        
        self.webView?.load(request)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
