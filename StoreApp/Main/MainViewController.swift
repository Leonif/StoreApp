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

protocol SaveServiceInterface {
    func saveHuman(name: String, age: Int)
    func readHumabList() -> [HumanEntity]
    func readHumabList(callback: @escaping ([HumanEntity]) -> Void)
}

class MainViewController: UIViewController {
    
    let rootView = MainView()
    let service: SaveServiceInterface = FirebaseService()
    
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
        rootView.tableView.dataSource = self
        rootView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "humanCell")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rootView.button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        service.readHumabList() { [unowned self] list in
            humanList = list
            rootView.tableView.reloadData()
        }
    }
    
    @objc
    private func handleTap() {
        let name = rootView.recordField.text ?? "no name"
        service.saveHuman(name: name, age: 15)
        service.readHumabList() { [unowned self] list in
            humanList = list
            rootView.tableView.reloadData()
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
