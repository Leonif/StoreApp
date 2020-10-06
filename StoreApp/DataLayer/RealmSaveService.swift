//
//  RealmSaveService.swift
//  StoreApp
//
//  Created by Leonid Nifantyev on 07.10.2020.
//

import RealmSwift

class HumanRealm: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var age: Int = 0
}

class RealmSaveService: SaveServiceInterface {
    
    let realm = try! Realm()
    
    init() {
        debugPrint(realm.configuration.fileURL)
    }
    
    func saveHuman(name: String, age: Int) {
        let human = HumanRealm()
        human.name = name
        human.age = age
        
        realm.beginWrite()
            realm.add(human)
            try? realm.commitWrite()
        
//        try? realm.write {
//            realm.add(human)
//        }
    }
    
    func readHumabList() -> [HumanEntity] {
        let list = realm.objects(HumanRealm.self)
        
        return list.map { HumanEntity(name: $0.name ?? "пусто", age: $0.age ?? 0) }
    }
    
    
}
