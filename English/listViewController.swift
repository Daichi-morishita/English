//
//  listViewController.swift
//  English
//
//  Created by 森下大地 on 2020/12/12.
//

import UIKit
import RealmSwift

class listViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{
    @IBOutlet weak var englishList: UITableView!
  
    @IBOutlet weak var searchBar: UISearchBar!
    
    // Realmインスタンスを取得する
        let realm = try! Realm()

        // DB内のタスクが格納されるリスト。
        // 日付の近い順でソート：昇順
        // 以降内容をアップデートするとリスト内は自動的に更新される。
        var listArray = try! Realm().objects(List.self).sorted(byKeyPath: "date", ascending: true)  // ←追加
   
    var defoWordArray = ["follow",
                          "consider",
                          "increase",
                          "expect",
                          "decide",
                          "develop",
                          "provide",
                          "continue",
                          "include"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        englishList.delegate = self
        englishList.dataSource = self
        
        //cellの高さ
        englishList.rowHeight = 80
        
        //デリゲート先を自分に設定する。
        searchBar.delegate = self
        searchBar.showsCancelButton = true
        searchBar.enablesReturnKeyAutomatically = true
        
        //何も入力されていなくてもReturnキーを押せるようにする。
        searchBar.enablesReturnKeyAutomatically = false
        
      
    }
    
    
    // データの数（＝セルの数）を返すメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArray.count
    }
    
    // 各セルの内容を返すメソッド
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 再利用可能な cell を得る
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // Cellに値を設定する.  --- ここから ---
        let list = listArray[indexPath.row]
       
        
    //cellのlableにタグをつけて表示する
    //wordLableは英単語のこと
    //meaningは英単語の意味
    let wordLable = cell.viewWithTag(1) as! UILabel
    wordLable.text = list.word
  
    
    let meaningLable = cell.viewWithTag(2) as! UILabel
    meaningLable.text = list.contents
    
    
        
        return cell
    }
    
    // 各セルを選択した時に実行されるメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "cellSegue",sender: nil) // ←追加する
        
    }
    
    
    // セルが削除が可能なことを伝えるメソッド
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath)-> UITableViewCell.EditingStyle {
        return .delete
    }
    
    // Delete ボタンが押された時に呼ばれるメソッド
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // 削除するタスクを取得する
            let list = self.listArray[indexPath.row]
            
            // ローカル通知をキャンセルする
            let center = UNUserNotificationCenter.current()
            center.removePendingNotificationRequests(withIdentifiers: [String(list.id)])
            
            // データベースから削除する
            try! realm.write {
                self.realm.delete(list)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            
            // 未通知のローカル通知一覧をログ出力
            center.getPendingNotificationRequests { (requests: [UNNotificationRequest]) in
                for request in requests {
                    print("/---------------")
                    print(request)
                    print("---------------/")
                }
            }
        } // --- ここまで変更 ---
    }
    
    //検索ボタン押下時の呼び出しメソッド
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
        
        //型がオプショナルなのでstring型に直す必要がある。
        //searchBarがオプショナルなのでguard let のコードを使って、アンラップする。
        //型が違うと文字が一緒でも検索結果に引っかからない。
        guard let searchText = searchBar.text else {return}
        
        //条件として、検索文字がカテゴリーと一致するものを検索すること
        let result = realm.objects(List.self).filter("word BEGINSWITH '\(searchText)'")
        //検索結果の件数を取得する。
        let count = result.count
        
        //検索結果が０の場合その言葉を含んだ結果が出る。
        if (count == 0){
            listArray = realm.objects(List.self).filter("word CONTAINS '\(searchText)'")
        }else {
            listArray = result
        }
        if searchText == ""{
            listArray = realm.objects(List.self)
        }
        
        //テーブルを再読み込みする。
        englishList.reloadData()
    }
    
    
    
    // segue で画面遷移する時に呼ばれる
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let inputViewController:InputViewController = segue.destination as! InputViewController
        
        if segue.identifier == "cellSegue" {
            let indexPath = self.englishList.indexPathForSelectedRow
            inputViewController.list = listArray[indexPath!.row]
        } else {
            let list = List()
            
            let allLists = realm.objects(List.self)
            if allLists.count != 0 {
                list.id = allLists.max(ofProperty: "id")! + 1
            }
            
            inputViewController.list = list
        }
    }
    
    // 入力画面から戻ってきた時に TableView を更新させる
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        englishList.reloadData()
    }
    
}
