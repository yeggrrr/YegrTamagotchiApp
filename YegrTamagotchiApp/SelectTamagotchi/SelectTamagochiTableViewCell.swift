//
//  SelectTamagochiTableViewCell.swift
//  YegrTamagotchiApp
//
//  Created by YJ on 6/8/24.
//

import UIKit

class SelectTamagochiTableViewCell: UITableViewCell {
    let tamagotchiImageView = UIImageView()
    let tamagotchiNameLabelView = UIView()
    let tamagotchiNameLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configurHierarchy()
        configureLayout()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configurHierarchy() {
        contentView.addSubview(tamagotchiImageView)
        contentView.addSubview(tamagotchiNameLabelView)
        tamagotchiImageView.addSubview(tamagotchiNameLabel)
    }
    
    func configureLayout() {
        let safeArea = contentView.safeAreaLayoutGuide
        
        tamagotchiImageView.snp.makeConstraints {
            $0.top.equalTo(safeArea).offset(10)
            $0.centerX.equalTo(safeArea)
            $0.height.width.equalTo(120)
        }
        
        tamagotchiNameLabelView.snp.makeConstraints {
            $0.top.equalTo(tamagotchiImageView.snp.bottom).offset(5)
            $0.centerX.equalTo(tamagotchiImageView.snp.centerX)
            $0.height.equalTo(tamagotchiNameLabel).offset(10)
            $0.width.equalTo(tamagotchiNameLabel).offset(10)
            $0.bottom.greaterThanOrEqualTo(safeArea).offset(-10)
        }
        
        tamagotchiNameLabel.snp.makeConstraints {
            $0.center.equalTo(tamagotchiNameLabelView)
        }
    }
    
    func configureUI() {
        tamagotchiImageView.backgroundColor = .systemBrown
        tamagotchiImageView.layer.cornerRadius = 60
        
        tamagotchiNameLabelView.backgroundColor = .clear
        tamagotchiNameLabelView.layer.borderWidth = 1
        tamagotchiNameLabelView.layer.borderColor = UIColor.darkGray.cgColor
        
        tamagotchiNameLabel.text = "다마고치"
        tamagotchiNameLabel.textColor = .label
    }
}
