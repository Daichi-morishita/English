//
//  baseViewController.swift
//  English
//
//  Created by 森下大地 on 2020/12/13.
//

import UIKit

//単語と意味をまとめるための関数
class  WordMeaning{
    let word: String
    let meaning: String
    
    init(word: String, meaning: String) {
        self.word = word
        self.meaning = meaning
    }
    
}

class baseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var baseTableView: UITableView!
    
  
    //単語と意味をまとめている。
    //sectionが設定でき、増やすためには下で設定できる
    let wordmeaning:[[WordMeaning]] = [
        [.init(word: "follow", meaning: "続く/従う"),
         .init(word: "consider", meaning: "考慮する"),
         .init(word: "increase", meaning: "増える") ],
        
        [.init(word: "follow", meaning: "続く/従う"),
         .init(word: "consider", meaning: "考慮する"),
         .init(word: "increase", meaning: "増える") ],
        
        [.init(word: "follow", meaning: "続く/従う"),
         .init(word: "consider", meaning: "考慮する"),
         .init(word: "increase", meaning: "増える") ],
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        baseTableView.delegate = self
        baseTableView.dataSource = self
        
        
    }
    
    // データの数（＝セルの数）を返すメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //ここでしっかりと多次元配列の中身を表示できるようにする。
        return wordmeaning[section].count
    }
    
    // 各セルの内容を返すメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 再利用可能な cell を得る
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        
       
        
        //cellのlableにタグをつけて表示する
        //wordLableは英単語のこと
        //meaningは英単語の意味
        //arrayの中から単語と意味が一緒に出てくるようになっている
        let base1 = cell.viewWithTag(1) as! UILabel
        base1.text = wordmeaning[indexPath.section][indexPath.row].word
        
        
        let base2 = cell.viewWithTag(2) as! UILabel
        base2.text = wordmeaning[indexPath.section][indexPath.row].meaning
        
        
        
        
        return cell
    }
    
    // Cell の高さを１２０にする
      func tableView(_ table: UITableView,
                     heightForRowAt indexPath: IndexPath) -> CGFloat {
          return 120.0
      }
    //section設定
    func numberOfSections(in tableView: UITableView) -> Int {
        return wordmeaning.count
    }
    //sectionのテキスト表示の設定
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "level1"
        label.textAlignment = .center
        label.backgroundColor = .green
        
        //sectionの数とタイトルを設定できる
        switch section {
        case 0:
            label.text = "level1"
        case 1:
            label.text = "level2"
        case 2:
            label.text = "level3"
        default:
            break
        }
        
        return label
    }
    //sectionの高さの設定
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    
}
