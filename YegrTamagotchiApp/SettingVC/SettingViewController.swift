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
    
    var mainData: RaisingTamagotchi?
    var index: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configurUI()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        settingTableView.reloadData()
    }
    
    func configurUI() {
        // view
        view.backgroundColor = UIColor.primaryBackgroundColor
        
        //navigaion
        navigationItem.title = "설정"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "설정", style: .plain, target: self, action: nil)
        navigationItem.backBarButtonItem?.tintColor = .black
        
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
        settingTableView.backgroundColor = UIColor.primaryBackgroundColor
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "데이터 초기화", message: "정말 다시 처음부터 시작하실 건가요?", preferredStyle: .alert)
        let yesButton = UIAlertAction(title: "웅", style: .default) { _ in
            UserDefaults.standard.setValue(false, forKey: UserDefaultsInfo.isExistUser.rawValue)
            for key in UserDefaults.standard.dictionaryRepresentation().keys {
                UserDefaults.standard.removeObject(forKey: key.description)
            }
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            let sceneDelegate = windowScene?.delegate as? SceneDelegate
            let vc = SelectCollectionViewController()
            let nav = UINavigationController(rootViewController: vc)
            sceneDelegate?.window?.rootViewController = nav
            sceneDelegate?.window?.makeKeyAndVisible()
        }
        
        let noButton = UIAlertAction(title: "아냐!", style: .cancel)
        alert.addAction(yesButton)
        alert.addAction(noButton)
        present(alert, animated: true)
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
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor.primaryBackgroundColor
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(systemName: Setting.allCases[indexPath.row].optionImage)
        cell.imageView?.tintColor = .darkGray
        cell.textLabel?.text = Setting.allCases[indexPath.row].option
        cell.textLabel?.font = .systemFont(ofSize: 13)
        if indexPath.row != 0 {
            cell.detailTextLabel?.isHidden = true
        }
        cell.detailTextLabel?.text = UserDefaultsData.nickname
        cell.detailTextLabel?.font = .systemFont(ofSize: 13)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        switch index {
        case 0:
            navigationController?.pushViewController(UserNameSettingViewController(), animated: true)
        case 1:
            navigationController?.pushViewController(ChangeCollecionViewController(), animated: true)
        case 2:
            showAlert()
        default:
            break
        }
    }
}
