//
//  cardList.swift
//  set game
//
//  Created by KhamTran on 9/8/19.
//  Copyright © 2019 KhamTran. All rights reserved.
//

import Foundation
class cardList
{
    var temp = Card()
     var list:[Card]
    init()
    {
        list = [Card]()
        getCombination()
        list = list.shuffled()
       
    }
   internal func getCombination()
     {
        for color in temp.colorArray
        {
            for number in temp.numberArray
            {
                for symbol in temp.symbolArray
                {
                    for shading in temp.shadeArray
                    {
                        let card = Card(color: color,number: number,symbol: symbol,shade: shading)
                        list.append(card)
                    }
                }
            }
        }
      }
    func sameColor(set: [Card])-> Bool{
        if (set[0].cardColor == set[1].cardColor && set[0].cardColor == set[2].cardColor && set[1].cardColor == set[2].cardColor) { return true}
        else {return false}
    }
    
    func sametShade(set:[Card]) -> Bool {
        if (set[0].cardShade == set[1].cardShade && set[0].cardShade == set[2].cardShade && set[1].cardShade == set[2].cardShade) { return true}
        else {return false}
    }
    
    func sameNumber(set: [Card])-> Bool {
        if (set[0].cardNumber == set[1].cardNumber && set[0].cardNumber == set[2].cardNumber && set[1].cardNumber == set[2].cardNumber) { return true}
            
        else {return false}
    }
    
    func sameSymbol(set: [Card]) -> Bool {
        if (set[0].cardSymbol == set[1].cardSymbol && set[0].cardSymbol == set[2].cardSymbol && set[1].cardSymbol == set[2].cardSymbol){ return true}
            
        else {return false}
    }
    
    func isSet(set:[Card]) -> Bool {
        if (!sameColor(set: set) && !sameNumber(set: set) && !sametShade(set: set) && !sameSymbol(set: set)) {return true}
//        else if (sameNumber(set: set) && !sameColor(set: set) && !sametShade(set: set) && !sameSymbol(set: set)) {return true}
//        else if (!sameNumber(set: set) && !sameColor(set: set) && !sametShade(set: set) && sameSymbol(set: set)) {return true}
        
        else { return false}
    }
    
    func getCard(index:Int)->Card
    {
        return list[index]
    }
    func deleteCard(index:Int)
    {
        list.remove(at: index)
    }
}
