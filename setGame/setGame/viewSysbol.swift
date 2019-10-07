//
//  viewSysbol.swift
//  setGame
//
//  Created by Kham Tran on 9/30/19.
//  Copyright © 2019 Kham Tran. All rights reserved.
//

import UIKit
class viewSysbol: UIView {

//    override init(frame: CGRect) {
//        super.init(frame: frame	)
//        self.backgroundColor = UIColor.clear
//
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    
    var path = UIBezierPath()
    func square(){
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: self.frame.width, y: 0))
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        path.addLine(to: CGPoint(x: 0, y: self.frame.height))
        path.close()
    }
    
    func circle(){
        path = 	UIBezierPath(ovalIn: CGRect(x: (self.frame.width/2 - self.frame.height/2), y: 0, width: self.frame.height, height: self.frame.height))
    }
    func triangle(){
        path.move(to: CGPoint(x: self.frame.width/2, y: 0))
        path.addLine(to: CGPoint(x: 0, y: self.frame.height))
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        path.close()
    
    }
    func stripe(of : CIColor){
        path.lineWidth = 3
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
    func position(of: CGRect){
        self.bounds = of
    }

    
}
