//
//  DetailTamagotchiViewController.swift
//  YegrTamagotchiApp
//
//  Created by YJ on 6/8/24.
//

import UIKit
import SnapKit

class DetailTamagotchiViewController: UIViewController {
    let popUpView = UIView()
    
    let tamagotchiImageView = UIImageView()
    let tamagotchiNameView = UIView()
    let tamagotchiNameLabel = UILabel()
    
    let devideLineView = UIView()
    
    let introductionLabel = UILabel()
    
    let buttonStackView = UIStackView()
    let cancelButton = UIButton()
    let startButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .clear
        configureHierarchy()
        configureLayout()
        configureUI()
    }
    
    func configureHierarchy() {
        view.addSubview(popUpView)
        popUpView.addSubview(tamagotchiImageView)
        popUpView.addSubview(tamagotchiNameView)
        tamagotchiNameView.addSubview(tamagotchiNameLabel)
        popUpView.addSubview(devideLineView)
        
        popUpView.addSubview(introductionLabel)
        
        popUpView.addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(cancelButton)
        buttonStackView.addArrangedSubview(startButton)
    }
    
    func configureLayout() {
        let safeArea = view.safeAreaLayoutGuide
        
        popUpView.snp.makeConstraints {
            $0.leading.trailing.equalTo(safeArea).inset(40)
            $0.top.bottom.equalTo(safeArea).inset(160)
        }
        
        tamagotchiImageView.snp.makeConstraints {
            $0.top.equalTo(popUpView.snp.top).offset(30)
            $0.centerX.equalTo(popUpView.snp.centerX)
            $0.height.width.equalTo(120)
        }
        
        tamagotchiNameView.snp.makeConstraints {
            $0.top.equalTo(tamagotchiImageView.snp.bottom).offset(10)
            $0.centerX.equalTo(tamagotchiImageView.snp.centerX)
            $0.height.equalTo(tamagotchiNameLabel).offset(10)
            $0.width.equalTo(tamagotchiNameLabel).offset(10)
        }
        
        tamagotchiNameLabel.snp.makeConstraints {
            $0.center.equalTo(tamagotchiNameView)
            $0.height.equalTo(20)
        }
        
        devideLineView.snp.makeConstraints {
            $0.top.equalTo(tamagotchiNameView.snp.bottom).offset(30)
            $0.leading.trailing.equalTo(popUpView).inset(40)
            $0.height.equalTo(1)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.bottom.equalTo(popUpView)
            $0.horizontalEdges.equalTo(popUpView)
            $0.height.equalTo(50)
        }
        
        introductionLabel.snp.makeConstraints {
            $0.top.equalTo(devideLineView.snp.bottom).offset(10)
            $0.horizontalEdges.equalTo(popUpView)
            $0.bottom.equalTo(buttonStackView.snp.top).offset(-10)
        }
        
        cancelButton.snp.makeConstraints {
            $0.height.equalTo(buttonStackView)
            $0.width.equalTo(buttonStackView.frame.width / 2)
        }
        
        startButton.snp.makeConstraints {
            $0.height.equalTo(buttonStackView)
            $0.width.equalTo(buttonStackView.frame.width / 2)
        }
    }
    
    func configureUI() {
        popUpView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        popUpView.layer.cornerRadius = 10
        
        tamagotchiImageView.layer.cornerRadius = 60
        tamagotchiImageView.backgroundColor = .systemGray6
        
        tamagotchiNameView.backgroundColor = .systemGray5
        tamagotchiNameView.layer.borderWidth = 1
        tamagotchiNameView.layer.borderColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
        
        tamagotchiNameLabel.text = "다마고치"
        tamagotchiNameLabel.font = .systemFont(ofSize: 14)
        
        devideLineView.backgroundColor = .lightGray
        
        introductionLabel.text = "저는 방실장실 다마고치입니당 \n키는 100km 몸무게는 150톤이에용 \n성격은 화끈하고 날라다닙니당~! \n열심히 잘 먹고 잘 클 자신은 있답니당 \n방실방실!"
        introductionLabel.textAlignment = .center
        introductionLabel.numberOfLines = 0
        introductionLabel.font = .systemFont(ofSize: 14)
        
        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 1
        buttonStackView.alignment = .fill
        buttonStackView.distribution = .fillEqually
        buttonStackView.backgroundColor = .systemGray4
        
        cancelButton.backgroundColor = .systemGray6
        startButton.backgroundColor = .systemGray6
    }
}
