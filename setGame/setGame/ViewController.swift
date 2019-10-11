//
//  ViewController.swift
//  setGame
//
//  Created by Kham Tran on 9/30/19.
//  Copyright © 2019 Kham Tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var cards = cardList()
    @IBOutlet var views: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBOutlet weak var test: cardView!
    @IBAction func startSetGame(_ sender: Any) {
        var x = 0.0
        for card in 0 ... views.count - 1 {
            let view1 = cardView(frame:CGRect(x: views[card].frame.minX, y: views[card].frame.minY + views[card].superview!.frame.minY, width: views[card].frame.width, height: views[card].frame.height))
            x += 20
        view1.getDraw(of: cards.getCard(index:card + 1))
            view.addSubview(view1)
            print(Int(views[card].superview!.frame.minX))
            print(Int(views[card].superview!.frame.minY))
    }
        
//        let view1 = cardView(frame: CGRect(x: 99, y: 0, width: 100, height: 100))
//        view1.getDraw(of: cards.getCard(index: 1))
//        view.addSubview(view1)
    }
}

