//
//  ChangeCollectionViewCell.swift
//  YegrTamagotchiApp
//
//  Created by YJ on 6/22/24.
//


import UIKit

class ChangeCollectionViewCell: UICollectionViewCell {
    let cellBackgroundView = UIView()
    let tamagotchiImageView = UIImageView()
    let tamagotchiNameLabelView = UIView()
    let tamagotchiNameLabel = UILabel()
    
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
            $0.top.equalTo(cellBackgroundView.snp.top).offset(5)
            $0.centerX.equalTo(cellBackgroundView.snp.centerX)
            $0.height.width.equalTo(80)
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
        cellBackgroundView.backgroundColor = .primaryBackgroundColor
        
        tamagotchiImageView.layer.cornerRadius = 50
        
        tamagotchiNameLabelView.backgroundColor = .clear
        tamagotchiNameLabelView.layer.borderWidth = 1
        tamagotchiNameLabelView.layer.borderColor = UIColor.fontBorderColor.cgColor
        
        tamagotchiNameLabel.textColor = .label
        tamagotchiNameLabel.font = .systemFont(ofSize: 14)
    }
}
