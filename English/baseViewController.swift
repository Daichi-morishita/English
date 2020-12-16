//
//  baseViewController.swift
//  English
//
//  Created by 森下大地 on 2020/12/13.
//

import UIKit

class baseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var baseTableView: UITableView!
    
    var baseArray1: [String] = ["follow",
                                "consider",
                                "increase",
                                "expect",
                                "decide",
                                "develop",
                                "provide",
                                "continue",
                                "include",]
    
    var baseArray2: [String] = ["続く/従う",
                                "考慮する",
                                "増える",
                                "予期する",
                                "決意する/決定する",
                                "発達する",
                                "供給する/与える",
                                "続ける",
                                "含む"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        baseTableView.delegate = self
        baseTableView.dataSource = self
        
        
    }
    
    // データの数（＝セルの数）を返すメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return baseArray1.count
    }
    
    // 各セルの内容を返すメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 再利用可能な cell を得る
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        
       
        
        //cellのlableにタグをつけて表示する
        //wordLableは英単語のこと
        //meaningは英単語の意味
        let base1 = cell.viewWithTag(1) as! UILabel
        base1.text = String(describing: baseArray1[indexPath.row])
        
        
        let base2 = cell.viewWithTag(2) as! UILabel
        base2.text = String(describing: baseArray2[indexPath.row])
        
        
        
        
        return cell
    }
    
    // Cell の高さを１２０にする
      func tableView(_ table: UITableView,
                     heightForRowAt indexPath: IndexPath) -> CGFloat {
          return 120.0
      }
    
    
}
