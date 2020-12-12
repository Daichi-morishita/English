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
      
      
    }
  
    
    override func viewWillDisappear(_ animated: Bool) {
        try! realm.write {
            self.list.word = self.wordTextView.text
            self.list.contents = self.contentsTextView.text
          
            self.realm.add(self.list, update: .modified)
        }
        setNotification(list: list)   // 追加
        super.viewWillDisappear(animated)
    }
    
    // タスクのローカル通知を登録する --- ここから ---
    func setNotification(list: List) {
        let content = UNMutableNotificationContent()
        // タイトルと内容を設定(中身がない場合メッセージ無しで音だけの通知になるので「(xxなし)」を表示する)
        if list.title == "" {
            content.title = "(タイトルなし)"
        } else {
            content.title = list.title
        }
        if list.contents == "" {
            content.body = "(内容なし)"
        } else {
            content.body = list.contents
        }
        content.sound = UNNotificationSound.default
        
        // ローカル通知が発動するtrigger（日付マッチ）を作成
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: list.date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        // identifier, content, triggerからローカル通知を作成（identifierが同じだとローカル通知を上書き保存）
        let request = UNNotificationRequest(identifier: String(list.id), content: content, trigger: trigger)
        
        // ローカル通知を登録
        let center = UNUserNotificationCenter.current()
        center.add(request) { (error) in
            print(error ?? "ローカル通知登録 OK")  // error が nil ならローカル通知の登録に成功したと表示します。errorが存在すればerrorを表示します。
        }
        
        // 未通知のローカル通知一覧をログ出力
        center.getPendingNotificationRequests { (requests: [UNNotificationRequest]) in
            for request in requests {
                print("/---------------")
                print(request)
                print("---------------/")
            }
        }
    } // --- ここまで追加 ---
    
    @objc func dismissKeyboard(){
        // キーボードを閉じる
        view.endEditing(true)
    }
}
