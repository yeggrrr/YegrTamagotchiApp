//
//  SettingViewController.swift
//  YegrTamagotchiApp
//
//  Created by YJ on 6/13/24.
//

import UIKit
import SnapKit

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
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: nil)
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(systemName: "star")
        cell.textLabel?.text = "ddd"
        cell.detailTextLabel?.text = "sss"
        cell.selectionStyle = .none
        return cell
    }
    
    
}
