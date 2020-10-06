//
//  SaveService.swift
//  StoreApp
//
//  Created by Leonid Nifantyev on 02.10.2020.
//

import UIKit
import SwiftKeychainWrapper

class SaveService {
    
    let storeStack = CoreDataStack(modelName: "StoreApp")
    
    
//    func save(value: String, for key: String) {
//        UserDefaults.standard.setValue(value, forKey: key)
//    }
//
//
//    func read(for key: String) -> String? {
//        return UserDefaults.standard.string(forKey: key)
//    }
    
    func saveHuman(name: String, age: Int) {
        let context = storeStack.context
        let human = Human(context: context)
        human.name = name
        human.age = Int16(age)
        storeStack.saveContext()
    }
    
    
    func readHumabList() -> [Human] {
        let context = storeStack.context
        return (try? context.fetch(Human.fetchRequest()) as? [Human]) ?? []
    }
    
    
    func save(value: String, for key: String) {
        KeychainWrapper.standard.set(value, forKey: key)
    }
    
    
    func read(for key: String) -> String? {
        return KeychainWrapper.standard.string(forKey: key)
    }
    
}
