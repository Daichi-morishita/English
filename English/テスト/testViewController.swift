//
//  testViewController.swift
//  English
//
//  Created by 森下大地 on 2020/12/15.
//

import UIKit
import RealmSwift

class testViewController: UIViewController {
    @IBOutlet weak var testWord: UILabel!
    @IBOutlet weak var testMeaning: UILabel!
    @IBOutlet weak var testView: UIView!
    var testCategory: String!
//    @IBOutlet weak var testLabel: UILabel! //前のtableviewの列確認用
    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var answerButtun: UIButton!
    @IBOutlet weak var randomSwich1: UISwitch!
    

    let realm = try! Realm()
    var list: List!
    
    var randomOnOff = false
    var passedId = Int()
    var baseTest:[String] = []
    var baseTestMeanig:[String] = []
    var index = 0

    
    var koukouDoushi1: [String] = [ "abandon","abolish","absorb","accelerate","ban","base",
                                    "beg","belong","calculate","capture","carve","cast"]
    var koukouDoushi2: [String] = ["捨てる","廃止する","吸収する","促進する","禁止する","基づいている",
                                   "乞う","所属する","計算する","捕らえる","彫る","投げる/＜目を＞向ける"]
    
    var koukouMeishi1: [String] = ["abuse","access","accord","acquaintance"]
    var koukouMeishi2: [String] = ["虐待","利用する権利","一致/合意","知人"]
    
    var koukouKeiyoushi1: [String] = ["（not）necessarily","abruptly","absolutely","abstract"]
    var koukouKeiyoushi2: [String] = ["必ずしも〜でない","不意に","絶対に","抽象的な"]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        testLabel.text = "\(passedId)"　//前のテーブルビューの選択された行の確認用
        
        //選択された行によっての条件分岐
        switch passedId {
        case 0 :
            baseTest = koukouDoushi1
            baseTestMeanig = koukouDoushi2
        case 1 :
            baseTest = koukouMeishi1
            baseTestMeanig = koukouMeishi2
        case 2 :
            baseTest = koukouKeiyoushi1
            baseTestMeanig = koukouKeiyoushi2
        default:
            break
        }
        testWord.text = baseTest[index]
        testMeaning.text = baseTestMeanig[index]
        testMeaning.isHidden  = true
        
      
        switchLabel.text = "ランダムOFF"//ランダムスイッチのonoffラベル
        randomSwich1.isOn = false
        
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
        
        
        testView.isUserInteractionEnabled = true
        
        // ボタンの丸み
        answerButtun.layer.cornerRadius = 20.0

    }
 
    //日本語訳の設定
    @IBAction func answerButtun(_ sender: Any) {
        if testMeaning.isHidden == true{
            testMeaning.isHidden = false
        }else{
            testMeaning.isHidden = true
        }
    }
    
    // ランダムのonoff状態設定
    @IBAction func randomSwich(_ sender: Any) {
        if randomOnOff == false {
            randomOnOff = true
            switchLabel.text = "ランダムON"
        }else{
            randomOnOff = false
            switchLabel.text = "ランダムOFF"
        }
    }
    
    @IBAction func randomSwich1(_ sender: UISwitch) {
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
            index += 1
            if index >= baseTest.count{
                index = 0
            }
            //  array.indices（インデックスの配列）とcontains（配列に含まれるか）を利用する
            //　indexの範囲外を修正できるコード
            guard baseTest.indices.contains(index) else { return }
            
            testWord.text = baseTest[index]
            testMeaning.text = baseTestMeanig[index]
            }else{
                let randomInt = Int.random(in: 0..<baseTest.count)  // 1から4の範囲で整数（Int型）乱数を生成
                testWord.text = baseTest[randomInt]
                testMeaning.text = baseTestMeanig[randomInt]
            }
            if testMeaning.isHidden == false{
                testMeaning.isHidden = true
            }
        case .right:
            index -= 1
            
                    if index <= 0{
                        index = baseTest.count
            }
            //  array.indices（インデックスの配列）とcontains（配列に含まれるか）を利用する
            //　indexの範囲外を修正できるコード
            guard baseTest.indices.contains(index) else { return }

            testWord.text = baseTest[index]
            testMeaning.text = baseTestMeanig[index]
            if testMeaning.isHidden == false{
                testMeaning.isHidden = true
            }
            
        default:
            break
        }
    }//ここまでが起こるアクション
    
    @IBAction func addFromButton(_ sender: Any) {
        print(testWord.text!)
    }
    
    
    // segue で画面遷移する時に呼ばれる
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let listView:listViewController = segue.destination as! listViewController
        if segue.identifier == "addFromTest" {
            let list = List()

            let allLists = realm.objects(List.self).sorted(byKeyPath: "id", ascending: true)
            if allLists.count != 0 {
                list.id = allLists.max(ofProperty: "id")! + 1
            }
            
            listView.list = list
        }
        
        let addList = segue.destination as! listViewController
        addList.receivedFromTestWord = testWord.text!
        addList.receivedFromTestMeaning = testMeaning.text!
        switch passedId {
        case 0:
            testCategory = "動詞"
            addList.receiveFromTestCategory = testCategory
        case 1:
            testCategory = "名詞"
            addList.receiveFromTestCategory = testCategory
        case 2:
            testCategory = "形容詞、副詞"
            addList.receiveFromTestCategory = testCategory
        default:
            testCategory = "else"
            addList.receiveFromTestCategory = testCategory
        }
        addList.addTestBool = true
    }
}

//　MARK:　- 各種ボタンの動作確認
extension testViewController{
//    @IBAction func randomButton(_ sender: Any) {
//        let randomInt = Int.random(in: 1..<baseTest.count)  // 1から4の範囲で整数（Int型）乱数を生成
//        testWord.text = baseTest[randomInt]
//        testMeaning.text = baseTestMeanig[randomInt]
//        if testMeaning.isHidden == false{
//            testMeaning.isHidden = true
//        }
//    }
//
//    //ボタン系　スワイプアクションの動作確認用
//    @IBOutlet weak var nextButton: UIButton!
//    @IBAction func nextButton(_ sender: Any) {
//        index += 1
//        if index >= baseTest.count{
//            index = 0
//        }
//        //  array.indices（インデックスの配列）とcontains（配列に含まれるか）を利用する
//        //　indexの範囲外を修正できるコード
//        guard baseTest.indices.contains(index) else { return }
//
//        testWord.text = baseTest[index]
//        testMeaning.text = baseTestMeanig[index]
//        if testMeaning.isHidden == false{
//            testMeaning.isHidden = true
//        }
//
//        let randomInt = Int.random(in: 1..<baseTest.count)  // 1から4の範囲で整数（Int型）乱数を生成
//        testWord.text = baseTest[randomInt]
//        testMeaning.text = baseTestMeanig[randomInt]
//
//    }
//    @IBOutlet weak var backButton: UIButton!
//    @IBAction func backButton(_ sender: Any) {
//
//        index -= 1
//
//                if index <= 0{
//            index = baseTest.count
//        }
//        //  array.indices（インデックスの配列）とcontains（配列に含まれるか）を利用する
//        //　indexの範囲外を修正できるコード
//        guard baseTest.indices.contains(index) else { return }
//
//        testWord.text = baseTest[index]
//        testMeaning.text = baseTestMeanig[index]
//        if testMeaning.isHidden == false{
//            testMeaning.isHidden = true
//        }
//    }
}
