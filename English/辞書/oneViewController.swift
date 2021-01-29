//
//  oneViewController.swift
//  English
//
//  Created by 森下大地 on 2021/01/20.
//

import UIKit

class oneViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    @IBOutlet weak var oneTableView: UITableView!
    
    let selectedOne = ["高校生英語"]
    
    // 選択されたセルを覚える変数
    var chosenCell: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "選択してください"


        oneTableView.delegate = self
        oneTableView.dataSource = self
        
    }
    
    override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
           // Dispose of any resources that can be recreated.
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
        
           // セルのUILabelに配列の中身を順に表示
           cell.textLabel?.text = selectedOne[indexPath.row]

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
           performSegue(withIdentifier: "tobaseViewController",sender: nil)
       }

       // Segue 準備
       override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
           // 遷移先のViecControllerのインスタンスを生成
           let secVC: baseViewController = (segue.destination as? baseViewController)!
           // secondViewControllerのgetCellに選択された画像を設定する
           secVC.getCell = chosenCell

       }
    

}
