//
//  ViewController.swift
//  ResponseLoader
//
//  Created by KazimAhmad on 04/02/2019.
//  Copyright © 2019 self. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func showLoader(_ sender: UIBarButtonItem) {
        ProgressView.shared.showActivity(self.view, "Loading Data")
    }
    @IBAction func removeLoader(_ sender: UIBarButtonItem) {
        ProgressView.shared.removeActivity(self.view)
    }
    
}

