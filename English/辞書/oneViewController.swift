//
//  oneViewController.swift
//  English
//
//  Created by 森下大地 on 2021/01/20.
//

import UIKit
import GoogleMobileAds
import AppTrackingTransparency
import AdSupport


class oneViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, GADBannerViewDelegate  {
    @IBOutlet weak var oneTableView: UITableView!
    var bannerView: GADBannerView!//広告
    
    let selectedOne = ["高校英単語","旅英語"]
//    //上の変数が増えれば下の変数も増やす
//    let photos = ["英単語絵","旅絵２"]
    
    // 選択されたセルを覚える変数
    var chosenCell: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "英単語帳を選択"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.systemBlue]
        
       
        
           
        
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


        oneTableView.delegate = self
        oneTableView.dataSource = self
        
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
        let ud = UserDefaults.standard
               let firstLunchKey = "firstLunch"
               if ud.bool(forKey: firstLunchKey) {
                   ud.set(false, forKey: firstLunchKey)
                   ud.synchronize()
                   self.performSegue(withIdentifier: "toStart", sender: nil)
               }
    }
    
    override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
           // Dispose of any resources that can be recreated.
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
    //ios ver.14以降必要になったやり方
    func requestIDFA() {
      ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
        // Tracking authorization completed. Start loading ads here.
        // loadAd()
      })
    }

    // セルの数を指定
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           // someArrayの中身の数だけセルを表示
           return selectedOne.count
       }

       // 各セルの要素を指定
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
           // UITableViewCellのインスタンスを生成
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_01", for: indexPath)
//        let imageView = cell.contentView.viewWithTag(1) as! UIImageView
//        // 画像配列の番号で指定された要素の名前の画像をUIImageとする
//                let cellImage = UIImage(named: photos[indexPath.row])
//                // UIImageをUIImageViewのimageとして設定
//                imageView.image = cellImage
        
           // セルのUILabelに配列の中身を順に表示
           cell.textLabel?.text = selectedOne[indexPath.row]
           cell.textLabel?.font = UIFont.systemFont(ofSize: 20)
        //文字の位置の設定
           return cell
       }
    
    // Cell の高さを設定する
      func tableView(_ table: UITableView,
                     heightForRowAt indexPath: IndexPath) -> CGFloat {
          return 100.0
      }

       // セルが選択された時に呼ばれる
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // セルの選択を解除
               tableView.deselectRow(at: indexPath, animated: true)
           // 選択されたcellの番号を記憶
           chosenCell = indexPath.row
           // 画面遷移の準備
        if chosenCell == 0{
           performSegue(withIdentifier: "tobaseViewController",sender: nil)
        } else if chosenCell == 1{
           performSegue(withIdentifier: "tabiSegue",sender: nil)
        }
       }

       // Segue 準備
       override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if segue.identifier == "tobaseViewController"{
           // 遷移先のViecControllerのインスタンスを生成
           let secVC: baseViewController = (segue.destination as? baseViewController)!
           // secondViewControllerのgetCellに選択された画像を設定する
           secVC.getCell = chosenCell
        }

       }
    

}
