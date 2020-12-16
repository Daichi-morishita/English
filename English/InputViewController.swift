//
//  InputViewController.swift
//  English
//
//  Created by 森下大地 on 2020/12/12.
//

import UIKit
import RealmSwift
import UserNotifications


class InputViewController: UIViewController {
    @IBOutlet weak var wordTextView: UITextView!
   
    @IBOutlet weak var contentsTextView: UITextView!
   
    
    let realm = try! Realm()
    var list: List!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 背景をタップしたらdismissKeyboardメソッドを呼ぶように設定する
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
        
        wordTextView.text = list.word
        contentsTextView.text = list.contents
        
        if wordTextView.text == "" {
            wordTextView.text = "単語を入力してください"
        }
      
      
    }
  
    
    override func viewWillDisappear(_ animated: Bool) {
        try! realm.write {
            self.list.word = self.wordTextView.text
            self.list.contents = self.contentsTextView.text
          
            self.realm.add(self.list, update: .modified)
        }
  
        super.viewWillDisappear(animated)
    }
    
    

    
    @objc func dismissKeyboard(){
        // キーボードを閉じる
        view.endEditing(true)
    }
}
