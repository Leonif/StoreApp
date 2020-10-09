//
//  ViewController.swift
//  StoreApp
//
//  Created by Leonid Nifantyev on 02.10.2020.
//

import UIKit


struct HumanEntity {
    let name: String
    let age: Int
}

protocol SaveServiceInterface {
    func saveHuman(name: String, age: Int, petName: String, gender: Bool) -> Int
    func readHumabList() -> [HumanEntity]
    func saveAnimal(name: String, id: Int)
    func update(name: String, for id: Int)
}

class MainViewController: UIViewController {
    
    let rootView = MainView()
    let service: SaveServiceInterface = RealmsaveService()
    
    init() {
        super.init(nibName: .none, bundle: .none)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func loadView() {
        super.loadView()
        
        view = rootView
    }
    
    
    private func setup() {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let id = service.saveHuman(name: "Олена", age: 15, petName: "Bobik", gender: false)
//        service.saveAnimal(name: "Boboik", id: id)
//
//        let humanList = service.readHumabList()
//
//        for human in humanList {
//            debugPrint(human.name, human.age)
//        }
        
        
        service.update(name: "Alex", for: 1)
        
    }
}
