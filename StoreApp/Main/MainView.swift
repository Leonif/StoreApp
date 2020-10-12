//
//  MainView.swift
//  StoreApp
//
//  Created by Leonid Nifantyev on 02.10.2020.
//

import UIKit

class MainView: UIView {
    
    let recordField = UITextField()
    let tableView = UITableView()
    let button = UIButton()
    
    init() {
        super.init(frame: .zero)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func updateConstraints() {
        NSLayoutConstraint.activate([
            
            recordField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            recordField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            recordField.trailingAnchor.constraint(equalTo: button.leadingAnchor, constant: -16),
            recordField.heightAnchor.constraint(equalToConstant: 55),
            
            
            button.topAnchor.constraint(equalTo: recordField.topAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            button.heightAnchor.constraint(equalTo: recordField.heightAnchor),
            button.widthAnchor.constraint(equalToConstant: 50),
            
            
            tableView.topAnchor.constraint(equalTo: recordField.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
        
        super.updateConstraints()
    }
    
    
    private func setup() {
        backgroundColor = .white
        setupRecordField()
        setupButton()
        setupTableView()
        
        
        setNeedsUpdateConstraints()
    }
    
    private func setupRecordField() {
        recordField.layer.borderColor = UIColor.red.cgColor
        recordField.layer.borderWidth = 1.0
        recordField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(recordField)
    }
    
    private func setupButton() {
        button.setTitle("add", for: .normal)
        button.titleLabel?.textColor = .white
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        addSubview(button)
    }
    
    private func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(tableView)
    }
}

