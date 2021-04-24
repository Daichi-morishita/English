//
//  TabiCategoryViewController.swift
//  English
//
//  Created by 森下大地 on 2021/04/10.
//

import UIKit
import GoogleMobileAds

class TabiCategoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, GADBannerViewDelegate {
    
    @IBOutlet weak var tabiTableView: UITableView!
    var bannerView: GADBannerView!//広告
    
    
    var tabiChoosed = ["旅フレーズ", "旅単語"]
    
    // 選択されたセルを覚える変数
    var tabiSelect: Int!
    
    
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
        
        tabiTableView.delegate = self
        tabiTableView.dataSource = self
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
    
    // セルの数を指定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // someArrayの中身の数だけセルを表示
        return tabiChoosed.count
    }
    
    // 各セルの要素を指定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // UITableViewCellのインスタンスを生成
        let cell = tableView.dequeueReusableCell(withIdentifier: "tabi_1", for: indexPath)
        
        // セルのUILabelに配列の中身を順に表示
        cell.textLabel?.text = tabiChoosed[indexPath.row]
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
        tabiSelect = indexPath.row
        // 画面遷移の準備
        if tabiSelect == 0{
            performSegue(withIdentifier: "tabiSentenceSegue",sender: nil)
        } else if tabiSelect == 1{
            performSegue(withIdentifier: "tabiWordSegue",sender: nil)
        }
    }
    
    //       // Segue 準備
    //       override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
    //        if segue.identifier == "tobaseViewController"{
    //           // 遷移先のViecControllerのインスタンスを生成
    //           let secVC: baseViewController = (segue.destination as? baseViewController)!
    //           // secondViewControllerのgetCellに選択された画像を設定する
    //           secVC.getCell = chosenCell
    //        }
    //
    //       }
    
    
}

