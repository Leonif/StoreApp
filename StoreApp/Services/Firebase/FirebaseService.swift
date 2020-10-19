//
//  FirebaseService.swift
//  StoreApp
//
//  Created by Leonid Nifantyev on 16.10.2020.
//

import FirebaseDatabase

class FirebaseService: SaveServiceInterface {
    func readHumanList() -> [HumanEntity] {
        fatalError("use async method")
    }
    
    let humanListRef = Database.database().reference().child("human-list")
    
    func saveHuman(name: String, age: Int) {
        let value: [String : Any] = [
            "name": name,
            "age": age
        ]
        
        humanListRef.childByAutoId().setValue(value)
        
    }
    
    func readHumanList(callback: @escaping ([HumanEntity]) -> Void) {
        
        humanListRef.observeSingleEvent(of: .value) { (snapshot) in
            
            var output: [HumanEntity] = []
            
            let children = snapshot.children
            
            for child in children {
                let snap = child as! DataSnapshot
                let dict = snap.value as! [String: Any]
                
                let name = dict["name"] as! String
                let age = dict["age"] as! Int
                
                output.append(HumanEntity(name: name, age: age))
            }
            
            callback(output)
            
        }
    }
}
