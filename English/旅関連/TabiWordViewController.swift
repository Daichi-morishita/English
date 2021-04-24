//
//  TabiWordViewController.swift
//  English
//
//  Created by 森下大地 on 2021/04/10.
//

import UIKit

class TabiWordViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tabiWordTableview: UITableView!
    
    var overword: [String] = ["さぁ世界へ"]
    var overword2: [String] = ["旅に出よう！"]
    // 遷移先のViewControllerに渡す変数
    var giveWord: String = ""
    var giveMeaning: String = ""
    
//    var tabiWordArray: [String] = []
//    var tabiWordDitail: [String] = []
    //基礎編
    var kisoArray: [String] = []
    var kisoDitail: [String] = []
    //生活用品
    var seikatsuyouhinArray: [String] = []
    var seikatsuyouhinDitail: [String] = []
    //学校
    var gakkouArray: [String] = []
    var gakkouDitail: [String] = []
    //保険
    var hokenArray: [String] = []
    var hokenDitail: [String] = []
    //家族職業
    var kazokuArray: [String] = []
    var kazokuDitail: [String] = []
    
    //宗教
    var shuukyouArray: [String] = []
    var shuukyouDitail: [String] = []
    //祝日
    var shukujitsuArray: [String] = []
    var shukujitsuDitail: [String] = []
    //住所
    var juushoArray: [String] = []
    var juushoDitail: [String] = []
    //衣食住
    var ishokujuuArray: [String] = []
    var ishokujuuDitail: [String] = []
    //美容
    var biyouArray: [String] = []
    var biyouDitail: [String] = []
    //公共施設
    var koukyoushisetsuArray: [String] = []
    var koukyoushisetsuDitail: [String] = []
    //お店
    var omiseArray: [String] = []
    var omiseDitail: [String] = []
    //病院
    var byouinArray: [String] = []
    var byouinDitail: [String] = []
    //アクシデント
    var akushidentArray: [String] = []
    var akushidentDitail: [String] = []
    //賃貸
    var chinntaiArray: [String] = []
    var chinntaiDitail: [String] = []
    //銀行
    var ginnkouArray: [String] = []
    var ginnkouDitail: [String] = []
    //車
    var kurumaArray: [String] = []
    var kurumaDitail: [String] = []
    //観光
    var kannkouArray: [String] = []
    var kannkouDitail: [String] = []
    //ホテル
    var hoteruArray: [String] = []
    var hoteruDitail: [String] = []

    // 選択されたセルを覚える変数
    var tabiCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - ファイル追加につきコードの追加が必要
        //0
        kisoArray = loadkiso(fileName: "kiso")
        kisoDitail = kisoArray[tabiCount].components(separatedBy: ",")
        //1
        seikatsuyouhinArray = loadSeikatsuyouhin(fileName: "seikatsuyouhin")
        seikatsuyouhinDitail = seikatsuyouhinArray[tabiCount].components(separatedBy: ",")
        //2
        gakkouArray = loadgakkou(fileName: "gakkou")
        gakkouDitail = gakkouArray[tabiCount].components(separatedBy: ",")
        //3
        hokenArray = loadhoken(fileName: "hoken")
        hokenDitail = hokenArray[tabiCount].components(separatedBy: ",")
        //4
        kazokuArray = loadkazoku(fileName: "kazoku")
        kazokuDitail = kazokuArray[tabiCount].components(separatedBy: ",")
        //5
        shuukyouArray = loadshuukyou(fileName: "shuukyou")
        shuukyouDitail = shuukyouArray[tabiCount].components(separatedBy: ",")
        //6
        shukujitsuArray = loadshukujitsu(fileName: "shukujitsu")
        shukujitsuDitail = shukujitsuArray[tabiCount].components(separatedBy: ",")
        //7
        juushoArray = loadjuusho(fileName: "juusho")
        juushoDitail = juushoArray[tabiCount].components(separatedBy: ",")
        //8
        ishokujuuArray = loadishokujuu(fileName: "ishokujuu")
        ishokujuuDitail = ishokujuuArray[tabiCount].components(separatedBy: ",")
        //9
        biyouArray = loadbiyou(fileName: "biyou")
        biyouDitail = biyouArray[tabiCount].components(separatedBy: ",")
        //10
        koukyoushisetsuArray = loadkoukyoushisetsu(fileName: "koukyoushisetsu")
        koukyoushisetsuDitail = koukyoushisetsuArray[tabiCount].components(separatedBy: ",")
        //11
        omiseArray = loadomise(fileName: "omise")
        omiseDitail = omiseArray[tabiCount].components(separatedBy: ",")
        //12
        byouinArray = loadbyouin(fileName: "byouin")
        byouinDitail = byouinArray[tabiCount].components(separatedBy: ",")
        //13
        akushidentArray = loadakushident(fileName: "akushident")
        akushidentDitail = akushidentArray[tabiCount].components(separatedBy: ",")
        //14
        chinntaiArray = loadchinntai(fileName: "chinntai")
        chinntaiDitail = chinntaiArray[tabiCount].components(separatedBy: ",")
        //15
        ginnkouArray = loadginnkou(fileName: "ginnkou")
        ginnkouDitail = ginnkouArray[tabiCount].components(separatedBy: ",")
        //16
        kurumaArray = loadkuruma(fileName: "kuruma")
        kurumaDitail = kisoArray[tabiCount].components(separatedBy: ",")
        //17
        kannkouArray = loadkannkou(fileName: "kannkou")
        kannkouDitail = kannkouArray[tabiCount].components(separatedBy: ",")
        //18
        hoteruArray = loadhoteru(fileName: "hoteru")
        hoteruArray = hoteruArray[tabiCount].components(separatedBy: ",")
        
        tabiWordTableview.dataSource = self
        tabiWordTableview.delegate = self
    }
  
