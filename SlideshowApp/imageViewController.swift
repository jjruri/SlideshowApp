//
//  imageViewController.swift
//  SlideshowApp
//
//  Created by 佐藤淳哉 on 2020/01/13.
//  Copyright © 2020 Junya.Satou. All rights reserved.
//

import UIKit

class imageViewController: UIViewController {

    @IBOutlet weak var imagespace2: UIImageView!
    
    var slidenum2:Int = 0
    let slidestate = [UIImage(named: "image1.jpg")!,UIImage(named: "image2.jpg")!,UIImage(named: "image3.jpeg")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imagespace2.image = slidestate[slidenum2]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
