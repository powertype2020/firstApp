//
//  ChildProfile.swift
//  mamakarute
//
//  Created by 武久　直幹 on 2022/07/15.
//

import Foundation
import RealmSwift

class ChildProfile: Object {
    override static func primaryKey() -> String? {
        return "id"
    }
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var name = ""
    @objc dynamic var icon: Data?
}