//
    //MARK: - cellの設定
    // データの数（＝セルの数）を返すメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //MARK: - ファイル追加につきコードの追加が必要
        switch section {
        case 0:
            return kisoArray.count
        case 1:
            return seikatsuyouhinArray.count
        case 2:
            return gakkouArray.count
        case 3:
            return hokenArray.count
        case 4:
            return kazokuArray.count
        case 5:
            return shuukyouArray.count
        case 6:
            return shukujitsuArray.count
        case 7:
            return juushoArray.count
        case 8:
            return ishokujuuArray.count
        case 9:
            return biyouArray.count
        case 10:
            return koukyoushisetsuArray.count
        case 11:
            return omiseArray.count
        case 12:
            return byouinArray.count
        case 13:
            return akushidentArray.count
        case 14:
            return chinntaiArray.count
        case 15:
            return ginnkouArray.count
        case 16:
            return kurumaArray.count
        case 17:
            return kannkouArray.count
        case 18:
            return 0//hoteruArray.count
        case 19:
            return overword.count
        default:
            return 0
        }
        
    }
    
    // 各セルの内容を返すメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 再利用可能な cell を得る
        let cell = tableView.dequeueReusableCell(withIdentifier: "tabi_word", for: indexPath)
        
        //tableview内のラベルの関数
        let base1 = cell.viewWithTag(1) as! UILabel//英単語のlable
        let base2 = cell.viewWithTag(2) as! UILabel//単語の意味のlabel
        base1.lineBreakMode = .byCharWrapping
        base1.numberOfLines = 3
        base2.lineBreakMode = .byCharWrapping//意味ラベルの改行の種類
        base2.numberOfLines = 3//改行の行数
        
        //MARK: - ファイル追加につきコードの追加が必要
        //cellのlableにタグをつけて表示する
        switch indexPath.section {
        case 0:
            base1.text = kisoArray[indexPath.row].components(separatedBy: ",")[1]
            base2.text = kisoArray[indexPath.row].components(separatedBy: ",")[0]
        case 1:
            base1.text = seikatsuyouhinArray[indexPath.row].components(separatedBy: ",")[1]
            base2.text = seikatsuyouhinArray[indexPath.row].components(separatedBy: ",")[0]
        case 2:
            base1.text = gakkouArray[indexPath.row].components(separatedBy: ",")[1]
            base2.text = gakkouArray[indexPath.row].components(separatedBy: ",")[0]
        case 3:
            base1.text = hokenArray[indexPath.row].components(separatedBy: ",")[1]
            base2.text = hokenArray[indexPath.row].components(separatedBy: ",")[0]
        case 4:
            base1.text = kazokuArray[indexPath.row].components(separatedBy: ",")[1]
            base2.text = kazokuArray[indexPath.row].components(separatedBy: ",")[0]
        case 5:
            base1.text = shuukyouArray[indexPath.row].components(separatedBy: ",")[1]
            base2.text = shuukyouArray[indexPath.row].components(separatedBy: ",")[0]
        case 6:
            base1.text = shukujitsuArray[indexPath.row].components(separatedBy: ",")[1]
            base2.text = shukujitsuArray[indexPath.row].components(separatedBy: ",")[0]
        case 7:
            base1.text = juushoArray[indexPath.row].components(separatedBy: ",")[1]
            base2.text = juushoArray[indexPath.row].components(separatedBy: ",")[0]
        case 8:
            base1.text = ishokujuuArray[indexPath.row].components(separatedBy: ",")[1]
            base2.text = ishokujuuArray[indexPath.row].components(separatedBy: ",")[0]
        case 9:
            base1.text = biyouArray[indexPath.row].components(separatedBy: ",")[1]
            base2.text = biyouArray[indexPath.row].components(separatedBy: ",")[0]
        case 10:
            base1.text = koukyoushisetsuArray[indexPath.row].components(separatedBy: ",")[1]
            base2.text = koukyoushisetsuArray[indexPath.row].components(separatedBy: ",")[0]
        case 11:
            base1.text = omiseArray[indexPath.row].components(separatedBy: ",")[1]
            base2.text = omiseArray[indexPath.row].components(separatedBy: ",")[0]
        case 12:
            base1.text = byouinArray[indexPath.row].components(separatedBy: ",")[1]
            base2.text = byouinArray[indexPath.row].components(separatedBy: ",")[0]
        case 13:
            base1.text = akushidentArray[indexPath.row].components(separatedBy: ",")[1]
            base2.text = akushidentArray[indexPath.row].components(separatedBy: ",")[0]
        case 14:
            base1.text = chinntaiArray[indexPath.row].components(separatedBy: ",")[1]
            base2.text = chinntaiArray[indexPath.row].components(separatedBy: ",")[0]
        case 15:
            base1.text = ginnkouArray[indexPath.row].components(separatedBy: ",")[1]
            base2.text = ginnkouArray[indexPath.row].components(separatedBy: ",")[0]
        case 16:
            base1.text = kurumaArray[indexPath.row].components(separatedBy: ",")[1]
            base2.text = kurumaArray[indexPath.row].components(separatedBy: ",")[0]
        case 17:
            base1.text = kannkouArray[indexPath.row].components(separatedBy: ",")[1]
            base2.text = kannkouArray[indexPath.row].components(separatedBy: ",")[0]
        case 18:
            base1.text = hoteruArray[indexPath.row].components(separatedBy: ",")[1]
            base2.text = hoteruArray[indexPath.row].components(separatedBy: ",")[0]
        case 19:
            base1.text = overword[indexPath.row]
            base2.text = overword2[indexPath.row]
        default:
            break
        }
       

           return cell
    }
    //cellが選択された時の動作
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // セルの選択を解除
        tableView.deselectRow(at: indexPath, animated: true)

