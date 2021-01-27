//
//  baseViewController.swift
//  English
//
//  Created by 森下大地 on 2020/12/13.
//

import UIKit
import RealmSwift

////単語と意味をまとめるための関数
//class WordMeaning{
//    let word: String
//    let meaning: String
//
//
//    init(word: String, meaning: String) {
//        self.word = word
//        self.meaning = meaning
//           }
//
//}


class baseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{
    @IBOutlet weak var baseTableView: UITableView!
    @IBAction func toTestButton(_ sender: Any) {
        performSegue(withIdentifier: "toTest", sender: nil)
    }
    @IBOutlet weak var baseSearch: UISearchBar!
    @IBOutlet weak var selectPicker: UIPickerView!
    
    // 遷移先のViewControllerに渡す変数
    var giveWord: String = ""
    var giveMeaning: String = ""
    
    
    
    // Realmインスタンスを取得する
    let realm = try! Realm()
    
    
    //単語と意味をまとめている。
    //sectionが設定でき、増やすためには下で設定できる
    //    let wordmeanings:[[WordMeaning]] = [
    //        [.init(num: 1, word: "abandon",meaning: "捨てる"),
    //         .init(num: 2, word: "abolish",meaning: "廃止する"),
    //         .init(num: 3, word: "absorb",meaning: "吸収する"),
    //         .init(num: 4, word: "accelerate",meaning: "促進する")],
    //
    //        [.init(num: 1, word: "abuse", meaning: "虐待"),
    //         .init(num: 2, word: "access", meaning: "利用する権利"),
    //         .init(num: 3, word: "accord", meaning: "一致/合意"),
    //         .init(num: 4, word: "acquaintance", meaning: "知人")],
    //
    //        [.init(num: 1, word: "（not）necessarily", meaning: "必ずしも〜でない"),
    //         .init(num: 1, word: "abruptly", meaning: "不意に"),
    //         .init(num: 1, word: "absolutely", meaning: "絶対に"),
    //         .init(num: 1, word: "abstract", meaning: "抽象的な")],
    //    ]
    
    // ViewControllerから選択されたCell番号を受け取る変数
    var getCell: Int!
    // 選択されたジャンルの配列の長さ変数
    var arrayLength: Int!
    
    var wordmeanings: [[String:String]] = [[:]]
    var doushi: [[String:String]] = [[:]]
    var meishi: [[String:String]] = [[:]]
    var keiyoushi: [[String:String]] = [[:]]
    var all: [[String:String]] = [[:]]
    
    let koukoudoushi = [["abandon": "捨てる","abolish": "廃止する","absorb" : "吸収する","accelerate": "促進する"],["ban":"禁止する,kinnshisuru,banする"]]
    
    let koukoumeishi = [["abuse": "虐待", "access": "利用する権利", "accord": "一致/合意","acquaintance": "知人"]]
    
    let koukoukeiyoushi = [["（not）necessarily": "必ずしも〜でない","abruptly": "不意に","absolutely": "絶対に","abstract": "抽象的な"]]
    let koukouall = [["abandon": "捨てる","abolish": "廃止する","absorb" : "吸収する","accelerate": "促進する","abuse": "虐待", "access": "利用する権利", "accord": "一致/合意","acquaintance": "知人","（not）necessarily": "必ずしも〜でない","abruptly": "不意に","absolutely": "絶対に","abstract": "抽象的な"],["ban":"禁止する,kinnshisuru,banする"]]
    
    //
    //    let doushi2 = [["abandon","abolish","absorb","accelerate"],["ban"]]
    //    let doushi1 = [["捨てる","廃止する","吸収する", "促進する"],["禁止する"]]
    
    
    var categoryEnglish = ["動詞","名詞","形容詞"]
    
    //    private lazy var courseArray = [
    //        rail(isShown: true categoryName: self.categoryEnglish[0], stationArray: self.doushi[])
    //    ]
    
    
    
    //検索結果配列
    var searchResult = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        baseTableView.delegate = self
        baseTableView.dataSource = self
        
        // 選択されたジャンルによってセルの数を変える
        // getCellの中身が・・・
        switch getCell {
        // 0のとき
        case 0:
            doushi = koukoudoushi
            meishi = koukoumeishi
            keiyoushi = koukoukeiyoushi
            all = koukouall
        default:
            break
        }
        wordmeanings = doushi
        
        
        
