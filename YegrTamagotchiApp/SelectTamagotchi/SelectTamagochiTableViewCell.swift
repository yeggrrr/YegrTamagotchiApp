//
//  SelectTamagochiTableViewCell.swift
//  YegrTamagotchiApp
//
//  Created by YJ on 6/8/24.
//

import UIKit

class SelectTamagochiTableViewCell: UITableViewCell {
    let cellBackgroundView = UIView()
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
        contentView.addSubview(cellBackgroundView)
        cellBackgroundView.addSubview(tamagotchiImageView)
        cellBackgroundView.addSubview(tamagotchiNameLabelView)
        tamagotchiNameLabelView.addSubview(tamagotchiNameLabel)
    }
    
    func configureLayout() {
        let safeArea = contentView.safeAreaLayoutGuide
        
        cellBackgroundView.snp.makeConstraints {
            $0.edges.equalTo(safeArea)
        }
        
        tamagotchiImageView.snp.makeConstraints {
            $0.top.equalTo(cellBackgroundView.snp.top).offset(10)
            $0.centerX.equalTo(cellBackgroundView.snp.centerX)
            $0.height.width.equalTo(100)
        }
        
        tamagotchiNameLabelView.snp.makeConstraints {
            $0.top.equalTo(tamagotchiImageView.snp.bottom).offset(5)
            $0.centerX.equalTo(tamagotchiImageView.snp.centerX)
            $0.height.equalTo(tamagotchiNameLabel).offset(10)
            $0.width.equalTo(tamagotchiNameLabel).offset(10)
            $0.bottom.greaterThanOrEqualTo(cellBackgroundView.snp.bottom).offset(-10)
        }
        
        tamagotchiNameLabel.snp.makeConstraints {
            $0.center.equalTo(tamagotchiNameLabelView)
        }
    }
    
    func configureUI() {
        cellBackgroundView.backgroundColor = UIColor.primaryBackgroundColor()
        
        tamagotchiImageView.layer.cornerRadius = 50
        
        tamagotchiNameLabelView.backgroundColor = .clear
        tamagotchiNameLabelView.layer.borderWidth = 1
        tamagotchiNameLabelView.layer.borderColor = UIColor.fontBorderColor().cgColor
        
        tamagotchiNameLabel.textColor = .label
        tamagotchiNameLabel.font = .systemFont(ofSize: 14)
    }
}
