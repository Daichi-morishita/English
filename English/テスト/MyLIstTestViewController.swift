//
//  MyLIstTestViewController.swift
//  English
//
//  Created by 森下大地 on 2021/01/29.
//

import UIKit
import RealmSwift

class MyLIstTestViewController: UIViewController {
    @IBOutlet weak var myTestWord: UILabel!
    @IBOutlet weak var myTestMeaning: UILabel!
    @IBOutlet weak var myTestVeiw: UIView!
    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var randomSwich: UISwitch!
    @IBOutlet weak var answerButtun: UIButton!
    
    let realm = try! Realm()
    var list: List!
    var randomOnOff = false
    
    var testCount: Int = 0
    var myTestArray = try! Realm().objects(List.self).sorted(byKeyPath: "id", ascending: true)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTestWord.text = myTestArray[testCount].word
        myTestMeaning.text = myTestArray[testCount].contents
        myTestMeaning.isHidden  = true
        
      
        switchLabel.text = "ランダムOFF"//ランダムスイッチのonoffラベル
        randomSwich.isOn = false
        
        //スワイプアクションの設定 labelではなくViewが動作に反応するようになっている。
        let Swiperight = UISwipeGestureRecognizer()
        let Swipeleft = UISwipeGestureRecognizer()
        
        //このジェスチャレコグナイザのスワイプの許可された方向
        Swiperight.direction = .right
        Swipeleft.direction = .left
        
        //スワイプアクションができるように取得する。
        self.myTestVeiw.addGestureRecognizer(Swiperight)
        self.myTestVeiw.addGestureRecognizer(Swipeleft)
        
        Swiperight.addTarget(self, action: #selector(Swipe(sender:)))
        Swipeleft.addTarget(self, action: #selector(Swipe(sender:)))
        
        
        myTestVeiw.isUserInteractionEnabled = true
        myTestVeiw.layer.cornerRadius = 10.0
        answerButtun.layer.cornerRadius = 30.0
    }
    
    
    @IBAction func answerButtun(_ sender: Any) {
        if myTestMeaning.isHidden == true{
            myTestMeaning.isHidden = false
        }else{
            myTestMeaning.isHidden = true
        }
    }
  
    
    @IBAction func randomSwich(_ sender: UISwitch) {
        if sender.isOn == true {
            randomOnOff = true
            switchLabel.text = "ランダムON"
        }else{
            randomOnOff = false
            switchLabel.text = "ランダムOFF"
        }
    }
    //スワイプした時に起こる事象
    @objc func Swipe(sender: UISwipeGestureRecognizer){
        
        switch sender.direction {
        
        case .left:
            
            if randomOnOff == false{
                testCount += 1
            if testCount >= myTestArray.count{
                testCount = 0
            }
            //  array.indices（インデックスの配列）とcontains（配列に含まれるか）を利用する
            //　indexの範囲外を修正できるコード
            guard myTestArray.indices.contains(testCount) else { return }
            
                myTestWord.text = myTestArray[testCount].word
                myTestMeaning.text = myTestArray[testCount].contents
            }else{
                let randomInt = Int.random(in: 0..<myTestArray.count)  // 1から4の範囲で整数（Int型）乱数を生成
                myTestWord.text = myTestArray[randomInt].word
                myTestMeaning.text = myTestArray[randomInt].contents
            }
            if myTestMeaning.isHidden == false{
                myTestMeaning.isHidden = true
            }
        case .right:
            testCount -= 1
            
                    if testCount <= 0{
                        testCount = myTestArray.count
            }
            //  array.indices（インデックスの配列）とcontains（配列に含まれるか）を利用する
            //　indexの範囲外を修正できるコード
            guard myTestArray.indices.contains(testCount) else { return }

            myTestWord.text = myTestArray[testCount].word
            myTestWord.text = myTestArray[testCount].word
            if myTestMeaning.isHidden == false{
                myTestMeaning.isHidden = true
            }
            
        default:
            break
        }
    }//ここまでが起こるアクション

}
