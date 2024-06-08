//
//  MainView.swift
//  YegrTamagotchiApp
//
//  Created by YJ on 6/8/24.
//

import UIKit
import SnapKit

class MainView: UIView {
    let storyImageView = UIImageView()
    let storyLabel = UILabel()
    
    let tamagotchiImageView = UIImageView()
    let tamagotchiNameView = UIView()
    let tamagotchiNameLabel = UILabel()
    
    let currentStatusLabel = UILabel()
    
    let giveRiceStackView = UIStackView()
    let giveRiceTextField = UITextField()
    let giveRiceButton = UIButton()
    let giveRiceTFUnderLineView = UIView()
    
    let giveWaterStackView = UIStackView()
    let giveWaterTextField = UITextField()
    let giveWaterButton = UIButton()
    let giveWaterTFUnderLineView = UIView()
    
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
        addSubview(storyImageView)
        storyImageView.addSubview(storyLabel)
        
        addSubview(tamagotchiImageView)
        addSubview(tamagotchiNameView)
        tamagotchiNameView.addSubview(tamagotchiNameLabel)
        addSubview(currentStatusLabel)
        
        addSubview(giveRiceStackView)
        giveRiceStackView.addArrangedSubview(giveRiceTextField)
        giveRiceStackView.addArrangedSubview(giveRiceButton)
        addSubview(giveRiceTFUnderLineView)
        
        addSubview(giveWaterStackView)
        giveWaterStackView.addArrangedSubview(giveWaterTextField)
        giveWaterStackView.addArrangedSubview(giveWaterButton)
        addSubview(giveWaterTFUnderLineView)
    }
    
    func configureLayout() {
        let safeArea = safeAreaLayoutGuide
        storyImageView.snp.makeConstraints {
            $0.top.equalTo(safeArea).offset(40)
            $0.horizontalEdges.equalTo(safeArea).inset(80)
            $0.height.equalTo(150)
        }
        
        storyLabel.snp.makeConstraints {
            $0.centerX.equalTo(storyImageView.snp.centerX)
            $0.centerY.equalTo(storyImageView.snp.top).offset(70)
        }
        
        tamagotchiImageView.snp.makeConstraints {
            $0.top.equalTo(storyImageView.snp.bottom).offset(10)
            $0.centerX.equalTo(safeArea)
            $0.height.width.equalTo(220)
        }
        
        tamagotchiNameView.snp.makeConstraints {
            $0.top.equalTo(tamagotchiImageView.snp.bottom).offset(10)
            $0.centerX.equalTo(tamagotchiImageView.snp.centerX)
            $0.height.equalTo(tamagotchiNameLabel).offset(10)
            $0.width.equalTo(tamagotchiNameLabel).offset(10)
        }
        
        tamagotchiNameLabel.snp.makeConstraints {
            $0.center.equalTo(tamagotchiNameView)
        }
        
        currentStatusLabel.snp.makeConstraints {
            $0.top.equalTo(tamagotchiNameLabel.snp.bottom).offset(20)
            $0.centerX.equalTo(safeArea)
        }
        
        giveRiceStackView.snp.makeConstraints {
            $0.top.equalTo(currentStatusLabel.snp.bottom).offset(30)
            $0.centerX.equalTo(safeArea)
        }
        
        giveRiceTextField.snp.makeConstraints {
            $0.width.equalTo(180)
            $0.height.equalTo(40)
        }
        
        giveRiceButton.snp.makeConstraints {
            $0.width.equalTo(80)
            $0.height.equalTo(40)
        }
        
        giveRiceTFUnderLineView.snp.makeConstraints {
            $0.top.equalTo(giveRiceStackView.snp.bottom).inset(2)
            $0.leading.equalTo(giveRiceStackView.snp.leading)
            $0.width.equalTo(giveRiceTextField)
            $0.height.equalTo(1)
        }
        
        giveWaterStackView.snp.makeConstraints {
            $0.top.equalTo(giveRiceStackView.snp.bottom).offset(20)
            $0.centerX.equalTo(safeArea)
        }
        
        giveWaterTextField.snp.makeConstraints {
            $0.width.equalTo(180)
            $0.height.equalTo(40)
        }
        
        giveWaterButton.snp.makeConstraints {
            $0.width.equalTo(80)
            $0.height.equalTo(40)
        }
        
        giveWaterTFUnderLineView.snp.makeConstraints {
            $0.top.equalTo(giveWaterStackView.snp.bottom).inset(2)
            $0.leading.equalTo(giveWaterStackView.snp.leading)
            $0.width.equalTo(giveWaterTextField)
            $0.height.equalTo(1)
        }
    }
    
    func configureUI() {
        backgroundColor = UIColor.primaryBackgroundColor()
        storyImageView.image = UIImage(named: "bubble")
        
        storyLabel.setMainLabel(textContents: "복습 아직 안하셧다구요? \n지금 잠이 오세요? YEGR님??", fontSizeStyle: .systemFont(ofSize: 15))
        storyLabel.numberOfLines = 0
        storyLabel.textAlignment = .center
        
        tamagotchiImageView.backgroundColor = .systemGray6
        tamagotchiImageView.layer.cornerRadius = 110
        
        tamagotchiNameView.layer.borderWidth = 1
        tamagotchiNameView.layer.borderColor = UIColor.fontBorderColor().cgColor
        
        tamagotchiNameLabel.setMainLabel(textContents: "방실방실 다마고치", fontSizeStyle: .systemFont(ofSize: 16))
        
        currentStatusLabel.setMainLabel(textContents: "LV1 ∙ 밥알 0개 ∙ 물방울 0개", fontSizeStyle: .boldSystemFont(ofSize: 14))
        
        giveRiceStackView.setMainStackView()
        giveWaterStackView.setMainStackView()
        
        giveRiceTextField.setMainTextField(placeholderText: "밥주세용")
        giveWaterTextField.setMainTextField(placeholderText: "물주세용")
        
        giveRiceButton.setMainUI(imageSystemName: "drop.circle", buttonTitle: " 밥먹기")
        giveRiceTFUnderLineView.backgroundColor = UIColor.fontBorderColor()
        
        giveWaterButton.setMainUI(imageSystemName: "leaf.circle", buttonTitle: " 물먹기")
        giveWaterTFUnderLineView.backgroundColor = UIColor.fontBorderColor()
    }
}
