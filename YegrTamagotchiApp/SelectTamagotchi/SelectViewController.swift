//
//  SelectTamagochiViewController.swift
//  YegrTamagotchiApp
//
//  Created by YJ on 6/7/24.
//

import UIKit
import SnapKit

class SelectViewController: UIViewController {
    let selectView = SelectView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigation()
        selectTamagotchiViewUI()
        configureTableView()
    }
    
    func configureNavigation() {
        navigationController?.navigationBar.topItem?.title = "다마고치 선택하기"
        navigationController?.navigationBar.backgroundColor = .primaryBackgroundColor
    }
    
    func selectTamagotchiViewUI() {
        view.backgroundColor = .primaryBackgroundColor
        view.addSubview(selectView)
        selectView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func configureTableView() {
        selectView.selectTableView.dataSource = self
        selectView.selectTableView.delegate = self
        selectView.selectTableView.register(SelectTableViewCell.self, forCellReuseIdentifier: SelectTableViewCell.id)
    }
}

extension SelectViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TamagotchiData.raisingTamagotchi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SelectTableViewCell.id, for: indexPath) as?
                SelectTableViewCell else { return UITableViewCell() }
        cell.tamagotchiImageView.image = UIImage(named: TamagotchiData.raisingTamagotchi[indexPath.row].info.image.rawValue)
        cell.tamagotchiNameLabel.text = TamagotchiData.raisingTamagotchi[indexPath.row].info.name.rawValue
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailData = TamagotchiData.raisingTamagotchi[indexPath.row]
        let detailVC = DetailViewController()
        detailVC.detailData = detailData
        detailVC.index = indexPath.row
        detailVC.modalPresentationStyle = .overCurrentContext
        present(detailVC, animated: false)
    }
}
