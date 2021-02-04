//
//  base2ViewController.swift
//  English
//
//  Created by 森下大地 on 2021/02/03.
//

import UIKit
import RealmSwift

class base2ViewController: UIViewController {
    
    // 遷移先のViewControllerに渡す変数
    var giveWord: String = ""
    var giveMeaning: String = ""
    
    
    
    // Realmインスタンスを取得する
    let realm = try! Realm()
    
    // ViewControllerから選択されたCell番号を受け取る変数
    var getCell: Int!
    // 選択されたジャンルの配列の長さ変数
    var arrayLength: Int!
    
    var wordmeanings: [[String:String]] = [[:]]
    var doushi: [[String:String]] = [[:]]
    var meishi: [[String:String]] = [[:]]
    var keiyoushi: [[String:String]] = [[:]]
    var all: [[String:String]] = [[:]]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
