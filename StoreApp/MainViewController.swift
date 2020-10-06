//
//  ViewController.swift
//  StoreApp
//
//  Created by Leonid Nifantyev on 02.10.2020.
//

import UIKit

class MainViewController: UIViewController {
    
    let rootView = MainView()
    let service = SaveService()
    
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
        
        service.saveHuman(name: "Александр", age: 20)
        
        let humanList = service.readHumabList()
        
        for human in humanList {
            debugPrint(human.name, human.age)
        }
        
    }
}
