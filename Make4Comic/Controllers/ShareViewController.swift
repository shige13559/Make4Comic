//
//  ShareViewController.swift
//  Make4Comic
//
//  Created by 原田茂大 on 2020/01/14.
//  Copyright © 2020 geshi. All rights reserved.
//

import UIKit

class ShareViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var imageView2: UIImageView!
    
    @IBOutlet weak var imageView3: UIImageView!
    
    @IBOutlet weak var imageView4: UIImageView!
    
    
    var text = String()
    
    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        label.text = text
        
        var appDelegate = UIApplication.shared.delegate as! AppDelegate
        imageView.image = appDelegate.image1
        
//        appDelegate = UIApplication.shared.delegate as! AppDelegate
        imageView2.image = appDelegate.image2
        
//        appDelegate = UIApplication.shared.delegate as! AppDelegate
        imageView3.image = appDelegate.image3
        
//        appDelegate = UIApplication.shared.delegate as! AppDelegate
        imageView4.image = appDelegate.image4
        
        
    }
    

    @IBAction func shareButton(_ sender: UIButton) {
        
//        //シェア用の画面作成
//        let shareController = UIActivityViewController(activityItems: [imageView.image], applicationActivities: nil)


//        //作成した画面を表示
//        present(shareController, animated: true, completion: nil)
        
        
        
        
        // キャプチャしたい枠を決める
        let rect = view.bounds
        
        
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        
        // ここでtrueを指定しないと、画面が変わった時に再キャプチャできない
        view.drawHierarchy(in: rect, afterScreenUpdates: true)
        
        let cont = UIGraphicsGetCurrentContext()
        view.layer.render(in: cont!)
        
        // キャプチャした画像を変数に保持
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        let activityItems = [image!]
        
        // 初期化処理
        let activityVC = UIActivityViewController(activityItems: activityItems as [Any], applicationActivities: nil)
        
        
        // UIActivityViewControllerを表示
        self.present(activityVC, animated: true, completion: nil)
        
        
    }
    
    
    @IBAction func backHomeButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: "backHome", sender: nil)
        
    }
    
    
    
    
    
    

}


