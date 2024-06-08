//
//  DetailTamagotchiViewController.swift
//  YegrTamagotchiApp
//
//  Created by YJ on 6/8/24.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    let popUpView = UIView()
    
    let tamagotchiImageView = UIImageView()
    let tamagotchiNameView = UIView()
    let tamagotchiNameLabel = UILabel()
    
    let dividerView = UIView()
    
    let introductionLabel = UILabel()
    
    let buttonStackView = UIStackView()
    let cancelButton = UIButton(type: .system)
    let startButton = UIButton(type: .system)
    
    var detailData: RaisingTamagotchi?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .clear
        configureHierarchy()
        configureLayout()
        configureUI()
        configureAction()
    }
    
    func configureHierarchy() {
        view.addSubview(popUpView)
        popUpView.addSubview(tamagotchiImageView)
        popUpView.addSubview(tamagotchiNameView)
        tamagotchiNameView.addSubview(tamagotchiNameLabel)
        
        popUpView.addSubview(dividerView)
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
        
        dividerView.snp.makeConstraints {
            $0.top.equalTo(tamagotchiNameView.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(popUpView).inset(40)
            $0.height.equalTo(1)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.bottom.equalTo(popUpView)
            $0.horizontalEdges.equalTo(popUpView)
            $0.height.equalTo(50)
        }
        
        introductionLabel.snp.makeConstraints {
            $0.top.equalTo(dividerView.snp.bottom).offset(10)
            $0.horizontalEdges.equalTo(popUpView)
            $0.bottom.equalTo(buttonStackView.snp.top).offset(-10)
        }
        
        cancelButton.snp.makeConstraints {
            $0.top.equalTo(buttonStackView).offset(1)
            $0.width.equalTo(buttonStackView.frame.width / 2)
        }
        
        startButton.snp.makeConstraints {
            $0.top.equalTo(buttonStackView).offset(1)
            $0.width.equalTo(buttonStackView.frame.width / 2)
        }
    }
    
    func configureUI() {
        popUpView.backgroundColor = .primaryBackgroundColor
        popUpView.layer.cornerRadius = 10
        
        guard let image = detailData?.info.image else { return }
        tamagotchiImageView.layer.cornerRadius = 60
        tamagotchiImageView.image = UIImage(named: image.rawValue)
        
        tamagotchiNameView.layer.borderWidth = 1
        tamagotchiNameView.layer.borderColor = UIColor.fontBorderColor.cgColor
        
        tamagotchiNameLabel.text = detailData?.info.name.rawValue
        tamagotchiNameLabel.font = .systemFont(ofSize: 14)
        
        dividerView.backgroundColor = .lightGray
        
        introductionLabel.text = detailData?.info.introduction.rawValue
        introductionLabel.textAlignment = .center
        introductionLabel.numberOfLines = 0
        introductionLabel.font = .systemFont(ofSize: 14)
        
        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 1
        buttonStackView.alignment = .fill
        buttonStackView.distribution = .fillEqually
        buttonStackView.backgroundColor = .systemGray4
        
        cancelButton.setDetailUI(detailBackgroundColor: .primaryBackgroundColor, buttonTitle: "취소", buttonTitleColor: .black)
        startButton.setDetailUI(detailBackgroundColor: .primaryBackgroundColor, buttonTitle: "시작하기", buttonTitleColor: .black)
    }
    
    func configureAction() {
        cancelButton.addTarget(self, action: #selector(cancelButtonClicked), for: .touchUpInside)
        startButton.addTarget(self, action: #selector(startButtonClicked), for: .touchUpInside)
    }
    
    @objc func cancelButtonClicked() {
        dismiss(animated: true)
    }
    
    @objc func startButtonClicked() {
        let mainVC = MainViewController()
        mainVC.mainData = detailData
        let mainNav = UINavigationController(rootViewController: mainVC)
        mainNav.modalPresentationStyle = .fullScreen
        present(mainNav, animated: true)
    }
}