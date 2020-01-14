//
//  Paint4ViewController.swift
//  Make4Comic
//
//  Created by 原田茂大 on 2020/01/14.
//  Copyright © 2020 geshi. All rights reserved.
//

import UIKit

//class Canvas4: UIView{
//
//
//
//    override func draw(_ rect: CGRect) {
//
//        super.draw(rect)
//
//        guard let context = UIGraphicsGetCurrentContext()else {
//
//            return
//        }
//
////        let startPoint = CGPoint(x: 0, y: 0)
////        let endPoint = CGPoint(x: 100, y: 100)
////
////        context.move(to: startPoint)
////        context.addLine(to: endPoint)
//
//        line.forEach { (p) in
//
//
//
//        }
//
//        context.setStrokeColor(UIColor.black.cgColor)
//        context.setLineWidth(5)
//        context.setLineCap(.round)
//
//        lines.forEach { (line) in
//
//            for (i, p) in line.enumerated(){
//                if i == 0{
//                    context.move(to: p)
//                }else{
//                    context.addLine(to: p)
//                }
//
//            }
//
//        }
//
//
//
//        context.strokePath()
//
//    }
//
//    var line = [CGPoint]()
//
//    var lines = [[CGPoint]]()
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        lines.append([CGPoint]())
//    }
//
//
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        guard var point = touches.first?.location(in: nil)else{
//            return
//        }
//        print("======")
//        print(point)
//        print("======")
//
//        print(self.frame.minX)
//
//        point.x -= self.frame.minX
//        point.y -= self.frame.minY
//
//        guard var lastLine = lines.popLast() else {
//            return
//        }
//        lastLine.append(point)
//        lines.append(lastLine)
//
////        var lastLine = lines.last
////        lastLine?.append(point)
//
//        line.append(point)
//
//        setNeedsDisplay()
//
//    }
//
//}

class Paint4ViewController: UIViewController {
    
    var text = String()
    
    
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var paintView: UIView!
    
    let canvas = Canvas()
    
//    override func loadView() {
//        self.view = canvas
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(canvas)
        canvas.backgroundColor = .red
        canvas.frame = paintView.frame
        
//        // 枠のカラー
//        paintView.layer.borderColor = UIColor.black.cgColor
//
//        // 枠の幅
//        paintView.layer.borderWidth = 5.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //受け取った値を代入
        label.text = text
        
    }
    
    @IBAction func didClickButton(_ sender: UIButton) {
        performSegue(withIdentifier: "share", sender: nil)
    }
    
    func handOver(_ word:String) {
        text = word
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "share" {
            let svc = segue.destination as! ShareViewController
            svc.text = label.text!
        }
    }
    
    
    
    
    
    

}
