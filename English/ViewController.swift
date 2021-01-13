//
//  ViewController.swift
//  English
//
//  Created by 森下大地 on 2020/12/26.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    let vegetables = ["apple": "りんご","ban": "禁止する","catch": "捕まえる"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vegetables.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "")
        cell.textLabel?.text = Array(vegetables.keys)[indexPath.row]
        cell.detailTextLabel?.text = Array(vegetables.values)[indexPath.row]
        cell.detailTextLabel?.textColor = .black
        return cell
    }
    
    // Cell の高さを１２０にする
    func tableView(_ table: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    //section設定
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
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
    
    
}
