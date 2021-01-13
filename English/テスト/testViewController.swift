//
//  testViewController.swift
//  English
//
//  Created by 森下大地 on 2020/12/15.
//

import UIKit

class testViewController: UIViewController {
    @IBOutlet weak var testWord: UILabel!
    @IBOutlet weak var testMeaning: UILabel!
    @IBOutlet weak var testView: UIView!
    @IBOutlet weak var testLabel: UILabel!
    
    var passedId = Int()
    var baseTest = [""]
    var baseTestMeanig = [""]
    var Test = ["":""]
    
    var baseArray1: [String] = [ "abandon","abolish","absorb","accelerate"]
    
    var baseArray2: [String] = ["捨てる","廃止する","吸収する","促進する"]
    
    var baseArray3: [String] = ["abuse","access","accord","acquaintance"]
    
    var baseArray4: [String] = ["虐待","利用する権利","一致/合意","知人"]
    
    var baseArray5: [String] = ["（not）necessarily","abruptly","absolutely","abstract"]
    
    var baseArray6: [String] = ["必ずしも〜でない","不意に","絶対に","抽象的な"]
    
    var Array1 = ["abandon":"捨てる","abolish":"廃止する", "absorb:": "吸収する","accelerate":"促進する" ]
    
  
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        testLabel.text = "\(passedId)"
        
        if passedId == 0 {
            baseTest = baseArray1
            baseTestMeanig = baseArray2
        }else if passedId == 1{
            baseTest = baseArray3
            baseTestMeanig = baseArray4
        }else if passedId == 2{
            baseTest = baseArray5
            baseTestMeanig = baseArray6
        }
        
        
        
        testView.isUserInteractionEnabled = true

        testWord.text = baseTest[index]
        testMeaning.text = baseTestMeanig[index]
        testMeaning.isHidden  = true
        
       
        
        
        
        //スワイプアクションの設定 labelではなくViewが動作に反応するようになっている。
            
            let Swiperight = UISwipeGestureRecognizer()
            let Swipeleft = UISwipeGestureRecognizer()
            
            //このジェスチャレコグナイザのスワイプの許可された方向
            Swiperight.direction = .right
            Swipeleft.direction = .left
            
            //スワイプアクションができるように取得する。
            self.testView.addGestureRecognizer(Swiperight)
            self.testView.addGestureRecognizer(Swipeleft)
            
            Swiperight.addTarget(self, action: #selector(Swipe(sender:)))
            Swipeleft.addTarget(self, action: #selector(Swipe(sender:)))
     
    }
    
    var index = 0
    @IBAction func randomButton(_ sender: Any) {
        let randomInt = Int.random(in: 1..<baseTest.count)  // 1から4の範囲で整数（Int型）乱数を生成
        testWord.text = baseTest[randomInt]
        testMeaning.text = baseTestMeanig[randomInt]
    }
    
    //ボタン系
    @IBOutlet weak var nextButton: UIButton!
    @IBAction func nextButton(_ sender: Any) {
        index += 1
        if index >= baseTest.count{
            index = 0
        }
        testWord.text = baseTest[index]
        testMeaning.text = baseTestMeanig[index]
        if testMeaning.isHidden == false{
            testMeaning.isHidden = true
        }
    }
    
    @IBOutlet weak var backButton: UIButton!
    @IBAction func backButton(_ sender: Any) {
        index -= 1
        if index < 0{
            index = baseTest.count
        }
        testWord.text = baseTest[index]
        testMeaning.text = baseTestMeanig[index]
        if testMeaning.isHidden == false{
            testMeaning.isHidden = true
        }
    }
    @IBAction func answerButtun(_ sender: Any) {
        if testMeaning.isHidden == true{
            testMeaning.isHidden = false
        }else{
            testMeaning.isHidden = true
        }
    }
    
  
    
    
    //スワイプした時に起こる事象
    @objc func Swipe(sender: UISwipeGestureRecognizer){
        
        switch sender.direction {
        case .right:
            index += 1
            if index >= baseTest.count{
                index = 0
            }
            testWord.text = baseTest[index]
            testMeaning.text = baseTestMeanig[index]
            if testMeaning.isHidden == false{
                testMeaning.isHidden = true
            }
        case .left:
            index -= 1
            if index < 0{
                index = baseTest.count
            }
            testWord.text = baseTest[index]
            testMeaning.text = baseTestMeanig[index]
            if testMeaning.isHidden == false{
                testMeaning.isHidden = true
            }
            
        default:
            index += 0
        }
    }//ここまでが起こるアクション
    

}
