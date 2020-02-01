//
//  SendViewController.swift
//  exam8
//
//  Created by Dmitry on 01/02/2020.
//  Copyright © 2020 Dmitry. All rights reserved.
//

import UIKit

class SendViewController: UIViewController {
    
    var send: String?
    
    @IBAction func tapButtonSend(_ sender: UIButton) {
        
        if let sendText = send{
            
            PastebinAPI.shared.sendText(sendText) { (result) in
                
                switch result {
                case .success(let url): print(url)
                case .failure(let err): print(err)
                }
                
            }
        }
        

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        }


}

