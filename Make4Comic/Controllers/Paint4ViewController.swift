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
    
    var timer = Timer()
    var seconds = 5
    
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var paintView: UIView!
    
    let canvas = Canvas()
    
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
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(Clock), userInfo: nil, repeats: true)
        timeLabel.font = UIFont.init(name: "aria", size: 48)
        timeLabel.textAlignment = .center
        timeLabel.textColor = .black
        timeLabel.backgroundColor = .blue
        self.view.addSubview(timeLabel)
        Timer.scheduledTimer(withTimeInterval: 8, repeats: false) {_ in
//            self.label.text = "お願いします"
            self.performSegue(withIdentifier: "share", sender: nil)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //受け取った値を代入
        label.text = text
    }
    
    @objc func Clock(){
        
        seconds = seconds - 1
        timeLabel.text = String(seconds)
        

        if (seconds == 0){
            timeLabel.backgroundColor = .red
            timeLabel.text = "Times UP　次の人に渡してください"
            timer.invalidate()
            print(timeLabel)
        }
        
        
    }
    
    @IBAction func undoButton(_ sender: UIButton) {
            undoManager?.undo()
    //        counter.increment()
    //        counter.manager.undo()
            undoManager?.registerUndo(withTarget: self, handler: { (targetSelf) in
                targetSelf.handleUndo()
            })
        }
        
        
        
        @objc fileprivate func handleUndo(){
            print("Delate")
            canvas.undo()
        }
        
        
        @IBAction func clearButton(_ sender: UIButton) {
            canvas.clear()
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
