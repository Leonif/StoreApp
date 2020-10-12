//
//  RealmsaveService.swift
//  StoreApp
//
//  Created by Leonid Nifantyev on 09.10.2020.
//

import RealmSwift


protocol RealmOutput: class {
    func update(_ changes: RealmCollectionChange<Results<HumanObject>>)
}

class RealmsaveService {
    
    let realm: Realm
    var token: NotificationToken?
    
    
    weak var delegate: RealmOutput?
    
    var autoId = 1
    
    init() {
        let config = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
        realm = try! Realm(configuration: config)
        debugPrint(realm.configuration.fileURL)
        
        
    }
    
    func readHumabList() -> [HumanEntity] {
        let list = realm.objects(HumanObject.self)
        
        
        self.token = list.observe({ [weak self] (changes) in
            guard let self = self else { return }
            self.delegate?.update(changes)
        })
        
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
