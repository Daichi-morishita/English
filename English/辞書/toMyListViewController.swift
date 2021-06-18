//
//  toMyListViewController.swift
//  English
//
//  Created by 森下大地 on 2021/01/25.
//

import UIKit
import RealmSwift
import UserNotifications
import GoogleMobileAds
import AppTrackingTransparency
import AdSupport

class toMyListViewController: UIViewController, GADBannerViewDelegate {
    @IBOutlet weak var addWordText: UITextField!
    @IBOutlet weak var addMeaningText: UITextView!
    @IBOutlet weak var addCategoryText: UITextField!
    var addCategoryPicker: UIPickerView = UIPickerView()
    var bannerView: GADBannerView!//広告
    var testAdmob: Bool = false
    let id = ASIdentifierManager.shared().advertisingIdentifier.uuidString

    
    let realm = try! Realm()
    var list: List!
    
    let categoryList = ["旅","動詞","名詞","形容詞、副詞","その他"]
    
    
    var receiveWord: String = ""
    var receiveMeaning: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        //広告
           bannerView = GADBannerView(adSize: kGADAdSizeBanner)
           addBannerViewToView(bannerView)
        //広告を読み込んで表示する
        if testAdmob == true{
            bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        }else{
            bannerView.adUnitID = "ca-app-pub-9454016079456680/9186203579"
        }
         bannerView.rootViewController = self
        bannerView.load(GADRequest())

        //広告イベントの設定
        bannerView.delegate = self
        
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
    //広告func
        func addBannerViewToView(_ bannerView: GADBannerView) {
            bannerView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(bannerView)
            view.addConstraints(
              [NSLayoutConstraint(item: bannerView,
                                  attribute: .bottom,
                                  relatedBy: .equal,
                                  toItem: view,
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
    func requestIDFA() {
      ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
        // Tracking authorization completed. Start loading ads here.
        // loadAd()
      })
    }
    //広告func トラッキング対策
    func isAdvertisingTrackingEnabled() -> Bool {
        if #available(iOS 14, *) {
            let status = ATTrackingManager.trackingAuthorizationStatus
            switch status {
            case .notDetermined, .restricted, .denied:
                return false
            case .authorized:
                return true
            @unknown default:
                return false
            }
        } else {
            return ASIdentifierManager.shared().isAdvertisingTrackingEnabled
        }
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
