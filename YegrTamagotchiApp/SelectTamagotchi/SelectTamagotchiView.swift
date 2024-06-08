//
//  SelectTamagotchiView.swift
//  YegrTamagotchiApp
//
//  Created by YJ on 6/8/24.
//

import UIKit

class SelectTamagotchiView: UIView {
    let selectTamagotchiTableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureHierarchy()
        configureLayout()
        configureUI()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configureHierarchy()
        configureLayout()
        configureUI()
    }
    
    func configureHierarchy() {
        addSubview(selectTamagotchiTableView)
    }
    
    func configureLayout() {
        let safeArea = safeAreaLayoutGuide
        
        selectTamagotchiTableView.snp.makeConstraints {
            $0.edges.equalTo(safeArea)
        }
    }
    
    func configureUI() {
        selectTamagotchiTableView.backgroundColor = .white
    }
}


