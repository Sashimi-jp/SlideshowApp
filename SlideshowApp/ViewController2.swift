//
//  ViewController2.swift
//  SlideshowApp.
//
//  Created by UCHIYAMA_HIROKAZU on 2019/12/01.
//  Copyright © 2019 uchiyama_hirokazu. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        ImageView2.image = selectedImg
    
    }
    

    @IBOutlet weak var ImageView2: UIImageView!
    
    
    var selectedImg:UIImage?

}
