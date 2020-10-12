//
//  Human+CoreDataProperties.swift
//  StoreApp
//
//  Created by Leonid Nifantyev on 02.10.2020.
//
//

import Foundation
import CoreData


extension Human {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Human> {
        return NSFetchRequest<Human>(entityName: "Human")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: Int16

}

extension Human : Identifiable {

}
