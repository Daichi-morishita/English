//
//  List.swift
//  English
//
//  Created by 森下大地 on 2020/12/12.
//

import RealmSwift

class List: Object {
    // 管理用 ID。プライマリーキー
    @objc dynamic var id = 0
    
    // タイトル
    @objc dynamic var title = ""
    
    //単語
    @objc dynamic var word = ""
    
    // 意味
    @objc dynamic var contents = ""
    
    // 日時
    @objc dynamic var date = Date()
    
    //カテゴリ
    @objc dynamic var category = ""
    
    
    // id をプライマリーキーとして設定
    override static func primaryKey() -> String? {
        return "id"
    }
}
