//
//  WebViewViewController.swift
//  Aeth_Analytica_MachineTest
//
//  Created by shahid panchily on 31/03/21.
//

import UIKit
import WebKit

class WebViewViewController: UIViewController {
    
    var arrayUrl : String?
    
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.load(URLRequest(url: URL(string: arrayUrl!)!))

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
