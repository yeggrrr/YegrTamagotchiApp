//
//  SelectTamagotchiView.swift
//  YegrTamagotchiApp
//
//  Created by YJ on 6/8/24.
//

import UIKit
import SnapKit

class SelectView: UIView {
    let selectTableView = UITableView()
    
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
        addSubview(selectTableView)
    }
    
    func configureLayout() {
        let safeArea = safeAreaLayoutGuide
        
        selectTableView.snp.makeConstraints {
            $0.edges.equalTo(safeArea)
        }
    }
    
    func configureUI() {
        selectTableView.backgroundColor = .primaryBackgroundColor
        selectTableView.separatorStyle = .none
        
    }
}
