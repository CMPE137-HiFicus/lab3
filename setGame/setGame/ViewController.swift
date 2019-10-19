//
//  ViewController.swift
//  setGame
//
//  Created by Kham Tran on 9/30/19.
//  Copyright © 2019 Kham Tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var startButton = true
    private var resize = true
    private var pointer = 0
    private var listOfCards = Array(repeating: Card(), count: 24)
    private var listOfAppearCard:[Card] = []
    var cards = cardList()
    @IBOutlet var views: [UIView]!
    
  

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func checkIntersect(view: UIView) -> Bool {
        let index = views.firstIndex(of: view)
        if view.bounds.contains(CGPoint(x: views[index!-1].bounds.maxX, y: views[index!-1].bounds.maxY)){
            
        }
        return false
    }
    
    @IBAction func startSetGame(sender: Any) {
        var count = 0
        if startButton == true{
        while count<12{
            
            let card = views.random()
            if card.isOpaque != false{
                card.transform = CGAffineTransform(scaleX: CGFloat(1.2), y: CGFloat(1.2))
                var cardsubView = cardView(frame:CGRect(x: card.bounds.width/25, y:card.bounds.height/25, width: card.bounds.width-5, height: card.bounds.height-5))
                cardsubView.getDraw(of: cards.getCard(index: 0))
                listOfCards[Int?(views.firstIndex(of: card)!)!] = cards.getCard(index: 0)
                cards.deleteCard(index: 0)
                card.addSubview(cardsubView)
                card.isOpaque = false
                count += 1
               
            }
        }
        startButton = false
    }
}
    func chooseCard(sender:UITapGestureRecognizer){
        let temp = listOfCards[Int?(views.firstIndex(of: sender.view!)!)!]
        if sender.view!.isOpaque == false{
            if sender.view!.backgroundColor !== UIColor.blue{
                sender.view!.backgroundColor = UIColor.blue
                listOfAppearCard.append(temp)
            
            }
            else {
                sender.view!.backgroundColor = UIColor.white
                listOfAppearCard.remove(at:  Int?(listOfAppearCard.firstIndex(of: temp)!)!)
               
            }
        }
    }

    @IBAction func handleTap(_ sender: UITapGestureRecognizer) {
        chooseCard(sender: sender)
       
        print(Int?(listOfAppearCard.count)!)
       
}
    func add3More(){
        var count = 0
         while count<3{
                   let card = views.random()
                   if card.isOpaque != false{
                       var cardsubView = cardView(frame:CGRect(x: card.bounds.width/25, y:card.bounds.height/25, width: card.bounds.width-5, height: card.bounds.height-5))
                       cardsubView.getDraw(of: cards.getCard(index: 0))
                    listOfCards[Int(views.firstIndex(of: card)!)] = cards.getCard(index: 0)
                    cards.deleteCard(index: 0)
                       card.addSubview(cardsubView)
                       card.isOpaque = false
                       count += 1
                   
                   }
               }
    }
    @IBAction func addViews(_ sender: Any) {
        if resize == true{
        for card in views{
            if card.isOpaque == false{
                UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                    card.transform = CGAffineTransform(scaleX: CGFloat(1.0), y: CGFloat(1.0))
                }, completion: {finished in })
            }
        }
            add3More()
            resize = false
        }else{
            add3More()
        }
    }
}

extension Array{
    func random()-> Element{
        return self[Int(arc4random_uniform(UInt32(self.count)))]
    }
}


