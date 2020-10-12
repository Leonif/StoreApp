//
//  ViewController.swift
//  StoreApp
//
//  Created by Leonid Nifantyev on 02.10.2020.
//

import UIKit
import RealmSwift

struct HumanEntity {
    let name: String
    let age: Int
}

//protocol SaveServiceInterface {
//    func saveHuman(name: String, age: Int)
//    func readHumabList() -> [HumanEntity]
//    func saveAnimal(name: String, id: Int)
//    func update(name: String, for id: Int)
//}

class MainViewController: UIViewController {
    
    let rootView = MainView()
    let service = RealmsaveService()
    
    var humanList: [HumanEntity] = []
    
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
        service.delegate = self
        rootView.tableView.dataSource = self
        rootView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "humanCell")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rootView.button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        humanList = service.readHumabList()
    }
    
    @objc
    private func handleTap() {
        let name = rootView.recordField.text ?? "no name"
        service.saveHuman(name: name, age: 15)
    }
}


extension MainViewController: RealmOutput {
    func update(_ changes: RealmCollectionChange<Results<HumanObject>>) {
        switch changes {
        case .initial(let results):
            rootView.tableView.reloadData()
        case let .update(results, deletions, insertions, modifications):
//            print(results, deletions, insertions, modifications)
            humanList = results.map { HumanEntity(name: $0.name, age: $0.age) }
            rootView.tableView.reloadData()
        case let .error(error):
            debugPrint(error.localizedDescription)
        }
    }
}


extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        humanList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let human = humanList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "humanCell")!
        cell.textLabel?.text = human.name
        return cell
    }
}
