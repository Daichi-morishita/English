//
//  sentenceViewController.swift
//  English
//
//  Created by 森下大地 on 2021/04/09.
//

import UIKit

class sentenceViewController: UIViewController, UITableViewDelegate, UITableViewDataSource   {
    @IBOutlet weak var tabiTableView: UITableView!
    
    var tabiChoosed = ["旅フレーズ", "旅単語"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabiTableView.delegate = self
        tabiTableView.dataSource = self
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
    
    //       // セルが選択された時に呼ばれる
    //       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        // セルの選択を解除
    //               tableView.deselectRow(at: indexPath, animated: true)
    //           // 選択されたcellの番号を記憶
    //           chosenCell = indexPath.row
    //           // 画面遷移の準備
    //        if chosenCell == 0{
    //           performSegue(withIdentifier: "tobaseViewController",sender: nil)
    //        } else if chosenCell == 1{
    //           performSegue(withIdentifier: "tabiSegue",sender: nil)
    //        }
    //       }
    //
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

