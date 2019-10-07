//
//  Card.swift
//  set game
//
//  Created by KhamTran on 9/9/19.
//  Copyright © 2019 KhamTran. All rights reserved.
//

import Foundation
struct Card{
    
    
    var idNum = 0
    let cardColor:cardColor
    let cardSymbol:cardSymbol
    let cardNumber:cardNumber
    let cardShade:cardShade
}
    enum cardColor{
        case red
        case green
        case blue
        static let allValues = [red, green, blue]
    }
    enum cardSymbol{
        case triangle
        case circle
        case square
        static let allValue = [triangle,circle,square]
    }
    
    enum cardNumber{
        case one
        case two
        case three
        static let allValues = [one,two,three]
    }
    
    enum cardShade {
        case solid
        case striped
        case open
        static let allValues = [solid,striped,open]
    }
    
