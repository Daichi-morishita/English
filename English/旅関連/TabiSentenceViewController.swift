//
//  TabiSentenceViewController.swift
//  English
//
//  Created by 森下大地 on 2021/04/10.
//

import UIKit
import RealmSwift

class TabiSentenceViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tabiSentenceTableView: UITableView!
    
    var tabisentenceArray: [String] = []
    var tabifureDitail: [String] = []
    // 選択されたセルを覚える変数
    var tabiCount = 0
  
    override func viewDidLoad() {
        super.viewDidLoad()
        tabisentenceArray = loadCSV(fileName: "tabifure-zu")
        tabifureDitail = tabisentenceArray[tabiCount].components(separatedBy: ",")
//        wordLable.text = quizArray[0]
//        meaningLable.text = quizArray[1]
        
        tabiSentenceTableView.delegate = self
        tabiSentenceTableView.dataSource = self
    }
    
    func loadCSV(fileName: String) -> [String] {
        let csvBundle = Bundle.main.path(forResource: fileName, ofType: "csv")!
        do {
            let csvData = try String(contentsOfFile: csvBundle,encoding: String.Encoding.utf8)
            let lineChange = csvData.replacingOccurrences(of: "\r", with: "\n")
            tabisentenceArray = lineChange.components(separatedBy: "\n")
            tabisentenceArray.removeLast()
        } catch {
            print("エラー")
        }
        return tabisentenceArray
    }
    
    // セルの数を指定
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           // someArrayの中身の数だけセルを表示
           return tabisentenceArray.count
       }

       // 各セルの要素を指定
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
           // UITableViewCellのインスタンスを生成
        let cell = tableView.dequeueReusableCell(withIdentifier: "tabi_Sentence", for: indexPath)
       
        let dataDetail = tabisentenceArray[indexPath.row].components(separatedBy: ",")
           // セルのUILabelに配列の中身を順に表示
        let base1 = cell.viewWithTag(1) as! UILabel//英単語のlable
        let base2 = cell.viewWithTag(2) as! UILabel//単語の意味のlabel
        base1.text = dataDetail[0]
        base2.text = dataDetail[1]
//        cell.textLabel?.font = UIFont.systemFont(ofSize: 20)
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
//           // 選択されたcellの番号を記憶
        tabiCount = indexPath.row
        // 画面遷移の準備
        performSegue(withIdentifier: "tabiSegue",sender: nil)
    }
    //MARK: - segue で画面遷移する時に呼ばれる
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "tabiSegue" {
            let vc = segue.destination as! TabisentenceDitailViewController
            vc.getTabiCount = tabiCount

        }


    }

}

