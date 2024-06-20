//
//  UserNameSettingViewController.swift
//  YegrTamagotchiApp
//
//  Created by YJ on 6/21/24.
//

import UIKit
import SnapKit

class UserNameSettingViewController: UIViewController {
    let textField = UITextField()
    let lineView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigation()
        configureHierarchy()
        configureLayout()
        configureUI()
    }
    
    func configureNavigation() {
        title = "대장님 이름 정하기"
        view.backgroundColor = UIColor.primaryBackgroundColor
        let right = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveButtonClicked))
        navigationItem.rightBarButtonItem = right
        navigationItem.rightBarButtonItem?.tintColor = .darkGray
    }
    
    func configureHierarchy() {
        view.addSubview(textField)
        view.addSubview(lineView)
    }
    
    func configureLayout() {
        let safeArea = view.safeAreaLayoutGuide
        textField.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(safeArea).inset(30)
            $0.height.equalTo(30)
        }
        
        lineView.snp.makeConstraints {
            $0.top.equalTo(textField.snp.bottom).offset(5)
            $0.horizontalEdges.equalTo(safeArea).inset(30)
            $0.height.equalTo(1)
        }
    }
    
    func configureUI() {
        textField.placeholder = "희망하는 이름을 입력해주세요"
        lineView.backgroundColor = .lightGray
    }
    
    @objc func saveButtonClicked() {
        print(#function)
    }
}
