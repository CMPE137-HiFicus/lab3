//
//  cardView.swift
//  setGame
//
//  Created by Kham Tran on 9/30/19.
//  Copyright © 2019 Kham Tran. All rights reserved.
//

import UIKit

class cardView: UIView {
    private var card1 = Card()
    private let color = CIColor.gray
    private var path = UIBezierPath()
//    var cards = cardList()
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.


    override init(frame: CGRect) {
        super.init(frame:frame)
        
        self.backgroundColor = UIColor.init(ciColor: color)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        drawCard(of: card1)
    }
    
    func getDraw(of card:Card){
        card1 = card
       
    }
  
  
   
    func getPoint(number:Int) -> CGRect{
        switch number {
        case 0:
            return CGRect(x:self.frame.width/4+(self.frame.width/4)/2, y:self.frame.height/4+(self.frame.height/4)/2, width:self.frame.width/3, height:self.frame.width/3)
        case 1:
            return CGRect(x: self.frame.width/4+(self.frame.width/4)/2, y: self.frame.height/6 - 20 + self.frame.height/6, width:  self.frame.width/3, height: self.frame.width/3)
        case 2:
            return CGRect(x: self.frame.width/4-10, y: self.frame.height/2 - 30  + self.frame.height/6, width:  self.frame.width/3, height: self.frame.width/3)
        case 3:
             return CGRect(x: self.frame.width/4+self.frame.width/4+10, y: self.frame.height/2 - 30 + self.frame.height/6, width:  self.frame.width/3, height: self.frame.width/3)
        default:
            return CGRect(x:0, y:0, width:self.frame.width, height:self.frame.height)
        }}

    func getSymbol(of card:Card, point:CGRect){
        switch card.cardSymbol {
        case "square":
                square(point: point)
        case "triangle":
            triangle(point: point)
        case "circle":
                circle(point: point)
            default:
                square(point: point)
            }
        }
    func getColor(of card:Card)-> CIColor{
        switch card.cardColor {
        case "red":
            return CIColor.red
        case "blue":
            return CIColor.blue
        case "green":
            return CIColor.green
        default:
            return CIColor.white
        }
    }
    func getShade(of card:Card){
        switch card.cardShade {
        case "stripe":
            fillColor(of: getColor(of: card))
            stripe(of: color)
        case "stroke":
            stroke(of: getColor(of: card))
        case "fill":
            fillColor(of: getColor(of: card))
        default:
            fillColor(of: getColor(of: card))
        }
    }

    func drawCard(of card:Card){
        switch card.cardNumber {
        case "one":
            getSymbol(of: card,point: getPoint(number: 0))
            getShade(of: card)
        case "two":
            getSymbol(of: card, point: getPoint(number: 3))
            getSymbol(of: card, point: getPoint(number: 2))
             getShade(of: card)
        case "three":
            getSymbol(of: card, point: getPoint(number: 1))
            getSymbol(of: card, point: getPoint(number: 2))
            getSymbol(of: card, point: getPoint(number: 3))
            getShade(of: card)
        default:
            getSymbol(of: card, point: getPoint(number: 4))
             getShade(of: card)
        }
    }
    func square(point: CGRect){
        path.move(to: CGPoint(x: point.minX, y: point.minY))
        path.addLine(to: CGPoint(x: point.maxX, y: point.minY))
        path.addLine(to: CGPoint(x: point.maxX, y: point.maxY))
        path.addLine(to: CGPoint(x: point.minX, y: point.maxY))
        path.close()
    }
    
    func circle(point:CGRect){
         path.move(to: CGPoint(x: point.midX, y: point.midY))
        path.addArc(withCenter: CGPoint(x: point.midX, y: point.midY), radius: CGFloat(point.width/2), startAngle: 0, endAngle: 360, clockwise: true)
        path.close()
    }
    func triangle(point:CGRect){
        path.move(to: CGPoint(x:point.midX, y: point.minY))
        path.addLine(to: CGPoint(x: point.minX, y: point.maxY))
        path.addLine(to: CGPoint(x: point.maxX, y: point.maxY))
        path.close()
    
    }
    func stripe(of : CIColor){
        path.lineWidth = 2
        for  num in stride(from: 0, through: Int(self.frame.height), by: 5){
            path.move(to: CGPoint(x: 0, y: num))
            path.addLine(to: CGPoint(x: Int(self.frame.width), y: num))
        }
        UIColor.init(ciColor: of).setStroke()
        path.stroke()
    }
    func fillColor(of: CIColor){
        UIColor.init(ciColor: of).setFill()
        path.fill()
    }
    func stroke(of: CIColor){
        path.lineWidth = 5
        UIColor.init(ciColor: of).setStroke()
               path.stroke()
    }

    
    }

