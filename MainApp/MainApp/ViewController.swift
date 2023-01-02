//
//  ViewController.swift
//  MainApp
//
//  Created by Sadık Çoban on 3.01.2023.
//

import UIKit
import CustomAppLogger

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        CustomAppLogger.log("this is an info log")
        CustomAppLogger.log("this is a warning log", type: .warn)
        CustomAppLogger.log("this is an error log", type: .error)
    }


}

