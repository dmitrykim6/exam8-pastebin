//
//  SendViewController.swift
//  exam8
//
//  Created by Dmitry on 01/02/2020.
//  Copyright © 2020 Dmitry. All rights reserved.
//

import UIKit

class SendViewController: UIViewController {
    
    let allExpireDate = ["N", "10M", "1H", "1D", "1W", "2W", "1M", "6M", "1Y"]
    var expDate = "1H"
    var send: String?
    var titleLabelText: String? = nil
    
    @IBOutlet weak var titleLabel: UITextField!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var timeIntervalPicker: UIPickerView!
    @IBOutlet weak var correctAnswer: UILabel!
    
    @IBAction func tapButtonSend(_ sender: UIButton) {
        
        self.titleLabelText = titleLabel.text
        
        if let sendText = send {
            
            self.spinner.startAnimating()
            self.sendButton.isEnabled = false
            
            PastebinAPI.shared.sendText(sendText, title: self.titleLabelText, expDate: self.expDate) { (result) in
                
                DispatchQueue.main.async {
                    self.spinner.stopAnimating()
                    self.sendButton.isEnabled = true
                }
                
                switch result {
                case .success(let url):
                    print(url)
                    self.correctAnswer.text = "https://pastebin.com\(url.path)"
                    
                case .failure(let err): print(err)
                }
                
            }
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UIPickerView config
        timeIntervalPicker.delegate = self
        
        }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        timeIntervalPicker.selectRow(2, inComponent: 0, animated: true)
        
    }

}


extension SendViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return allExpireDate.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return allExpireDate[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        self.expDate = allExpireDate[row]
//        print(self.expDate)
    }

    
    
}
