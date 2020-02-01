//
//  EditorViewController.swift
//  exam8
//
//  Created by Dmitry on 01/02/2020.
//  Copyright © 2020 Dmitry. All rights reserved.
//

import UIKit

class EditorViewController: UIViewController, UITextViewDelegate{

    @IBOutlet weak var text: UITextView!
    @IBOutlet weak var sentButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        text.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if let inputText = textView.text {
            if inputText.count > 0  {
                sentButton.isEnabled = true
            }
            if inputText.count == 0 {
                sentButton.isEnabled = false
            }
            
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toSendController" {
            let destinationVC = segue.destination as! SendViewController
            destinationVC.send = self.text.text
        }
    }
    
}


//extension EditorViewController: UITextViewDelegate {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        textView.delegate = self
//    }
//
//}
