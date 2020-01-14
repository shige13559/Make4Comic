//
//  Canvas.swift
//  Make4Comic
//
//  Created by 原田茂大 on 2020/01/14.
//  Copyright © 2020 geshi. All rights reserved.
//

import UIKit

class Canvas: UIView{
    
    func undo(){
        
        _ = lines.popLast()
        setNeedsDisplay()
        
    }
    var lines = [[CGPoint]]()
    
    
    
    override func draw(_ rect: CGRect) {
        
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext()else {
            
            return
        }
        
//        let startPoint = CGPoint(x: 0, y: 0)
//        let endPoint = CGPoint(x: 100, y: 100)
//
//        context.move(to: startPoint)
//        context.addLine(to: endPoint)
        
        line.forEach { (p) in
            
            
            
        }
        
        context.setStrokeColor(UIColor.black.cgColor)
        context.setLineWidth(5)
        context.setLineCap(.round)
        
        lines.forEach { (line) in
            
            for (i, p) in line.enumerated(){
                if i == 0{
                    context.move(to: p)
                }else{
                    context.addLine(to: p)
                }
                
            }
            
        }
        
        
        
        context.strokePath()
        
    }
    
    var line = [CGPoint]()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append([CGPoint]())
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard var point = touches.first?.location(in: nil)else{
            return
        }
        print("======")
        print(point)
        print("======")
        
        print(self.frame.minX)
        
        point.x -= self.frame.minX
        point.y -= self.frame.minY
        
        guard var lastLine = lines.popLast() else {
            return
        }
        lastLine.append(point)
        lines.append(lastLine)
        
//        var lastLine = lines.last
//        lastLine?.append(point)
        
        line.append(point)
        
        setNeedsDisplay()
        
    }
    
}
