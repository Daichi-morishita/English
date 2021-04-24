//
//  TabisentenceDitailViewController.swift
//  English
//
//  Created by 森下大地 on 2021/04/13.
//

import UIKit
import RealmSwift

class TabisentenceDitailViewController: UIViewController {
    @IBOutlet weak var tabiLabel0: UILabel!
    @IBOutlet weak var tabiLabel1: UILabel!
    @IBOutlet weak var tabiLabel2: UILabel!
    @IBOutlet weak var tabiLabel3: UILabel!
    @IBOutlet weak var addCategoryText: UITextField!
  
    var addCategoryPicker: UIPickerView = UIPickerView()

    
    let realm = try! Realm()
    var list: List!
    
    let categoryList = ["旅","動詞","名詞","形容詞、副詞","その他"]
    
    
    var tabisentenceArray: [String] = []
    var tabifureDitail: [String] = []
    var getTabiCount: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabiLabel0.font = UIFont.systemFont(ofSize: 35)
        tabiLabel1.font = UIFont.systemFont(ofSize: 30)


        
        addCategoryText.text = "旅"
        
        tabisentenceArray = loadCSV(fileName: "tabifure-zu")
        
        tabifureDitail = tabisentenceArray[getTabiCount].components(separatedBy: ",")
        tabiLabel0.text = tabifureDitail[0]
        tabiLabel1.text = tabifureDitail[1]
        tabiLabel2.text = tabifureDitail[2]
        tabiLabel3.text = tabifureDitail[3]
        // Do any additional setup after loading the view.
        
        // ピッカー設定
        addCategoryPicker.delegate = self
        addCategoryPicker.dataSource = self
        
        // 決定バーの生成
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 40))
        let spacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        toolbar.setItems([spacelItem, doneItem], animated: true)
        
        // インプットビュー設定
        addCategoryText.inputView = addCategoryPicker
        addCategoryText.inputAccessoryView = toolbar
        
//        addMeaningText.layer.cornerRadius = 5.0
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
    
    // segue で画面遷移する時に呼ばれる
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let listView:listViewController = segue.destination as! listViewController
        if segue.identifier == "addFromTabi" {
            let list = List()
            
            let allLists = realm.objects(List.self).sorted(byKeyPath: "id", ascending: true)
            if allLists.count != 0 {
                list.id = allLists.max(ofProperty: "id")! + 1
            }
            
            listView.list = list
        }
        
        let addList = segue.destination as! listViewController
        addList.receiveWord1 = tabiLabel0.text!
        addList.receiveMeaning1 = tabiLabel1.text!
        addList.receiveCategory1 = addCategoryText.text!
        addList.addBool = true
    }

}
//MARK: - pickerviewの設定
extension TabisentenceDitailViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    // UIPickerViewの列の数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // UIPickerViewの行数、リストの数
    func pickerView(_ pickerView: UIPickerView,numberOfRowsInComponent component: Int) -> Int {
        return categoryList.count
    }
    // UIPickerViewの最初の表示
    func pickerView(_ pickerView: UIPickerView,titleForRow row: Int,forComponent component: Int) -> String? {
        
        return categoryList[row]
    }
    
    
    
    // 決定ボタン押下
    @objc func done() {
        addCategoryText.endEditing(true)
        addCategoryText.text = "\(categoryList[addCategoryPicker.selectedRow(inComponent: 0)])"
        
    }
}
