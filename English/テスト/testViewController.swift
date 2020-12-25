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
    
    
    var baseArray1: [String] = ["follow",
                                "consider",
                                "increase",
                                "expect",
                                "decide",
                                "develop",
                                "provide",
                                "continue",
                                "include"]
    
    var baseArray2: [String] = ["続く/従う",
                                "考慮する",
                                "増える",
                                "予期する",
                                "決意する/決定する",
                                "発達する",
                                "供給する/与える",
                                "続ける",
                                "含む"]
    
    var baseArray3: [String] = ["apple",
                                "consider",
                                "increase",
                                "expect",
                                "decide",
                                "develop",
                                "provide",
                                "continue",
                                "include"]
    
    var baseArray4: [String] = ["りんご/従う",
                                "考慮する",
                                "増える",
                                "予期する",
                                "決意する/決定する",
                                "発達する",
                                "供給する/与える",
                                "続ける",
                                "含む"]
    
    var baseArray5: [String] = ["best",
                                "consider",
                                "increase",
                                "expect",
                                "decide",
                                "develop",
                                "provide",
                                "continue",
                                "include"]
    
    var baseArray6: [String] = ["続く/最善",
                                "考慮する",
                                "増える",
                                "予期する",
                                "決意する/決定する",
                                "発達する",
                                "供給する/与える",
                                "続ける",
                                "含む"]
    
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testView.isUserInteractionEnabled = true

        testWord.text = baseArray1[index]
        testMeaning.text = baseArray2[index]
        testMeaning.isHidden  = true
        
        testLabel.text = "\(passedId)"
        
        if passedId == 0 {
            testWord.text = baseArray1[index]
        }else if passedId == 1{
            testWord.text = baseArray3[index]
        }else if passedId == 2{
            testWord.text = baseArray5[index]
        }
        
        
        
        
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
    
    //ボタン系
    @IBOutlet weak var nextButton: UIButton!
    @IBAction func nextButton(_ sender: Any) {
        index += 1
        if index >= baseArray1.count{
            index = 0
        }
        testWord.text = baseArray1[index]
        testMeaning.text = baseArray2[index]
        if testMeaning.isHidden == false{
            testMeaning.isHidden = true
        }
    }
    
    @IBOutlet weak var backButton: UIButton!
    @IBAction func backButton(_ sender: Any) {
        index -= 1
        if index < 0{
            index = 2
        }
        testWord.text = baseArray1[index]
        testMeaning.text = baseArray2[index]
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
            if index >= baseArray1.count{
                index = 0
            }
            testWord.text = baseArray1[index]
            testMeaning.text = baseArray2[index]
            if testMeaning.isHidden == false{
                testMeaning.isHidden = true
            }
        case .left:
            index -= 1
            if index < 0{
                index = 2
            }
            testWord.text = baseArray1[index]
            testMeaning.text = baseArray2[index]
            if testMeaning.isHidden == false{
                testMeaning.isHidden = true
            }
            
        default:
            index += 0
        }
    }//ここまでが起こるアクション
    

}
