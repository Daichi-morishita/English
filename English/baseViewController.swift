//
//  baseViewController.swift
//  English
//
//  Created by 森下大地 on 2020/12/13.
//

import UIKit

//単語と意味をまとめるための関数
class  WordMeaning{
    let word: String
    let meaning: String
    
    init(word: String, meaning: String) {
        self.word = word
        self.meaning = meaning
    }
    
}

class baseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var baseTableView: UITableView!
    
  
    //単語と意味をまとめている。
    //sectionが設定でき、増やすためには下で設定できる
    let wordmeaning:[[WordMeaning]] = [
        [.init(word: "follow", meaning: "続く/従う"),
         .init(word: "consider", meaning: "考慮する "),
         .init(word: "increase", meaning: "増える "),
         .init(word: "expect", meaning: "予期する "),
         .init(word: "decide", meaning: "決意する/決定する "),
         .init(word: "develop", meaning: "発達する "),
         .init(word: "provide", meaning: "供給する/与える "),
         .init(word: "continue", meaning: "続ける "),
         .init(word: "include", meaning: "含む "),
         .init(word: "remain", meaning: "ままでいる "),
         .init(word: "reach", meaning: "着く/達する "),
         .init(word: "allow", meaning: "許可する "),
         .init(word: "force", meaning: "強制する "),
         .init(word: "offer", meaning: "申し出る "),
         .init(word: "realize", meaning: "悟る "),
         .init(word: "require", meaning: "必要とする "),
         .init(word: "suggest", meaning: "提案する "),
         .init(word: "worry", meaning: "心配する "),
         .init(word: "wonder", meaning: "疑問に思う "),
         .init(word: "cost", meaning: "＜費用を＞要する "),
         .init(word: "tend", meaning: "傾向がある "),
         .init(word: "depend", meaning: "依存する "),
         .init(word: "share", meaning: "共有する "),
         .init(word: "demand", meaning: "要求する "),
         .init(word: "support", meaning: "支持する "),
         .init(word: "hire", meaning: "雇う "),
         .init(word: "regard　", meaning: "みなす "),
         .init(word: "base", meaning: "基づいている "),
         .init(word: "improve", meaning: "向上させる "),
         .init(word: "recognize", meaning: "認める "),
         .init(word: "notice", meaning: "気づく "),
         .init(word: "suppose", meaning: "想像する/仮定する "),
         .init(word: "prefer", meaning: "〜をより好む "),
         .init(word: "enter", meaning: "入る/記入する "),
         .init(word: "suffer", meaning: "経験する/苦しむ "),
         .init(word: "describe", meaning: "描写する "),
         .init(word: "prevent", meaning: "妨げる "),
         .init(word: "reduce", meaning: "減らす "),
         .init(word: "mistake", meaning: "誤解する "),
         .init(word: "raise", meaning: "上げる/育てる "),
         .init(word: "prepare", meaning: "準備をする "),
         .init(word: "encourage", meaning: "励ます "),
         .init(word: "prove", meaning: "証明する "),
         .init(word: "join", meaning: "参加する "),
         .init(word: "treat", meaning: "扱う "),
         .init(word: "establish", meaning: "確立する/設立する "),
         .init(word: "relate", meaning: "関係がある "),
         .init(word: "compare", meaning: "比較する "),
         .init(word: "spread", meaning: "広がる/広げる "),
         .init(word: "refer", meaning: "指示する/言及する "),
         .init(word: "supply", meaning: "供給する/支給する "),
         .init(word: "gain", meaning: "得る "),
         .init(word: "destroy", meaning: "破壊する "),
         .init(word: "apply", meaning: "当てはまる/申し込む "),
         .init(word: "seek", meaning: "求める "),
         .init(word: "search", meaning: "探す "),
         .init(word: "claim", meaning: "主張する "),
         .init(word: "draw", meaning: "引っ張る/描く "),
         .init(word: "introduce", meaning: "紹介する "),
         .init(word: "refuse", meaning: "断る "),
         .init(word: "mention", meaning: "述べる "),
         .init(word: "judge", meaning: "判断する "),
         .init(word: "approach", meaning: "接近する/取り組む "),
         .init(word: "admit", meaning: "認める "),
         .init(word: "reflect", meaning: "反映する/反射する "),
         .init(word: "perform", meaning: "行う/遂行する "),
         .init(word: "bore", meaning: "うんざりさせる "),
         .init(word: "survive", meaning: "生き残る "),
         .init(word: "represent", meaning: "表す "),
         .init(word: "argue", meaning: "主張する/議論する "),
         .init(word: "grant", meaning: "認める/与える "),
         .init(word: "indicate", meaning: "指し示す "),
         .init(word: "belong", meaning: "所属する "),
         .init(word: "acquire", meaning: "習得する "),
         .init(word: "reply", meaning: "返信する/返事をする "),
         .init(word: "feed", meaning: "エサをやる "),
         .init(word: "escape", meaning: "逃げる "),
         .init(word: "replace", meaning: "取って代わる "),
         .init(word: "reveal", meaning: "明らかにする "),
         .init(word: "surround", meaning: "取り囲む "),
         .init(word: "suit", meaning: "合う "),
         .init(word: "estimate", meaning: "推定する "),
         .init(word: "aim", meaning: "ねらう/目指す "),
         .init(word: "earn", meaning: "もうける/稼ぐ "),
         .init(word: "decline", meaning: "低下する/辞退する "),
         .init(word: "afford", meaning: "余裕がある "),
         .init(word: "confuse", meaning: "当惑させる "),
         .init(word: "graduate", meaning: "卒業する "),
         .init(word: "vary", meaning: "変わる/さまざまである "),
         .init(word: "remove", meaning: "移す/取り去る "),
         .init(word: "insist", meaning: "主張する/言い張る "),
         .init(word: "examine", meaning: "調査する "),
         .init(word: "remind", meaning: "思い出させる "),
         .init(word: "contribute", meaning: "貢献する "),
         .init(word: "warn", meaning: "警告する "),
         .init(word: "connect", meaning: "つなぐ/関係づける "),
         .init(word: "match", meaning: "匹敵する/調和する "),
         .init(word: "focus", meaning: "焦点を合わせる "),
         .init(word: "reject", meaning: "断る "),
         .init(word: "convince", meaning: "納得させる "),
         .init(word: "associate", meaning: "関連づける/連想させる "),
         .init(word: "rush", meaning: "急いで行く "),
         .init(word: "stress", meaning: "強調する "),
         .init(word: "attract", meaning: "引きつける/誘惑する "),
         .init(word: "reply", meaning: "頼る "),
         .init(word: "respond", meaning: "返答する "),
         .init(word: "threaten", meaning: "脅迫する "),
         .init(word: "adopt", meaning: "採用する/養子にする "),
         .init(word: "shake", meaning: "振る/動揺させる "),
         .init(word: "hurt", meaning: "傷つける "),
         .init(word: "operate", meaning: "作動する/操作する "),
         .init(word: "extend", meaning: "広げる/延長する "),
         .init(word: "blame", meaning: "非難する "),
         .init(word: "consist", meaning: "構成されている "),
         .init(word: "persuade", meaning: "説得する "),
         .init(word: "admire", meaning: "感心する/賞賛する "),
         .init(word: "disappoint", meaning: "失望させる "),
         .init(word: "expand", meaning: "拡大する "),
         .init(word: "preserve", meaning: "保護する "),
         .init(word: "struggle", meaning: "もがく/努力する "),
         .init(word: "arrange", meaning: "手はずを整える "),
         .init(word: "disturb", meaning: "妨げる/邪魔をする "),
         .init(word: "employ", meaning: "雇う "),
         .init(word: "engage", meaning: "従事する "),
         .init(word: "abandon", meaning: "捨てる "),
         .init(word: "display", meaning: "展示する "),
         .init(word: "encounter", meaning: "偶然出会う/遭遇する "),
         .init(word: "exhaust", meaning: "疲れ果てさせる "),
         .init(word: "bother", meaning: "面倒をかける/困らせる "),
         .init(word: "concentrate", meaning: "集中する "),
         .init(word: "adapt", meaning: "適応する "),
         .init(word: "puzzle", meaning: "当惑させる "),
         .init(word: "apeal", meaning: "＜理性・感情など＞訴える/引きつける "),
         .init(word: "combine", meaning: "結合させる "),
         .init(word: "delay", meaning: "遅らせる "),
         .init(word: "reapir", meaning: "修理する "),
         .init(word: "fascinate", meaning: "夢中にさせる "),
         .init(word: "devote", meaning: "ささげる "),
         .init(word: "import", meaning: "輸入する "),
         .init(word: "remark", meaning: "述べる "),
         .init(word: "reserve", meaning: "予約する "),
         .init(word: "amaze", meaning: "驚嘆させる "),
         .init(word: "frighten", meaning: "怯えさせる "),
         .init(word: "release", meaning: "解放する "),
         .init(word: "rent", meaning: "＜家賃など＞賃借りする "),
         .init(word: "recover", meaning: "回復する "),
         .init(word: "suspect", meaning: "疑う "),
         .init(word: "deliver", meaning: "配達する "),
         .init(word: "identify", meaning: "正体をつきとめる/確認する "),
         .init(word: "locate", meaning: "位置する "),
         .init(word: "manufacture", meaning: "製造する "),
         .init(word: "occupy", meaning: "占める "),
         .init(word: "own", meaning: "所有している "),
         .init(word: "expose", meaning: "さらす "),
         .init(word: "conclude", meaning: "結論づける "),
         .init(word: "cure", meaning: "治療する "),
         .init(word: "perceive", meaning: "知覚する/気づく "),
         .init(word: "ban", meaning: "禁止する "),
         .init(word: "alarm", meaning: "怯えさせる "),
         .init(word: "derive", meaning: "由来する "),
         .init(word: "neglect", meaning: "無視する "),
         .init(word: "adjust", meaning: "慣れる "),
         .init(word: "shift", meaning: "変える/移す "),
         .init(word: "embarrass", meaning: "困惑させる/恥ずかしい思いをさせる "),
         .init(word: "approve", meaning: "承認する "),
         .init(word: "commit", meaning: "＜罪など＞犯す "),
         .init(word: "stretch", meaning: "広げる/伸ばす "),
         .init(word: "participate", meaning: "参加する "),
         .init(word: "impose", meaning: "課す/押しつける "),
         .init(word: "owe", meaning: "おかげ "),
         .init(word: "celebrate", meaning: "祝う "),
         .init(word: "emerge", meaning: "現れる "),
         .init(word: "urge", meaning: "強く迫る "),
         .init(word: "seat", meaning: "座っている/収容する "),
         .init(word: "injure", meaning: "傷つける/怪我をさせる "),
         .init(word: "imply", meaning: "ほのめかす "),
         .init(word: "pursue", meaning: "追う/追及する "),
         .init(word: "demonstrate", meaning: "証明する/明らかに示す "),
         .init(word: "amuse", meaning: "楽しませる "),
         .init(word: "ruin", meaning: "台無しにする "),
         .init(word: "regret", meaning: "後悔する "),
         .init(word: "attach", meaning: "くっつける "),
         .init(word: "reverse", meaning: "反対にする/逆転する "),
         .init(word: "restrict", meaning: "制限する "),
         .init(word: "compose", meaning: "組み立てる "),
         .init(word: "capture", meaning: "捕らえる "),
         .init(word: "substitute", meaning: "代わりに用いる "),
         .init(word: "trace", meaning: "跡をたどる "),
         .init(word: "interrupt", meaning: "妨げる/中断する "),
         .init(word: "confront", meaning: "立ち向かう "),
         .init(word: "illustrate", meaning: "示す/説明する "),
         .init(word: "arrest", meaning: "逮捕する "),
         .init(word: "stimulate", meaning: "刺激する "),
         .init(word: "assure", meaning: "保証する "),
         .init(word: "consult", meaning: "相談する "),
         .init(word: "depress", meaning: "憂鬱にさせる "),
         .init(word: "crash", meaning: "衝突する "),
         .init(word: "inspire", meaning: "やる気にさせる "),
         .init(word: "specialize", meaning: "専門にする/専攻する "),
         .init(word: "cultivate", meaning: "育む/耕作する "),
         .init(word: "fulfill", meaning: "果たす "),
         .init(word: "transmit", meaning: "送る/伝える "),
         .init(word: "found", meaning: "設立する "),
         .init(word: "cheer", meaning: "励ます "),
         .init(word: "burst", meaning: "破裂する "),
         .init(word: "bow", meaning: "おじぎする "),
         .init(word: "dismiss", meaning: "無視する/退ける "),
         .init(word: "breed", meaning: "繁殖する "),
         .init(word: "prohibit", meaning: "禁じる "),
         .init(word: "oblige", meaning: "強いる "),
         .init(word: "qualify", meaning: "適任である "),
         .init(word: "invest", meaning: "投資する "),
         .init(word: "grasp", meaning: "理解する "),
         .init(word: "collapse", meaning: "崩壊する "),
         .init(word: "overlook", meaning: "見落とす "),
         .init(word: "accuse", meaning: "非難する "),
         .init(word: "frustrate", meaning: "欲求不満にさせる/いらだたせる "),
         .init(word: "deprive", meaning: "奪う "),
         .init(word: "astonish", meaning: "驚嘆させる "),
         .init(word: "register", meaning: "登録する "),
         .init(word: "correspond", meaning: "一致する "),
         .init(word: "cast", meaning: "投げる/＜目を＞向ける "),
         .init(word: "attribute", meaning: "〜のせいにする "),
         .init(word: "freeze", meaning: "凍りつく "),
         .init(word: "starve", meaning: "飢える "),
         .init(word: "resolve", meaning: "解決する "),
         .init(word: "embrace", meaning: "＜思想など＞受け入れる/含む "),
         .init(word: "exhibit", meaning: "展示する "),
         .init(word: "convert", meaning: "転換する "),
         .init(word: "scare", meaning: "怯えさせる "),
         .init(word: "constitute", meaning: "構成する "),
         .init(word: "appoint", meaning: "任命する "),
         .init(word: "sew", meaning: "縫う "),
         .init(word: "assign", meaning: "割り当てる/任命につかせる "),
         .init(word: "nod", meaning: "うなずく "),
         .init(word: "elect", meaning: "選挙で選ぶ "),
         .init(word: "ackowledge", meaning: "認める "),
         .init(word: "rob", meaning: "奪う "),
         .init(word: "lean", meaning: "寄りかかる "),
         .init(word: "undertake", meaning: "引き受ける "),
         .init(word: "drown", meaning: "溺れ死ぬ "),
         .init(word: "split", meaning: "分裂する "),
         .init(word: "resort", meaning: "＜手段に＞訴える "),
         .init(word: "descend", meaning: "降りる/＜先祖から＞伝わる "),
         .init(word: "irritate", meaning: "苛立たせる "),
         .init(word: "pronounce", meaning: "発音する "),
         .init(word: "equip", meaning: "装備させる/準備させる "),
         .init(word: "cheat", meaning: "だます "),
         .init(word: "decorate", meaning: "装飾する "),
         .init(word: "pardon", meaning: "許す "),
         .init(word: "heal", meaning: "治す "),
         .init(word: "forgive", meaning: "＜人を＞許す "),
         .init(word: "envy", meaning: "うらやむ "),
         .init(word: "chase", meaning: "追いかける "),
         .init(word: "prompt", meaning: "促す "),
         .init(word: "withdraw", meaning: "引っ込める/引き出す "),
         .init(word: "detect", meaning: "探知する/発見する "),
         .init(word: "interfere", meaning: "邪魔をする "),
         .init(word: "launch", meaning: "始める "),
         .init(word: "endanger", meaning: "危険にさらす "),
         .init(word: "foster", meaning: "促進する/育成する "),
         .init(word: "diminish", meaning: "減少する/衰える "),
         .init(word: "spill", meaning: "こぼす "),
         .init(word: "infect", meaning: "感染する "),
         .init(word: "stem", meaning: "生じる/由来する "),
         .init(word: "tap", meaning: "軽く叩く "),
         .init(word: "bet", meaning: "きっと〜だと思う "),
         .init(word: "submit", meaning: "服従する/提出する "),
         .init(word: "tempt", meaning: "誘惑する "),
         .init(word: "resign", meaning: "辞職する/やめる "),
         .init(word: "conform", meaning: "従う "),
         .init(word: "confine", meaning: "限定する/閉じ込める "),
         .init(word: "assemble", meaning: "組み立てる "),
         .init(word: "dedicate", meaning: "ささげる "),
         .init(word: "advocate", meaning: "主張する "),
         .init(word: "thrive", meaning: "繁栄する "),
         .init(word: "provoke", meaning: "引き起こす "),
         .init(word: "dictate", meaning: "命じる/要求する/決定する "),
         .init(word: "exploit", meaning: "利用する/開発する "),
         .init(word: "surrender", meaning: "降伏する "),
         .init(word: "reproduce", meaning: "再生する/複製する "),
         .init(word: "transfer", meaning: "移す/転勤する "),
         .init(word: "swell", meaning: "ふくらむ "),
         .init(word: "shed", meaning: "＜葉など＞落とす "),
         .init(word: "wind", meaning: "曲がる "),
         .init(word: "cite", meaning: "引き合いに出す "),
         .init(word: "digest", meaning: "消化する "),
         .init(word: "skip", meaning: "とばす "),
         .init(word: "bind", meaning: "束縛する "),
         .init(word: "dissolve", meaning: "溶解する/解放する "),
         .init(word: "implement", meaning: "実行する "),
         .init(word: "steer", meaning: "操縦する "),
         .init(word: "congratulate", meaning: "おめでとうと言う "),
         .init(word: "designate", meaning: "指定する "),
         .init(word: "violate", meaning: "破る/違反する "),
         .init(word: "presume", meaning: "推定する "),
         .init(word: "recruit", meaning: "＜新人など＞入れる "),
         .init(word: "coincide", meaning: "同時に起きる/重なる "),
         .init(word: "enforce", meaning: "施行する "),
         .init(word: "displace", meaning: "故郷から追い出す "),
         .init(word: "shrink", meaning: "縮む "),
         .init(word: "betray", meaning: "裏切る "),
         .init(word: "comprise", meaning: "構成させる "),
         .init(word: "indulge", meaning: "＜快楽など＞ふける "),
         .init(word: "penetrate", meaning: "入り込む/貫通する "),
         .init(word: "devastate", meaning: "壊滅させる "),
         .init(word: "plunge", meaning: "突っ込む "),
         .init(word: "thrust", meaning: "強く押す "),
         .init(word: "contradict", meaning: "矛盾する "),
         .init(word: "prescribe", meaning: "処方する "),
         .init(word: "oppress", meaning: "しいたげる "),
         .init(word: "cherish", meaning: "胸に抱く "),
         .init(word: "illuminate", meaning: "照らす/解明する "),
         .init(word: "trigger", meaning: "きっかけになる/誘発する "),
         .init(word: "commute", meaning: "通勤する "),
         .init(word: "induce", meaning: "誘う/引き起こす "),
         .init(word: "utilize", meaning: "利用する "),
         .init(word: "snap", meaning: "ポキンと折れる "),
         .init(word: "donate", meaning: "提供する "),
         .init(word: "hatch", meaning: "＜卵など＞かえす "),
         .init(word: "enclose", meaning: "囲む "),
         .init(word: "prevail", meaning: "普及している/広まる "),
         .init(word: "sigh", meaning: "ため息をつく "),
         .init(word: "leak", meaning: "漏らす "),
         .init(word: "compel", meaning: "強制する "),
         .init(word: "crush", meaning: "押しつぶす "),
         .init(word: "comprehend", meaning: "理解する "),
         .init(word: "negotiate", meaning: "交渉する "),
         .init(word: "persist", meaning: "維持する "),
         .init(word: "multiply", meaning: "増やす/増える "),
         .init(word: "conceive", meaning: "想像する/思いつく/考える "),
         .init(word: "compensate", meaning: "埋め合わせる "),
         .init(word: "suspend", meaning: "中止する "),
         .init(word: "stir", meaning: "＜感情など＞かきたてる "),
         .init(word: "soak", meaning: "浸す/ずぶ濡れにする "),
         .init(word: "refine", meaning: "洗練する "),
         .init(word: "arouse", meaning: "刺激する "),
         .init(word: "precede", meaning: "先行する/先立つ "),
         .init(word: "render", meaning: "〜にする/変える "),
         .init(word: "mount", meaning: "すえつける/乗る "),
         .init(word: "retreat", meaning: "退く "),
         .init(word: "startle", meaning: "驚かせる "),
         .init(word: "dare", meaning: "〜する勇気がある ")],
        
        [.init(word: "result", meaning: "結果"),
         .init(word: "result", meaning: "結果"),
         .init(word: "result", meaning: "結果"),
         .init(word: "result", meaning: "結果"),
         .init(word: "result", meaning: "結果"),
         .init(word: "result", meaning: "結果"),
         .init(word: "result", meaning: "結果"),
         .init(word: "result", meaning: "結果"),
         .init(word: "result", meaning: "結果"),
         .init(word: "result", meaning: "結果"),
         .init(word: "result", meaning: "結果") ],
        
        [.init(word: "common",meaning: "共通の/普通の"),
         .init(word: "public",meaning: "公の"),
         .init(word: "lilely",meaning: "ありそうな/可能性がある"),
         .init(word: "serious",meaning: "深刻な"),
         .init(word: "particular",meaning: "ある特定の/特有の"),
         .init(word: "available",meaning: "利用可能な"),
         .init(word: "local",meaning: "その土地の"),
         .init(word: "ready",meaning: "用意ができた"),
         .init(word: "correct",meaning: "正しい"),
         .init(word: "familiar",meaning: "よく知られた")],
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        baseTableView.delegate = self
        baseTableView.dataSource = self
        
        
    }
    
    // データの数（＝セルの数）を返すメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //ここでしっかりと多次元配列の中身を表示できるようにする。
        return wordmeaning[section].count
    }
    
    // 各セルの内容を返すメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 再利用可能な cell を得る
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        
       
        
        //cellのlableにタグをつけて表示する
        //wordLableは英単語のこと
        //meaningは英単語の意味
        //arrayの中から単語と意味が一緒に出てくるようになっている
        let base1 = cell.viewWithTag(1) as! UILabel
        base1.text = wordmeaning[indexPath.section][indexPath.row].word
        
        
        let base2 = cell.viewWithTag(2) as! UILabel
        base2.text = wordmeaning[indexPath.section][indexPath.row].meaning
        
        
        
        
        return cell
    }
    
    // Cell の高さを１２０にする
      func tableView(_ table: UITableView,
                     heightForRowAt indexPath: IndexPath) -> CGFloat {
          return 120.0
      }
    //section設定
    func numberOfSections(in tableView: UITableView) -> Int {
        return wordmeaning.count
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
            label.text = "level1"
        case 1:
            label.text = "level2"
        case 2:
            label.text = "level3"
        default:
            break
        }
        
        return label
    }
    //sectionの高さの設定
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    
}
