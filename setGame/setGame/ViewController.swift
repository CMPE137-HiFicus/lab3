//
//  ViewController.swift
//  setGame
//
//  Created by Kham Tran on 9/30/19.
//  Copyright © 2019 Kham Tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.    let squar = viewSysbol()
        let squar = cardView(frame: CGRect(x: 100, y: 100, width: 300    , height: 300))
        
        view.addSubview(squar)
     
    }
    
    override func viewDidLayoutSubviews() {
        
     
   
    }
}