//MARK: - ファイル追加につきコードの追加が必要
        switch indexPath.section {
        case 0:
            giveWord = kisoArray[indexPath.row].components(separatedBy: ",")[1]
            giveMeaning = kisoArray[indexPath.row].components(separatedBy: ",")[0]
        case 1:
            giveWord = seikatsuyouhinArray[indexPath.row].components(separatedBy: ",")[1]
            giveMeaning = seikatsuyouhinArray[indexPath.row].components(separatedBy: ",")[0]
        case 2:
            giveWord = gakkouArray[indexPath.row].components(separatedBy: ",")[1]
            giveMeaning = gakkouArray[indexPath.row].components(separatedBy: ",")[0]
        case 3:
            giveWord = hokenArray[indexPath.row].components(separatedBy: ",")[1]
            giveMeaning = hokenArray[indexPath.row].components(separatedBy: ",")[0]
        case 4:
            giveWord = kazokuArray[indexPath.row].components(separatedBy: ",")[1]
            giveMeaning = kazokuArray[indexPath.row].components(separatedBy: ",")[0]
        case 5:
            giveWord = shuukyouArray[indexPath.row].components(separatedBy: ",")[1]
            giveMeaning = shuukyouArray[indexPath.row].components(separatedBy: ",")[0]
        case 6:
            giveWord = shukujitsuArray[indexPath.row].components(separatedBy: ",")[1]
            giveMeaning = shukujitsuArray[indexPath.row].components(separatedBy: ",")[0]
        case 7:
            giveWord = juushoArray[indexPath.row].components(separatedBy: ",")[1]
            giveMeaning = juushoArray[indexPath.row].components(separatedBy: ",")[0]
        case 8:
            giveWord = ishokujuuArray[indexPath.row].components(separatedBy: ",")[1]
            giveMeaning = ishokujuuArray[indexPath.row].components(separatedBy: ",")[0]
        case 9:
            giveWord = biyouArray[indexPath.row].components(separatedBy: ",")[1]
            giveMeaning = biyouArray[indexPath.row].components(separatedBy: ",")[0]
        case 10:
            giveWord = koukyoushisetsuArray[indexPath.row].components(separatedBy: ",")[1]
            giveMeaning = koukyoushisetsuArray[indexPath.row].components(separatedBy: ",")[0]
        case 11:
            giveWord = omiseArray[indexPath.row].components(separatedBy: ",")[1]
            giveMeaning = omiseArray[indexPath.row].components(separatedBy: ",")[0]
        case 12:
            giveWord = byouinArray[indexPath.row].components(separatedBy: ",")[1]
            giveMeaning = byouinArray[indexPath.row].components(separatedBy: ",")[0]
        case 13:
            giveWord = akushidentArray[indexPath.row].components(separatedBy: ",")[1]
            giveMeaning = akushidentArray[indexPath.row].components(separatedBy: ",")[0]
        case 14:
            giveWord = chinntaiArray[indexPath.row].components(separatedBy: ",")[1]
            giveMeaning = chinntaiArray[indexPath.row].components(separatedBy: ",")[0]
        case 15:
            giveWord = ginnkouArray[indexPath.row].components(separatedBy: ",")[1]
            giveMeaning = ginnkouArray[indexPath.row].components(separatedBy: ",")[0]
        case 16:
            giveWord = kurumaArray[indexPath.row].components(separatedBy: ",")[1]
            giveMeaning = kurumaArray[indexPath.row].components(separatedBy: ",")[0]
        case 17:
            giveWord = kannkouArray[indexPath.row].components(separatedBy: ",")[1]
            giveMeaning = kannkouArray[indexPath.row].components(separatedBy: ",")[0]
        case 18:
            giveWord = hoteruArray[indexPath.row].components(separatedBy: ",")[1]
            giveMeaning = hoteruArray[indexPath.row].components(separatedBy: ",")[0]
        default:
            break
        }
        
        //最後のcellは違う遷移をする
        if indexPath.section == 19 {
            // Segueを使った画面遷移を行う関数
            performSegue(withIdentifier: "PraeParet", sender: nil)
        }else{
        // Segueを使った画面遷移を行う関数
        performSegue(withIdentifier: "fromTabiWord", sender: nil)
    }
    }
    
    // Cell の高さを１００にする
    func tableView(_ table: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    //MARK: - ファイル追加につきコードの追加が必要
    //section設定
    func numberOfSections(in tableView: UITableView) -> Int {
        return 20
    }
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return ["基","生","学","保","家","宗","祝","住","衣","美","公","店","病","ア","賃","銀","車","観","P"]
        // インデックスバーの文字設定
    }

    //sectionの高さの設定
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    //sectionのテキスト表示の設定
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = .lightGray
        
        //sectionの数とタイトルを設定できる
        switch section {
        case 0:
            label.text = "基礎"
        case 1:
            label.text = "生活用品"
        case 2:
            label.text = "学校"
        case 3:
            label.text = "保険"
        case 4:
            label.text = "家族・職業"
        case 5:
            label.text = "宗教"
        case 6:
            label.text = "祝日"
        case 7:
            label.text = "住所"
        case 8:
            label.text = "衣食住"
        case 9:
            label.text = "美容"
        case 10:
            label.text = "公共施設"
        case 11:
            label.text = "お店"
        case 12:
            label.text = "病院"
        case 13:
            label.text = "アクシデント"
        case 14:
            label.text = "賃貸"
        case 15:
            label.text = "銀行"
        case 16:
            label.text = "車"
        case 17:
            label.text = "観光"
        case 18:
            label.text = ""
        case 19:
            label.text = ""
        default:
            break
        }
        return label
    }
    
    //MARK: - segue で画面遷移する時に呼ばれる
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "fromTabiWord" {
            let vc = segue.destination as! toMyListViewController
            vc.receiveWord = giveWord
            vc.receiveMeaning = giveMeaning
            
            
        }
        
        
    }

    //MARK: - ファイル追加につきコードの追加が必要
    func loadkiso(fileName: String) -> [String] {//0
        let csvBundle = Bundle.main.path(forResource: fileName, ofType: "csv")!
        do {
            let csvData = try String(contentsOfFile: csvBundle,encoding: String.Encoding.utf8)
            let lineChange = csvData.replacingOccurrences(of: "\r", with: "\n")
            kisoArray = lineChange.components(separatedBy: "\n")
            kisoArray.removeLast()
        } catch {
            print("エラー")
        }
        return kisoArray
    }
    func loadSeikatsuyouhin(fileName: String) -> [String] {//1
        let csvBundle = Bundle.main.path(forResource: fileName, ofType: "csv")!
        do {
            let csvData = try String(contentsOfFile: csvBundle,encoding: String.Encoding.utf8)
            let lineChange = csvData.replacingOccurrences(of: "\r", with: "\n")
            seikatsuyouhinArray = lineChange.components(separatedBy: "\n")
            seikatsuyouhinArray.removeLast()
        } catch {
            print("エラー")
        }
        return seikatsuyouhinArray
    }
    func loadgakkou(fileName: String) -> [String] {//2
        let csvBundle = Bundle.main.path(forResource: fileName, ofType: "csv")!
        do {
            let csvData = try String(contentsOfFile: csvBundle,encoding: String.Encoding.utf8)
            let lineChange = csvData.replacingOccurrences(of: "\r", with: "\n")
            gakkouArray = lineChange.components(separatedBy: "\n")
            gakkouArray.removeLast()
        } catch {
            print("エラー")
        }
        return gakkouArray
    }
    func loadhoken(fileName: String) -> [String] {//3
        let csvBundle = Bundle.main.path(forResource: fileName, ofType: "csv")!
        do {
            let csvData = try String(contentsOfFile: csvBundle,encoding: String.Encoding.utf8)
            let lineChange = csvData.replacingOccurrences(of: "\r", with: "\n")
            hokenArray = lineChange.components(separatedBy: "\n")
            hokenArray.removeLast()
        } catch {
            print("エラー")
        }
        return hokenArray
    }
    func loadkazoku(fileName: String) -> [String] {//4
        let csvBundle = Bundle.main.path(forResource: fileName, ofType: "csv")!
        do {
            let csvData = try String(contentsOfFile: csvBundle,encoding: String.Encoding.utf8)
            let lineChange = csvData.replacingOccurrences(of: "\r", with: "\n")
            kazokuArray = lineChange.components(separatedBy: "\n")
            kazokuArray.removeLast()
        } catch {
            print("エラー")
        }
        return kazokuArray
    }
    func loadshuukyou(fileName: String) -> [String] {//5
        let csvBundle = Bundle.main.path(forResource: fileName, ofType: "csv")!
        do {
            let csvData = try String(contentsOfFile: csvBundle,encoding: String.Encoding.utf8)
            let lineChange = csvData.replacingOccurrences(of: "\r", with: "\n")
            shuukyouArray = lineChange.components(separatedBy: "\n")
            shuukyouArray.removeLast()
        } catch {
            print("エラー")
        }
        return shuukyouArray
    }
    func loadshukujitsu(fileName: String) -> [String] {//6
        let csvBundle = Bundle.main.path(forResource: fileName, ofType: "csv")!
        do {
            let csvData = try String(contentsOfFile: csvBundle,encoding: String.Encoding.utf8)
            let lineChange = csvData.replacingOccurrences(of: "\r", with: "\n")
            shukujitsuArray = lineChange.components(separatedBy: "\n")
            shukujitsuArray.removeLast()
        } catch {
            print("エラー")
        }
        return shukujitsuArray
    }
    func loadjuusho(fileName: String) -> [String] {//7
        let csvBundle = Bundle.main.path(forResource: fileName, ofType: "csv")!
        do {
            let csvData = try String(contentsOfFile: csvBundle,encoding: String.Encoding.utf8)
            let lineChange = csvData.replacingOccurrences(of: "\r", with: "\n")
            juushoArray = lineChange.components(separatedBy: "\n")
            juushoArray.removeLast()
        } catch {
            print("エラー")
        }
        return juushoArray
    }
    func loadishokujuu(fileName: String) -> [String] {//8
        let csvBundle = Bundle.main.path(forResource: fileName, ofType: "csv")!
        do {
            let csvData = try String(contentsOfFile: csvBundle,encoding: String.Encoding.utf8)
            let lineChange = csvData.replacingOccurrences(of: "\r", with: "\n")
            ishokujuuArray = lineChange.components(separatedBy: "\n")
            ishokujuuArray.removeLast()
        } catch {
            print("エラー")
        }
        return ishokujuuArray
    }
    func loadbiyou(fileName: String) -> [String] {//9
        let csvBundle = Bundle.main.path(forResource: fileName, ofType: "csv")!
        do {
            let csvData = try String(contentsOfFile: csvBundle,encoding: String.Encoding.utf8)
            let lineChange = csvData.replacingOccurrences(of: "\r", with: "\n")
            biyouArray = lineChange.components(separatedBy: "\n")
            biyouArray.removeLast()
        } catch {
            print("エラー")
        }
        return biyouArray
    }
    func loadkoukyoushisetsu(fileName: String) -> [String] {//10
        let csvBundle = Bundle.main.path(forResource: fileName, ofType: "csv")!
        do {
            let csvData = try String(contentsOfFile: csvBundle,encoding: String.Encoding.utf8)
            let lineChange = csvData.replacingOccurrences(of: "\r", with: "\n")
            koukyoushisetsuArray = lineChange.components(separatedBy: "\n")
            koukyoushisetsuArray.removeLast()
        } catch {
            print("エラー")
        }
        return koukyoushisetsuArray
    }
    func loadomise(fileName: String) -> [String] {//11
        let csvBundle = Bundle.main.path(forResource: fileName, ofType: "csv")!
        do {
            let csvData = try String(contentsOfFile: csvBundle,encoding: String.Encoding.utf8)
            let lineChange = csvData.replacingOccurrences(of: "\r", with: "\n")
            omiseArray = lineChange.components(separatedBy: "\n")
            omiseArray.removeLast()
        } catch {
            print("エラー")
        }
        return omiseArray
    }
    func loadbyouin(fileName: String) -> [String] {//12
        let csvBundle = Bundle.main.path(forResource: fileName, ofType: "csv")!
        do {
            let csvData = try String(contentsOfFile: csvBundle,encoding: String.Encoding.utf8)
            let lineChange = csvData.replacingOccurrences(of: "\r", with: "\n")
            byouinArray = lineChange.components(separatedBy: "\n")
            byouinArray.removeLast()
        } catch {
            print("エラー")
        }
        return byouinArray
    }
    func loadakushident(fileName: String) -> [String] {//13
        let csvBundle = Bundle.main.path(forResource: fileName, ofType: "csv")!
        do {
            let csvData = try String(contentsOfFile: csvBundle,encoding: String.Encoding.utf8)
            let lineChange = csvData.replacingOccurrences(of: "\r", with: "\n")
            akushidentArray = lineChange.components(separatedBy: "\n")
            akushidentArray.removeLast()
        } catch {
            print("エラー")
        }
        return akushidentArray
    }
    func loadchinntai(fileName: String) -> [String] {//14
        let csvBundle = Bundle.main.path(forResource: fileName, ofType: "csv")!
        do {
            let csvData = try String(contentsOfFile: csvBundle,encoding: String.Encoding.utf8)
            let lineChange = csvData.replacingOccurrences(of: "\r", with: "\n")
            chinntaiArray = lineChange.components(separatedBy: "\n")
            chinntaiArray.removeLast()
        } catch {
            print("エラー")
        }
        return chinntaiArray
    }
    func loadginnkou(fileName: String) -> [String] {//15
        let csvBundle = Bundle.main.path(forResource: fileName, ofType: "csv")!
        do {
            let csvData = try String(contentsOfFile: csvBundle,encoding: String.Encoding.utf8)
            let lineChange = csvData.replacingOccurrences(of: "\r", with: "\n")
            ginnkouArray = lineChange.components(separatedBy: "\n")
            ginnkouArray.removeLast()
        } catch {
            print("エラー")
        }
        return ginnkouArray
    }
    func loadkuruma(fileName: String) -> [String] {//16
        let csvBundle = Bundle.main.path(forResource: fileName, ofType: "csv")!
        do {
            let csvData = try String(contentsOfFile: csvBundle,encoding: String.Encoding.utf8)
            let lineChange = csvData.replacingOccurrences(of: "\r", with: "\n")
            kurumaArray = lineChange.components(separatedBy: "\n")
            kurumaArray.removeLast()
        } catch {
            print("エラー")
        }
        return kurumaArray
    }
    func loadkannkou(fileName: String) -> [String] {//17
        let csvBundle = Bundle.main.path(forResource: fileName, ofType: "csv")!
        do {
            let csvData = try String(contentsOfFile: csvBundle,encoding: String.Encoding.utf8)
            let lineChange = csvData.replacingOccurrences(of: "\r", with: "\n")
            kannkouArray = lineChange.components(separatedBy: "\n")
            kannkouArray.removeLast()
        } catch {
            print("エラー")
        }
        return kannkouArray
    }
    func loadhoteru(fileName: String) -> [String] {//18
        let csvBundle = Bundle.main.path(forResource: fileName, ofType: "csv")!
        do {
            let csvData = try String(contentsOfFile: csvBundle,encoding: String.Encoding.utf8)
            let lineChange = csvData.replacingOccurrences(of: "\r", with: "\n")
            hoteruArray = lineChange.components(separatedBy: "\n")
            hoteruArray.removeLast()
        } catch {
            print("エラー")
        }
        return hoteruArray
    }
    
}
