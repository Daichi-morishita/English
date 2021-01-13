//
//  baseViewController.swift
//  English
//
//  Created by 森下大地 on 2020/12/13.
//

import UIKit

//単語と意味をまとめるための関数
class WordMeaning{
    let num: Int
    let word: String
    let meaning: String
    
   
    init(num: Int, word: String, meaning: String) {
        self.num = num
        self.word = word
        self.meaning = meaning
           }
    
}

class baseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    @IBOutlet weak var baseTableView: UITableView!
    @IBAction func toTestButton(_ sender: Any) {
        performSegue(withIdentifier: "toTest", sender: nil)
    }
    @IBOutlet weak var baseSearch: UISearchBar!
    
    
  
    //単語と意味をまとめている。
    //sectionが設定でき、増やすためには下で設定できる
    let wordmeanings:[[WordMeaning]] = [
        [.init(num: 1, word: "abandon",meaning: "捨てる"),
         .init(num: 2, word: "abolish",meaning: "廃止する"),
         .init(num: 3, word: "absorb",meaning: "吸収する"),
         .init(num: 4, word: "accelerate",meaning: "促進する")],
        
        [.init(num: 1, word: "abuse", meaning: "虐待"),
         .init(num: 2, word: "access", meaning: "利用する権利"),
         .init(num: 3, word: "accord", meaning: "一致/合意"),
         .init(num: 4, word: "acquaintance", meaning: "知人")],
        
        [.init(num: 1, word: "（not）necessarily", meaning: "必ずしも〜でない"),
         .init(num: 1, word: "abruptly", meaning: "不意に"),
         .init(num: 1, word: "absolutely", meaning: "絶対に"),
         .init(num: 1, word: "abstract", meaning: "抽象的な")],
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        baseTableView.delegate = self
        baseTableView.dataSource = self
        
        //デリゲート先を自分に設定する。
        baseSearch.delegate = self
        baseSearch.showsCancelButton = true
        baseSearch.enablesReturnKeyAutomatically = true
        
        //何も入力されていなくてもReturnキーを押せるようにする。
        baseSearch.enablesReturnKeyAutomatically = false
        
        baseSearch.placeholder = "英単語検索"
        
       
    }
    
    // データの数（＝セルの数）を返すメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //ここでしっかりと多次元配列の中身を表示できるようにする。
        return wordmeanings[section].count
    }
    
    // 各セルの内容を返すメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 再利用可能な cell を得る
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        
       
        
        //cellのlableにタグをつけて表示する
        //wordLableは英単語のこと
        //meaningは英単語の意味
        //arrayの中から単語と意味が一緒に出てくるようになっている
        let wordmeaning = wordmeanings[indexPath.section][indexPath.row]
        cell.textLabel?.text = wordmeaning.word
        
        
        let base2 = cell.viewWithTag(2) as! UILabel
        base2.text = wordmeaning.meaning
        
        
        return cell
    }
    
    // Cell の高さを１２０にする
      func tableView(_ table: UITableView,
                     heightForRowAt indexPath: IndexPath) -> CGFloat {
          return 120.0
      }
    //section設定
    func numberOfSections(in tableView: UITableView) -> Int {
        return wordmeanings.count
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
            label.text = "動詞"
        case 1:
            label.text = "名詞"
        case 2:
            label.text = "形容詞"
        default:
            break
        }
        return label
    }
    //sectionの高さの設定
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    //タップされた時の動作
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        // セルの選択を解除
            tableView.deselectRow(at: indexPath, animated: true)
        
//        performSegue(withIdentifier: "nextSegue",sender: nil) // ←追加する
   
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "nextSegue"{
            if let indexPath = baseTableView.indexPathForSelectedRow{
                guard let destination = segue.destination as? toTestViewController else{
                    fatalError("Failed to prepare toTestViewController.")
                }
                destination.wordmeaning = wordmeanings[indexPath.section][indexPath.row]
            }
        }
    }
    
    //検索ボタン押下時の呼び出しメソッド
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
        
        //型がオプショナルなのでstring型に直す必要がある。
        //searchBarがオプショナルなのでguard let のコードを使って、アンラップする。
        //型が違うと文字が一緒でも検索結果に引っかからない。
        guard let searchText = baseSearch.text else {return}
        
        let baseResult = wordmeanings
        
       
        
        //テーブルを再読み込みする。
        baseTableView.reloadData()
    }
    
 
    
}

