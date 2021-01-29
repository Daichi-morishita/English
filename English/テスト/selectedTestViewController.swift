//
//  selectedTestViewController.swift
//  English
//
//  Created by 森下大地 on 2020/12/22.
//

import UIKit

class selectedTestViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var selectedTestList: UITableView!
    
    var indexNum = 0
    
    let selectedLevel = ["高校英語　動詞", "高校英語　名詞", "高校英語　形容詞","自分リストのテスト"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        selectedTestList.dataSource = self
        selectedTestList.delegate =  self
        
        //タイトル設定
        navigationItem.title = "スライドテスト"
        
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
            performSegue(withIdentifier: "myListTestSegue",sender: nil) //
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

