//
//  ViewController.swift
//  SlideshowApp.
//
//  Created by UCHIYAMA_HIROKAZU on 2019/11/24.
//  Copyright © 2019 uchiyama_hirokazu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var switchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "image1.jpg")
        imageView.image = image
        
    }
    
    //// 表示している画像の番号を元に画像を表示する
    
    var displayImageNo = 0
    var imageNameArray = ["image1.jpg","image2.jpg","image3.jpg"]
        
    func displayImage(){
        let name = imageNameArray[displayImageNo]
        let image = UIImage(named:name)
        imageView.image = image
    }
    
    /*もし、displayイメージの番号がイメージ名の配列数字（０,1,2）より
     小さかったら、displayイメージナンバーに+1の動作を
     else（それ以外の場合は、0に戻して動作はdisplayImage()関数を実行せよ*/
    
    
    @IBAction func nextButtonTap(_ sender: Any) {
        if displayImageNo < imageNameArray.count - 1{
            displayImageNo += 1
            displayImage()
        }else{
            displayImageNo = 0
            displayImage()
        }
        
    }
    
    /*もし、displayイメージの番号が1より大きい尚且つ
     imageNameArray.count - 1※2よりdisplayイメージの番号がより小さかったら
     displayイメージナンバーに-1の動作を
     else（それ以外の場合は、 imageNameArray.count - 1(※2全部で0.1.2なので)に戻して動作はdisplayImage()関数を実行せよ*/
    
    
    @IBAction func backButtonTap(_ sender: Any) {
        
        if displayImageNo >= 1 && displayImageNo <= imageNameArray.count - 1{
            
            displayImageNo -= 1
            displayImage()
        }else{
            displayImageNo = imageNameArray.count - 1
            displayImage()
        }
    }
    
    var timer: Timer!
    
    @IBAction func switchButtonTap(_ sender: Any) {
        
        if self.timer == nil {
        self.timer = Timer.scheduledTimer(timeInterval: 2.0,target: self, selector:#selector(updateTimer(_:)), userInfo: nil, repeats: true)
        nextButton.isEnabled = false
        backButton.isEnabled = false
        switchButton.setTitle("停止", for: .normal)
            self.view.backgroundColor = UIColor.lightGray
            
        } else if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
            nextButton.isEnabled = true
            backButton.isEnabled = true
            switchButton.setTitle("再生", for: .normal)
            self.view.backgroundColor = UIColor.white
    
        }
    }
    @objc func updateTimer(_ timer: Timer) {
        if displayImageNo < imageNameArray.count - 1 {
            displayImageNo += 1
            displayImage()
            print(displayImageNo)
        } else {
            displayImageNo = 0
            displayImage()
            print(displayImageNo)
        }
}
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        
    }
    
    
    @IBAction func imageViewTapd(_ sender: Any) {
        self.performSegue(withIdentifier: "toZoomIn", sender: nil)

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let ViewController2:ViewController2 = segue.destination as! ViewController2
        let name = imageNameArray[displayImageNo]
        let image = UIImage(named: name)
        ViewController2.selectedImg = image
        if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
            nextButton.isEnabled = true
            backButton.isEnabled = true
            switchButton.setTitle("再生/停止", for: .normal)
            self.view.backgroundColor = UIColor.white
        
    }
    
    }
    
    
    
}
