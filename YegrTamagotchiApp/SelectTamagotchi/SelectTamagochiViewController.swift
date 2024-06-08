//
//  SelectTamagochiViewController.swift
//  YegrTamagotchiApp
//
//  Created by YJ on 6/7/24.
//

import UIKit
import SnapKit

class SelectTamagochiViewController: UIViewController {
    let selectTamagotchiView = SelectTamagotchiView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigation()
        selectTamagotchiViewUI()
        configureTableView()
    }
    
    func configureNavigation() {
        navigationItem.title = "다마고치 선택하기"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Copperplate", size: 20) ?? UIFont()]
    }
    
    func selectTamagotchiViewUI() {
        view.backgroundColor = .white
        view.addSubview(selectTamagotchiView)
        selectTamagotchiView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func configureTableView() {
        selectTamagotchiView.selectTamagotchiTableView.dataSource = self
        selectTamagotchiView.selectTamagotchiTableView.delegate = self
        selectTamagotchiView.selectTamagotchiTableView.register(SelectTamagochiTableViewCell.self, forCellReuseIdentifier: SelectTamagochiTableViewCell.id)
    }
}

extension SelectTamagochiViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        180
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TamagotchiData.selecttamagotchi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SelectTamagochiTableViewCell.id, for: indexPath) as?
                SelectTamagochiTableViewCell else { return UITableViewCell() }
        cell.tamagotchiImageView.image = UIImage(named: TamagotchiData.selecttamagotchi[indexPath.row].image)
        
        return cell
    }
}
