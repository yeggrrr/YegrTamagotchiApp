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
    let messageLabel = UILabel()
    var nickNameErrorMessage: NickNameErrorMessage = .empty
    
    enum NickNameErrorMessage: String {
        case empty = ""
        case wrongLength = "2글자 이상 6글자 미만으로 설정해주세요"
        case noError = "사용 가능한 닉네임이에요"
    }
    
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
        view.addSubview(messageLabel)
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
        
        messageLabel.snp.makeConstraints {
            $0.top.equalTo(lineView.snp.bottom).offset(5)
            $0.horizontalEdges.equalTo(safeArea).inset(30)
            $0.height.equalTo(20)
        }
    }
    
    func configureUI() {
        textField.delegate = self
        textField.placeholder = "희망하는 이름을 입력해주세요"
        lineView.backgroundColor = .lightGray
        messageLabel.textColor = .lightGray
        messageLabel.textAlignment = .left
        messageLabel.font = .systemFont(ofSize: 15)
    }
    
    func nicknameCondition() {
        guard let text = textField.text else { return }
        if text.isEmpty {
            nickNameErrorMessage = .empty
        } else if text.count < 2 || text.count > 6 {
            nickNameErrorMessage = .wrongLength
        } else {
            nickNameErrorMessage = .noError
        }
        
        messageLabel.text = nickNameErrorMessage.rawValue
    }
    
    @objc func saveButtonClicked() {
        guard nickNameErrorMessage == .noError else { return }
        guard let text = textField.text else { return }
        UserDefaults.standard.setValue(text, forKey: UserDefaultsInfo.nickname.rawValue)
        navigationController?.popViewController(animated: true)
    }
}

extension UserNameSettingViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        nicknameCondition()
    }
}
