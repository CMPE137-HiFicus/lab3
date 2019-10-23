//
//  ViewController.swift
//  setGame
//
//  Created by Kham Tran on 9/30/19.
//  Copyright © 2019 Kham Tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var isfull = 0
    private var startButton = true
    private var resize = true
    private var initCard = Card()
    private var listOfCards = Array(repeating: Card(), count: 24)
    private var listOfAppearCard:[Card] = []
    private var cards = cardList()
    @IBOutlet var views: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    private func isSet()  {
        for card in listOfAppearCard{
          let index = Int?(listOfCards.firstIndex(of: card)!)!
            listOfCards[index] = Card()
            if !views[index].subviews.isEmpty{
                views[index].subviews[0].removeFromSuperview()}
            views[index].backgroundColor = UIColor.white
            views[index].isOpaque = true
        }
        isfull -= 3
    }
    
    @IBAction func startSetGame(sender: Any) {
        var count = 0
        if startButton == true{
        while count<12{
            let card = views.random()
            if card.subviews.isEmpty{
            if card.isOpaque != false{
                card.transform = CGAffineTransform(scaleX: CGFloat(1.2), y: CGFloat(1.2))
               let cardsubView = cardView(frame:CGRect(x: card.bounds.width/25, y:card.bounds.height/25, width: card.bounds.width-5, height: card.bounds.height-5))
                cardsubView.getDraw(of: cards.getCard(index: 0))
                listOfCards[Int?(views.firstIndex(of: card)!)!] = cards.getCard(index: 0)
                cards.deleteCard(index: 0)
                card.addSubview(cardsubView)
                card.isOpaque = false
                count += 1
                }
                isfull += 1
            }
            
        }
        startButton = false
    }
}
    
    @IBAction func reStart(_ sender: Any) {
        cards = cardList()
        listOfCards.removeAll()
        for _ in 0 ... 23{
            listOfCards.append(initCard)
        }
        listOfAppearCard.removeAll()
        for card in views{
            if !card.subviews.isEmpty{
            card.subviews[0].removeFromSuperview()
            }
            if card.isOpaque == false{
                    card.isOpaque = true}
        }
        resize = true
        isfull = 0
        startButton = true
       
    }
    func chooseCard(sender:UITapGestureRecognizer){
       
        let temp = listOfCards[Int?(views.firstIndex(of: sender.view!)!)!]
        if listOfAppearCard.count != 3{
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
        }else {
            if cards.isSet(set: listOfAppearCard) == true{
                isSet()
                listOfAppearCard.removeAll()
            }
            else {
                for card in listOfAppearCard{
                    let index = Int?(listOfCards.firstIndex(of: card)!)!
                    views[index].backgroundColor = UIColor.white
                }
                listOfAppearCard.removeAll()
            }
        }
    }
    
    @IBAction func handleTap(_ sender: UITapGestureRecognizer) {
        if cards.list.count != 0 {
        chooseCard(sender: sender)
//        print(listOfCards[Int?(views.firstIndex(of: sender.view!)!)!].cardColor)
//        print(listOfCards[Int?(views.firstIndex(of: sender.view!)!)!].cardShade)
//        print(listOfCards[Int?(views.firstIndex(of: sender.view!)!)!].cardNumber)
//        print(listOfCards[Int?(views.firstIndex(of: sender.view!)!)!].cardSymbol)
        }}
    func add3More(){
        var count = 0
        if isfull < 24 {
         while count<3{
                   let card = views.random()
               if card.subviews.isEmpty{
                   if card.isOpaque != false{
                    let cardsubView = cardView(frame:CGRect(x: card.bounds.width/25, y:card.bounds.height/25, width: card.bounds.width-5, height: card.bounds.height-5))
                       cardsubView.getDraw(of: cards.getCard(index: 0))
                    listOfCards[Int(views.firstIndex(of: card)!)] = cards.getCard(index: 0)
                    cards.deleteCard(index: 0)
                       card.addSubview(cardsubView)
                       card.isOpaque = false
                       count += 1
                   }
                 isfull += 1
               }
               else { print("")}
           
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



