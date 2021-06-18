//
//  selectedTestViewController.swift
//  English
//
//  Created by 森下大地 on 2020/12/22.
//

import UIKit
import RealmSwift
import GoogleMobileAds
import AppTrackingTransparency
import AdSupport

class selectedTestViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, GADBannerViewDelegate {
    @IBOutlet weak var selectedTestList: UITableView!
    var bannerView: GADBannerView!//広告
    var testAdmob: Bool = false
    let id = ASIdentifierManager.shared().advertisingIdentifier.uuidString

    
    let realm = try! Realm()
    var indexNum = 0
    
    let selectedLevel = ["高校英語　動詞テスト", "高校英語　名詞テスト", "高校英語　形容詞テスト","自分リストのテスト"]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // In this case, we instantiate the banner with desired ad size.
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

        selectedTestList.dataSource = self
        selectedTestList.delegate =  self
        
        //タイトル設定
        navigationItem.title = ""
        
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedLevel.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 再利用可能な cell を得る
        let cell = tableView.dequeueReusableCell(withIdentifier: "selectedTestCell", for: indexPath)
        cell.textLabel?.text = selectedLevel[indexPath.row]
        //文字の位置の設定
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.font = UIFont.systemFont(ofSize: 20)
        
        return cell
    }
    // Cell の高さを１２０にする
      func tableView(_ table: UITableView,
                     heightForRowAt indexPath: IndexPath) -> CGFloat {
          return 80.0
      }
    
    //タップされた時の動作
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // セルの選択を解除
            tableView.deselectRow(at: indexPath, animated: true)
        //index の番号を取得
        indexNum =  indexPath.row//一番上で宣言している。
        switch indexNum{
        //自分リストのテスト用の画面に移動する
        case 3:
            let idCount =  realm.objects(List.self).sorted(byKeyPath: "id", ascending: true) 
            if idCount.count > 0{
                performSegue(withIdentifier: "myListTestSegue",sender: nil)
            }else{
                print("自分リストなし")
                break
            }
        default:
        performSegue(withIdentifier: "toTestSegue",sender: nil) // ←追加する
    }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "toTestSegue" {
            if segue.identifier == "toTestSegue" {
                 let nextVC: testViewController = (segue.destination as? testViewController)!
                 nextVC.passedId = indexNum
             }
    }
    }
    
   
    
}

