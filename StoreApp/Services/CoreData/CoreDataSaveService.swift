//
//  SaveService.swift
//  StoreApp
//
//  Created by Leonid Nifantyev on 02.10.2020.
//

import UIKit
import CoreData

class CoreDataSaveService: SaveServiceInterface {
    func readHumanList(callback: @escaping ([HumanEntity]) -> Void) {
        
    }
    

    func readHumanList() -> [HumanEntity] {
        let context = storeStack.context
        
        let list = (try? context.fetch(Human.fetchRequest()) as? [Human]) ?? []
        
        return list.map { HumanEntity(name: $0.name ?? "", age: Int($0.age)) }
    }
    
    let storeStack = CoreDataStack(modelName: "StoreApp")
    
    func saveHuman(name: String, age: Int) {
        let context = storeStack.context
        let human = Human(context: context)
        human.name = name
        human.age = Int16(age)
        storeStack.saveContext()
    }
}
