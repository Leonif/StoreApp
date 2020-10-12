//
//  RealmsaveService.swift
//  StoreApp
//
//  Created by Leonid Nifantyev on 09.10.2020.
//

import RealmSwift

class RealmsaveService: SaveServiceInterface {
    
    let realm: Realm
    
    var autoId = 1
    
    init() {
        let config = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
        realm = try! Realm(configuration: config)
        debugPrint(realm.configuration.fileURL)
        
        
         
        
    }
    
    func readHumabList() -> [HumanEntity] {
        let list = realm.objects(HumanObject.self)
        
        return list.map { HumanEntity(name: $0.name, age: $0.age) }
    }
    
    func saveHuman(name: String, age: Int, petName: String, gender: Bool) -> Int {
        let human = HumanObject()
        human.id = autoId
        human.name = name
        human.age = age
        
        try! realm.write {
            realm.add(human)
        }
        
        return human.id
        
        
    }
    
    func saveAnimal(name: String, id: Int) {
//        let owner = realm.objects(HumanObject.self).filter("id == %@", id).first!
//        let pet = Pet()
//        pet.name = name
//        pet.owner = owner
//
//        try! realm.write {
//            realm.add(pet)
//        }
        
    }
    
    func update(name: String, for id: Int) {
        let olena = realm.objects(HumanObject.self).filter("id == %@", id).first!
        
        try! realm.write {
            olena.name = name
        }
        
        
    }
}
