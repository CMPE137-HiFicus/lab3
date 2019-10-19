//
//  Card.swift
//  set game
//
//  Created by KhamTran on 9/9/19.
//  Copyright © 2019 KhamTran. All rights reserved.
//

import Foundation
struct Card:Equatable{
    static func == (lh:Card , rh:Card) ->Bool		{
        return lh.cardColor == rh.cardColor &&
            lh.cardShade == rh.cardShade &&
            lh.cardNumber == rh.cardNumber &&
            lh.cardSymbol == rh.cardSymbol
    }
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

    
