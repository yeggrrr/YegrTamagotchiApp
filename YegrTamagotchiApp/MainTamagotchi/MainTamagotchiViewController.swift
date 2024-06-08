//
//  MainTamagotchiViewController.swift
//  YegrTamagotchiApp
//
//  Created by YJ on 6/8/24.
//

import UIKit
import SnapKit

class MainTamagotchiViewController: UIViewController {
    let mainView = MainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        configureNavigation()
    }
    
    func configureUI() {
        view.backgroundColor = UIColor.primaryBackgroundColor()
        view.addSubview(mainView)
        let safeArea = view.safeAreaLayoutGuide
        mainView.snp.makeConstraints {
            $0.edges.equalTo(safeArea)
        }
    }

    func configureNavigation() {
        navigationController?.navigationBar.barTintColor = UIColor.primaryBackgroundColor()
        navigationController?.navigationBar.topItem?.title = "Yegr님의 다마고치"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.fontBorderColor()]
        
        let rightSettingButton = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle"), style: .plain, target: self, action: #selector(settingButtonClicked))
        navigationController?.navigationBar.topItem?.rightBarButtonItem = rightSettingButton
        navigationController?.navigationBar.topItem?.rightBarButtonItem?.tintColor = UIColor.fontBorderColor()
    }
    
    @objc func settingButtonClicked() {
        print(#function)
    }
}
