//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 佐藤淳哉 on 2020/01/12.
//  Copyright © 2020 Junya.Satou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //画像領域を設定する
    @IBOutlet weak var imagespace: UIImageView!
    
    // タップでボタンの制御をするためにボタンをoutlet接続しとく
    @IBOutlet weak var bkbutton: UIButton!
    @IBOutlet weak var autobutton: UIButton!
    @IBOutlet weak var fwbutton: UIButton!
    
    //スライド用変数を用意
    var slidenum:Int = 0
    let slidestate = [UIImage(named: "image1")!,UIImage(named: "image2")!,UIImage(named: "image3")!]
    
    //スライド用メソッドを用意
    func slideskip(a:Int){
        slidenum = a
        imagespace.image = slidestate[slidenum]
    }
    
    func slide(b:Int){
        slidenum = slidenum + b
        imagespace.image = slidestate[slidenum]
    }
    
    
    //ロード時に初期値を入れる
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        slideskip(a: 0)
        autobutton.setTitle("再生/停止", for: .normal)
    }

    
    //進むボタンを実装する
    @IBAction func next(_ sender: UIButton) {
        if slidenum == slidestate.count - 1  {
            slideskip(a: 0)
        }
        else {
            slide(b: 1)
        }
    }
    
    //戻るボタンを設定する
    @IBAction func back(_ sender: UIButton) {
        if slidenum == 0 {
            slidenum = slidestate.count - 1
            imagespace.image = slidestate[slidenum]
        }
        else {
            slide(b: -1)
        }
    }
    


    //自動再生停止ボタン用のタイマーを用意する
       var timer: Timer!
       
       //２秒に一度呼び出される自動スライド用のfuncを先につくる
       @objc func autoslide(_timer:Timer){
           if slidenum == slidestate.count - 1 {
               slideskip(a: 0)
           }
           else  {
               slide(b: 1)
           }
       }

       //自動再生/停止が押された時の設定
    @IBAction func autostop(_ sender: UIButton) {
        if timer == nil {
            timer =  Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(autoslide(_timer:)), userInfo: nil, repeats: true)
            sender.setTitle("停止", for: .normal)
            bkbutton.isEnabled = false
            fwbutton.isEnabled = false
        }
        else {
            timer.invalidate()
            timer = nil
            sender.setTitle("再生", for: .normal)
            bkbutton.isEnabled = true
            fwbutton.isEnabled = true
        }
    }
    
    //画像をタップした時の挙動をつくる
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let selectimage : imageViewController = segue.destination as! imageViewController
        selectimage.slidenum2 = slidenum
        if timer == nil {}
            else {
                timer.invalidate()
                timer = nil
            autobutton.setTitle("再生", for: .normal)
            bkbutton.isEnabled = true
            fwbutton.isEnabled = true
            }
        }
    
    //戻るボタンの実装
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
}

