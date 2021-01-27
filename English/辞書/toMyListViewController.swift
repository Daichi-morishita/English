//
//  toMyListViewController.swift
//  English
//
//  Created by 森下大地 on 2021/01/25.
//

import UIKit
import RealmSwift
import UserNotifications


class toMyListViewController: UIViewController {
    @IBOutlet weak var addWordText: UITextField!
    @IBOutlet weak var addMeaningText: UITextView!
    
    let realm = try! Realm()
    var list: List!
    
    
    
    
    var receiveWord: String = ""
    var receiveMeaning: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 背景をタップしたらdismissKeyboardメソッドを呼ぶように設定する
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)

        addWordText.text = receiveWord
        addMeaningText.text = receiveMeaning
        
//        addWordText.text = list.word
//        addMeaningText.text = list.contents
        
        
    }
   
   
    
    @IBAction func addMyListButton(_ sender: Any) {
        
    }
    // segue で画面遷移する時に呼ばれる
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let listView:listViewController = segue.destination as! listViewController
        if segue.identifier == "addMySegue" {
            let list = List()
//
            let allLists = realm.objects(List.self).sorted(byKeyPath: "id", ascending: true)
            if allLists.count != 0 {
                list.id = allLists.max(ofProperty: "id")! + 1
            }
            
            listView.list = list
        }
        
        let addList = segue.destination as! listViewController
        addList.receiveWord1 = receiveWord
        addList.receiveMeaning1 = receiveMeaning
        addList.addBool = true
        
        
    }
    
    
//
    
    
    
    @objc func dismissKeyboard(){
        // キーボードを閉じる
        view.endEditing(true)
    }

}
