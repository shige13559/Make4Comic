//
//  MainViewController.swift
//  Make4Comic
//
//  Created by 原田茂大 on 2020/01/14.
//  Copyright © 2020 geshi. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var text = String()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func didClickButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: "make", sender: nil)
        
    }
    
    
    
}
