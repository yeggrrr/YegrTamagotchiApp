//
//  MainView.swift
//  YegrTamagotchiApp
//
//  Created by YJ on 6/8/24.
//

import UIKit

class MainView: UIView {
    
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
        
    }
    
    func configureLayout() {
        
    }
    
    func configureUI() {
        backgroundColor = UIColor.primaryBackgroundColor()
    }
}
