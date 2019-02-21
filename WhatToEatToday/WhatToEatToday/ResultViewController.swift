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
        resultLabel.font = UIFont(name: "locus_sangsang", size: 42)
        Alamofire.request("http://memolease.ipdisk.co.kr:1337/foods", method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                
                for item in json.array! {
                    self.arrayList.append(item["content"].stringValue)
                }
                guard let menuOfRandom = self.arrayList.randomElement() else {
                    return
                }
                self.resultLabel.text = menuOfRandom
                self.resultImageView.image = UIImage(named: "cookie04")
                
                if let image = UIImage(named: "\(menuOfRandom)") {
                    self.resultImageView.image = image
                }
                
            case .failure(let error):
                print(error)
            }
        }

    }

}
