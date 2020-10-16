//
//  RealmsaveService.swift
//  StoreApp
//
//  Created by Leonid Nifantyev on 09.10.2020.
//

import RealmSwift


class RealmsaveService: SaveServiceInterface {
    func readHumabList(callback: @escaping ([HumanEntity]) -> Void) {
        
    }
    
    
    let realm: Realm
    
    init() {
        let config = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
        realm = try! Realm(configuration: config)
        debugPrint(realm.configuration.fileURL)
    }
    
    func readHumabList() -> [HumanEntity] {
        let list = realm.objects(HumanObject.self)
        return list.map { HumanEntity(name: $0.name, age: $0.age) }
    }
    
    func saveHuman(name: String, age: Int) {
        let human = HumanObject()
        human.name = name
        human.age = age
        
        try! realm.write {
            realm.add(human)
        }
    }
}
