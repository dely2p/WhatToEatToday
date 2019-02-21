//
//  PostMenuViewController.swift
//  WhatToEatToday
//
//  Created by dely on 2019. 2. 21..
//  Copyright © 2019년 dely. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class PostMenuViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var menuTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        menuTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        Alamofire.request("http://memolease.ipdisk.co.kr:1337/foods", method: .post, parameters: ["content" : self.menuTextField.text!]).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
            case .failure(let error):
                print(error)
            }
        }
        menuTextField.text = ""
        return true
    }
    
}
