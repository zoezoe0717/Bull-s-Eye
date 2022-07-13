//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Zoe on 2022/7/11.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var webView:UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let htmlPath = Bundle.main.path(forResource: "BullsEye", ofType: "html"){
            let url = URL(fileURLWithPath: htmlPath)
            let request = URLRequest(url: url)
            webView.loadRequest(request)
        }
    }
    
    @IBAction func close(){
        dismiss(animated: true, completion: nil)
    }
}
