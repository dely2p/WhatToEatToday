//
//  ResultViewController.swift
//  WhatToEatToday
//
//  Created by dely on 2019. 2. 21..
//  Copyright © 2019년 dely. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class ResultViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultImageView: UIImageView!
    
    var arrayList = Array<String>()
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("http://memolease.ipdisk.co.kr:1337/foods", method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                
                for item in json.array! {
                    self.arrayList.append(item["content"].stringValue)
                }
                self.resultLabel.text = self.arrayList.randomElement()!
                
            case .failure(let error):
                print(error)
            }
        }

    }

}
