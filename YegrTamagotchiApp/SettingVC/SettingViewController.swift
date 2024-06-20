//
//  SettingViewController.swift
//  YegrTamagotchiApp
//
//  Created by YJ on 6/13/24.
//

import UIKit
import SnapKit

enum Setting: Int, CaseIterable {
    case myName
    case changeTamagotchi
    case reset
    
    var optionImage: String {
        switch self {
        case .myName:
            return "pencil"
        case .changeTamagotchi:
            return "star.fill"
        case .reset:
            return "arrow.clockwise"
            
        }
    }
    
    var option: String {
        switch self {
        case .myName:
            return "내 이름 설정하기"
        case .changeTamagotchi:
            return "다마고치 변경하기"
        case .reset:
            return "데이터 초기화"
        }
    }
}

class SettingViewController: UIViewController {
    let settingTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configurUI()
        configureTableView()
    }
    
    func configurUI() {
        // view
        view.backgroundColor = .white
        
        //navigaion
        navigationItem.title = "설정"
        
        // tableView
        view.addSubview(settingTableView)
        
        settingTableView.snp.makeConstraints {
            $0.edges.equalTo(view)
        }
        
        settingTableView.backgroundColor = .white
        
    }
    
    func configureTableView() {
        settingTableView.delegate = self
        settingTableView.dataSource = self
    }
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Setting.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: nil)
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(systemName: Setting.allCases[indexPath.row].optionImage)
        cell.imageView?.tintColor = .darkGray
        cell.textLabel?.text = Setting.allCases[indexPath.row].option
        cell.textLabel?.font = .systemFont(ofSize: 13)
        if indexPath.row != 0 {
            cell.detailTextLabel?.isHidden = true
        }
        cell.detailTextLabel?.text = "푸바오" // 예시
        cell.detailTextLabel?.font = .systemFont(ofSize: 13)
        cell.selectionStyle = .none
        return cell
    }
    
    
}
