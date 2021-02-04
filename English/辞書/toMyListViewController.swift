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
    @IBOutlet weak var addCategoryText: UITextField!
    var addCategoryPicker: UIPickerView = UIPickerView()

    
    let realm = try! Realm()
    var list: List!
    
    let categoryList = ["動詞","名詞","形容詞、副詞","その他"]
    
    
    var receiveWord: String = ""
    var receiveMeaning: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.systemBlue]
        // 背景をタップしたらdismissKeyboardメソッドを呼ぶように設定する
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)

        addWordText.text = receiveWord
        addMeaningText.text = receiveMeaning
      
        
        // ピッカー設定
        addCategoryPicker.delegate = self
        addCategoryPicker.dataSource = self
               
               // 決定バーの生成
               let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 40))
               let spacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
               let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
               toolbar.setItems([spacelItem, doneItem], animated: true)
               
               // インプットビュー設定
        addCategoryText.inputView = addCategoryPicker
        addCategoryText.inputAccessoryView = toolbar
        
        addMeaningText.layer.cornerRadius = 5.0
    }
   
   
    
    @IBAction func addMyListButton(_ sender: Any) {}
    // segue で画面遷移する時に呼ばれる
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let listView:listViewController = segue.destination as! listViewController
        if segue.identifier == "addMySegue" {
            let list = List()

            let allLists = realm.objects(List.self).sorted(byKeyPath: "id", ascending: true)
            if allLists.count != 0 {
                list.id = allLists.max(ofProperty: "id")! + 1
            }
            
            listView.list = list
        }
        
        let addList = segue.destination as! listViewController
        addList.receiveWord1 = addWordText.text!
        addList.receiveMeaning1 = addMeaningText.text
        addList.receiveCategory1 = addCategoryText.text!
        addList.addBool = true
    }
    
    
    
    
    
    @objc func dismissKeyboard(){
        // キーボードを閉じる
        view.endEditing(true)
    }

}
//MARK: - pickerviewの設定
extension toMyListViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    // UIPickerViewの列の数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // UIPickerViewの行数、リストの数
    func pickerView(_ pickerView: UIPickerView,numberOfRowsInComponent component: Int) -> Int {
        return categoryList.count
    }
    // UIPickerViewの最初の表示
    func pickerView(_ pickerView: UIPickerView,titleForRow row: Int,forComponent component: Int) -> String? {
        
        return categoryList[row]
    }
    
    
    
    // 決定ボタン押下
       @objc func done() {
        addCategoryText.endEditing(true)
        addCategoryText.text = "\(categoryList[addCategoryPicker.selectedRow(inComponent: 0)])"
        
       }
}
