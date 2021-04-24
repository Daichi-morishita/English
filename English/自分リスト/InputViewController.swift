//
//  InputViewController.swift
//  English
//
//  Created by 森下大地 on 2020/12/12.
//

import UIKit
import RealmSwift
import UserNotifications
import GoogleMobileAds


class InputViewController: UIViewController, GADBannerViewDelegate {
    @IBOutlet weak var wordTextView: UITextView!
    @IBOutlet weak var contentsTextView: UITextView!
    @IBOutlet weak var categoryTextField: UITextField!
    var categoryPicker: UIPickerView = UIPickerView()
    var bannerView: GADBannerView!//広告

    
    let realm = try! Realm()
    var list: List!
   
    let categoryList = ["旅","動詞","名詞","形容詞、副詞","その他"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // In this case, we instantiate the banner with desired ad size.
        //広告
           bannerView = GADBannerView(adSize: kGADAdSizeBanner)
           addBannerViewToView(bannerView)
        //広告を読み込んで表示する
        bannerView.adUnitID = "ca-app-pub-9454016079456680/6800683581"
         bannerView.rootViewController = self
        bannerView.load(GADRequest())

        //広告イベントの設定
        bannerView.delegate = self
    
        
        // 背景をタップしたらdismissKeyboardメソッドを呼ぶように設定する
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
        
        //前に選択されたcellの情報を反映する
        wordTextView.text = list.word
        contentsTextView.text = list.contents
        categoryTextField.text = list.category
        
      
        // ピッカー設定
        categoryPicker.delegate = self
        categoryPicker.dataSource = self
               
               // 決定バーの生成
               let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 40))
               let spacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
               let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
               toolbar.setItems([spacelItem, doneItem], animated: true)
               
               // インプットビュー設定
        categoryTextField.inputView = categoryPicker
        categoryTextField.inputAccessoryView = toolbar
        
        wordTextView.layer.cornerRadius = 5.0
        contentsTextView.layer.cornerRadius = 5.0
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
                NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
   
  
    
    override func viewWillDisappear(_ animated: Bool) {
        // テキストがどちらか埋まっていれば、保存
        if wordTextView.text != "" || contentsTextView.text != ""{
        try! realm.write {
            self.list.word = self.wordTextView.text
            self.list.contents = self.contentsTextView.text
            //カテゴリーは選択がなければ、elseになる
            if categoryTextField.text != ""{
                self.list.category = self.categoryTextField.text!
            }else{
                categoryTextField.text = "else"
                self.list.category = self.categoryTextField.text!}
            self.realm.add(self.list, update: .modified)
        }
        }
        super.viewWillDisappear(animated)
    }
    
    //広告func
        func addBannerViewToView(_ bannerView: GADBannerView) {
            bannerView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(bannerView)
            view.addConstraints(
              [NSLayoutConstraint(item: bannerView,
                                  attribute: .bottom,
                                  relatedBy: .equal,
                                  toItem: bottomLayoutGuide,
                                  attribute: .top,
                                  multiplier: 1,
                                  constant: 0),
               NSLayoutConstraint(item: bannerView,
                                  attribute: .centerX,
                                  relatedBy: .equal,
                                  toItem: view,
                                  attribute: .centerX,
                                  multiplier: 1,
                                  constant: 0)
              ])
           }

    
    
    @objc func dismissKeyboard(){
        // キーボードを閉じる
        view.endEditing(true)
    }
}
//MARK: - pickerviewの設定
extension InputViewController: UIPickerViewDelegate, UIPickerViewDataSource {
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
        categoryTextField.endEditing(true)
        categoryTextField.text = "\(categoryList[categoryPicker.selectedRow(inComponent: 0)])"
        
       }
    
    //キーボードが出てくるときにviewが上がる
    @objc func keyboardWillShow(notification: NSNotification) {
            if !contentsTextView.isFirstResponder {
                return
            }
        
            if self.view.frame.origin.y == 0 {
                if let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                    self.view.frame.origin.y -= keyboardRect.height
                }
            }
        }
        
        @objc func keyboardWillHide(notification: NSNotification) {
            if self.view.frame.origin.y != 0 {
                self.view.frame.origin.y = 0
            }
        }
}

