//
//  CollectionViewCell.swift
//  setGame
//
//  Created by Kham Tran on 10/7/19.
//  Copyright © 2019 Kham Tran. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    let cards = cardList()
    let squar = cardView(frame: CGRect(x: 100, y: 100, width: 300    , height: 300))
    override func draw(_ rect: CGRect) {
        squar.drawCard(of: cards.getCard(index: 15))
    }
}
