//
//  MainView.swift
//  StoreApp
//
//  Created by Leonid Nifantyev on 02.10.2020.
//

import UIKit

class MainView: UIView {
    
    init() {
        super.init(frame: .zero)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setup() {
        backgroundColor = .red
    }
}

