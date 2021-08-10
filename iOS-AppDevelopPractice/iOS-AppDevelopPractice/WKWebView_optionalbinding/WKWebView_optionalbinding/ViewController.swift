//
//  ViewController.swift
//  WKWebView_optionalbinding
//
//  Created by DGSW on 2021/08/10.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var WebViewMain: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        //1. url string
        //2. url -> request
        //3. req -> load
        
        let urlSting = "https://www.google.com"
        if let url = URL(string: urlSting){//unwrap - 옵셔널 바인딩
            let urlReq = URLRequest(url: url)
            WebViewMain.load(urlReq)
        }
    }
    
    var abc = "1"
    var abc1: String? = nil
    
    //Null Pointer Exception - java


}