        //        //デリゲート先を自分に設定する。
        //        baseSearch.delegate = self
        //        baseSearch.showsCancelButton = true
        //        baseSearch.enablesReturnKeyAutomatically = true
        //
        //        //何も入力されていなくてもReturnキーを押せるようにする。
        //        baseSearch.enablesReturnKeyAutomatically = false
        //        baseSearch.placeholder = "英単語検索"
        
        //        selectPicker.delegate = self
        //        selectPicker.dataSource = self
        //        selectPicker.isHidden = true
        //        // PickerView のサイズと位置
        //        selectPicker.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 0)
        
        
    }
    //　MARK:　- アクションシートの設定
    //カテゴリー選択
    @IBAction func pickerButton(_ sender: Any) {
        
        //アラート生成
        //UIAlertControllerのスタイルがactionSheet
        let actionSheet = UIAlertController(title: "MENU", message: "", preferredStyle: UIAlertController.Style.actionSheet)
        
        // 表示させたいタイトル1ボタンが押された時の処理をクロージャ実装する
        let action1 = UIAlertAction(title: "動詞", style: UIAlertAction.Style.default, handler: {
            (action: UIAlertAction!) in
            //実際の処理
            self.wordmeanings = self.doushi
            self.baseTableView.reloadData()
            
            print("表示させたいタイトル1の処理")
        })
        // 表示させたいタイトル2ボタンが押された時の処理をクロージャ実装する
        let action2 = UIAlertAction(title: "名詞", style: UIAlertAction.Style.default, handler: {
            (action: UIAlertAction!) in
            //実際の処理
            self.wordmeanings = self.meishi
            self.baseTableView.reloadData()
            
            print("表示させたいタイトル2の処理")
            
        })
        
        // 表示させたいタイトル３ボタンが押された時の処理をクロージャ実装する
        let action3 = UIAlertAction(title: "形容詞", style: UIAlertAction.Style.default, handler: {
            (action: UIAlertAction!) in
            //実際の処理
            self.wordmeanings = self.keiyoushi
            self.baseTableView.reloadData()
            
            print("表示させたいタイトル3の処理")
            
        })
        
        // 表示させたいタイトル４ボタンが押された時の処理をクロージャ実装する
        let action4 = UIAlertAction(title: "すべて", style: UIAlertAction.Style.default, handler: {
            (action: UIAlertAction!) in
            //実際の処理
            self.wordmeanings = self.all
            self.baseTableView.reloadData()
            
            print("表示させたいタイトル4の処理")
            
        })
        
        
        // 閉じるボタンが押された時の処理をクロージャ実装する
        //UIAlertActionのスタイルがCancelなので赤く表示される
        let close = UIAlertAction(title: "閉じる", style: UIAlertAction.Style.destructive, handler: {
            (action: UIAlertAction!) in
            //実際の処理
            print("閉じる")
        })
        
        //UIAlertControllerにタイトル1ボタンとタイトル2ボタンと閉じるボタンをActionを追加
        actionSheet.addAction(action1)
        actionSheet.addAction(action2)
        actionSheet.addAction(action3)
        actionSheet.addAction(action4)
        actionSheet.addAction(close)
        
        //実際にAlertを表示する
        self.present(actionSheet, animated: true, completion: nil)
        
    }
    
    //MARK: - cellの設定
    // データの数（＝セルの数）を返すメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //ここでしっかりと多次元配列の中身を表示できるようにする。
        return wordmeanings[section].keys.count
        
    }
    
    // 各セルの内容を返すメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 再利用可能な cell を得る
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        
        //前に選択されたカテゴリーによっての条件分岐
        switch getCell {
        // 0のとき
        case 0:
            doushi = koukoudoushi
            meishi = koukoumeishi
            keiyoushi = koukoukeiyoushi
        default:
            break
        }
        
        
        //cellのlableにタグをつけて表示する
        //wordLableは英単語のこと
        //meaningは英単語の意味
        //arrayの中から単語と意味が一緒に出てくるようになっている
        let base1 = cell.viewWithTag(1) as! UILabel//英単語のlable
        base1.text = Array(wordmeanings[indexPath.section].keys)[indexPath.row]
        
        let base2 = cell.viewWithTag(2) as! UILabel//単語の意味のlabel
        base2.text = Array(wordmeanings[indexPath.section].values)[indexPath.row]
        base2.lineBreakMode = .byCharWrapping//意味ラベルの改行の種類
        base2.numberOfLines = 5//改行の行数
        //
        //        let base2 = cell.viewWithTag(2) as! UILabel
        //        base2.text = wordmeaning.meaning
        //
        
        return cell
    }
    //cellが選択された時の動作
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        giveWord = Array(wordmeanings[indexPath.section].keys)[indexPath.row]
        giveMeaning = Array(wordmeanings[indexPath.section].values)[indexPath.row]
        
        // Segueを使った画面遷移を行う関数
        performSegue(withIdentifier: "toMyListSegue", sender: nil)
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
        label.backgroundColor = .gray
        
        //sectionの数とタイトルを設定できる
        switch section {
        case 0:
            label.text = "A"
        case 1:
            label.text = "B"
        case 2:
            label.text = "C"
        default:
            break
        }
        return label
    }
    //sectionの高さの設定
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    //    //タップされた時の動作
    //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //
    //        // セルの選択を解除
    //            tableView.deselectRow(at: indexPath, animated: true)
    //
    ////        performSegue(withIdentifier: "nextSegue",sender: nil) // ←追加する
    //
    //    }
    //
    //インデックスバーの設定
    //    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
    //        return ["名詞","動詞","形容詞"]
    //    }
    
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"] // インデックスバーの文字設定
    }
    // 特殊なことをしないのであれば特に実装しなくても対象のセクションが表示される
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
    
    @IBAction func toMyListButton(_ sender: Any) {
        //        performSegue(withIdentifier: "toMyListSegue",sender: nil) // ←追加する
        
        if let indexPath = baseTableView.indexPathForSelectedRow{
            giveWord = Array(wordmeanings[indexPath.section].keys)[indexPath.row]
            giveMeaning = Array(wordmeanings[indexPath.section].values)[indexPath.row]
    }
        
    }
    
    //MARK: - segue で画面遷移する時に呼ばれる
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "toMyListSegue" {
            let vc = segue.destination as! toMyListViewController
            vc.receiveWord = giveWord
            vc.receiveMeaning = giveMeaning
            
            
        }
        
        
    }
    
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //
    //        if segue.identifier == "nextSegue"{
    //            if let indexPath = baseTableView.indexPathForSelectedRow{
    //                guard let destination = segue.destination as? toTestViewController else{
    //                    fatalError("Failed to prepare toTestViewController.")
    //                }
    //                destination.wordmeaning = wordmeanings[indexPath.section][indexPath.row]
    //            }
    //        }
    //    }
    
    //    //検索ボタン押下時の呼び出しメソッド
    //    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    //        searchBar.endEditing(true)
    //    }
    //        func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
    //        searchResult.removeAll()//検索結果配列を空にする。
    //        //型がオプショナルなのでstring型に直す必要がある。
    //        //searchBarがオプショナルなのでguard let のコードを使って、アンラップする。
    //        //型が違うと文字が一緒でも検索結果に引っかからない。
    //        guard let searchText = baseSearch.text else {return}
    //
    //
    //        //テーブルを再読み込みする。
    //        baseTableView.reloadData()
    //    }
    
    
    
    
}

//extension baseViewController: UIPickerViewDelegate,UIPickerViewDataSource{
//    // UIPickerViewの列の数
//      func numberOfComponents(in pickerView: UIPickerView) -> Int {
//          return 1
//      }
//
//      // UIPickerViewの行数、リストの数
//      func pickerView(_ pickerView: UIPickerView,
//                      numberOfRowsInComponent component: Int) -> Int {
//          return categoryEnglish.count
//      }
//
//      // UIPickerViewの最初の表示
//      func pickerView(_ pickerView: UIPickerView,titleForRow row: Int,forComponent component: Int) -> String? {
//          return categoryEnglish[row]
//      }
//
//      // UIPickerViewのRowが選択された時の挙動
//      func pickerView(_ pickerView: UIPickerView,didSelectRow row: Int,inComponent component: Int) {
//        switch row {
//        case 0 :
//            wordmeanings = doushi
//        case 1 :
//            wordmeanings = meishi
//        case 2 :
//            wordmeanings = keiyoushi
//        default:
//            break
//        }
//
//
//      }
//
//}
