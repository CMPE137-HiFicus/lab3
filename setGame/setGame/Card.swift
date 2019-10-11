//
//  Card.swift
//  set game
//
//  Created by KhamTran on 9/9/19.
//  Copyright © 2019 KhamTran. All rights reserved.
//

import Foundation
struct Card{
 
    var cardColor:String
    var cardSymbol:String
    var cardNumber:String
    var cardShade:String
    init() {
        cardColor = ""
        cardNumber = ""
        cardSymbol  = ""
        cardShade = ""
    }
    init(color:String,number:String,symbol:String,shade:String) {
        cardColor = color
        cardNumber = number
        cardSymbol = symbol
        cardShade = shade
    }
    let colorArray = ["red","blue","green"]
    let shadeArray = ["stripe","stroke","fill"]
    let symbolArray = ["square","circle","triangle"]
    let numberArray = ["one","two","three"]
}
//    enum cardColor{
//        case red
//        case green
//        case blue
//        case b
//        static var allValues = [red, green, blue]
//    }
//    enum cardSymbol{
//        case triangle
//        case circle
//        case square
//        case c
//        static var allValue = [triangle,circle,square]
//    }
//    
//    enum cardNumber{
//        case one
//        case two
//        case three
//        case d
//        static var allValues = [one,two,three]
//    }
//    
//    enum cardShade {
//        case solid
//        case striped
//        case open
//        case e
//        static var allValues = [solid,striped,open]
//    }
    
