//
//  ViewController.swift
//  WhatToEatToday
//
//  Created by dely on 2019. 2. 21..
//  Copyright © 2019년 dely. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.font = UIFont(name: "locus_sangsang", size: 42)
        subTitleLabel.font = UIFont(name: "locus_sangsang", size: 18)
    }

}

