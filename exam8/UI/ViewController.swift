//
//  ViewController.swift
//  exam8
//
//  Created by Dmitry on 01/02/2020.
//  Copyright © 2020 Dmitry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func tapButtonSend(_ sender: UIButton) {
        PastebinAPI.shared.sendText("test")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
