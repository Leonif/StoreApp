//
//  RealmObjects.swift
//  StoreApp
//
//  Created by Leonid Nifantyev on 12.10.2020.
//

import RealmSwift

class HumanObject: Object {
    @objc dynamic var name = ""
    @objc dynamic var age: Int = 0
}
