//
//  MainTamagotchiViewController.swift
//  YegrTamagotchiApp
//
//  Created by YJ on 6/8/24.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    let mainView = MainView()
    var mainData: RaisingTamagotchi?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        configureNavigation()
    }
    
    func configureUI() {
        view.backgroundColor = .primaryBackgroundColor
        view.addSubview(mainView)
        
        let safeArea = view.safeAreaLayoutGuide
        mainView.snp.makeConstraints {
            $0.edges.equalTo(safeArea)
        }
    }

    func configureNavigation() {
        navigationController?.navigationBar.barTintColor = .primaryBackgroundColor
        navigationController?.navigationBar.topItem?.title = "Yegr님의 다마고치"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.fontBorderColor]
        
        let rightSettingButton = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle"), style: .plain, target: self, action: #selector(settingButtonClicked))
        navigationController?.navigationBar.topItem?.rightBarButtonItem = rightSettingButton
        navigationController?.navigationBar.topItem?.rightBarButtonItem?.tintColor = .fontBorderColor
    }
    
    func setData() {
        
    }
    
    @objc func settingButtonClicked() {
        print(#function)
    }
}
