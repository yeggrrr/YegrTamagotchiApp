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
        setData()
        setButtonAction()
    }
    
    func configureUI() {
        view.backgroundColor = .primaryBackgroundColor
        view.addSubview(mainView)
        
        let safeArea = view.safeAreaLayoutGuide
        mainView.snp.makeConstraints {
            $0.edges.equalTo(safeArea)
        }
        
        let nickname = UserInfo.nickname
        mainView.storyLabel.text = "\(nickname)님! 반가워요!"
    }

    func configureNavigation() {
        navigationController?.navigationBar.barTintColor = .primaryBackgroundColor
        navigationController?.navigationBar.topItem?.title = "Yegr님의 다마고치"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.fontBorderColor]
        
        let rightSettingButton = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle"), style: .plain, target: self, action: #selector(settingButtonClicked))
        navigationController?.navigationBar.topItem?.rightBarButtonItem = rightSettingButton
        navigationController?.navigationBar.topItem?.rightBarButtonItem?.tintColor = .fontBorderColor
    }
    
    func setRandomStory() {
        guard let name = mainData?.info.name else { return }
        let nickname = UserInfo.nickname
        mainView.storyLabel.text = [
            "오늘도 좋은 하루 보내세요!\n\(nickname)님!",
            "저는 \(name)이에요! 배고파요!",
            "저..성장하고 싶어요... \(nickname)님...",
            "아사할 거 같아요..\(nickname)님...",
            "\(nickname)님 혹시 T..?",
            "내 이름은 \(name), 탐정이죠.",
            "무럭무럭 자랄 수 있도록 도와주세요!\n\(nickname)님!",
            "\(nickname)님~ 산책하기 좋은 날씨네요!\n카페 공부는 어때요?"
        ].randomElement()
    }
    
    func setData() {
        guard let image = mainData?.info.image.rawValue else { return }
        guard let level = mainData?.level, let feed = mainData?.feedCount, let water = mainData?.waterDropCount else { return }
        mainView.tamagotchiImageView.image = UIImage(named: image)
        mainView.tamagotchiNameLabel.text = mainData?.info.name.rawValue
        mainView.currentStatusLabel.text = "LV\(level) ∙ 밥알 \(feed)개 ∙ 물방울 \(water)개 "
    }
    
    func setButtonAction() {
        mainView.feedButton.addTarget(self, action: #selector(feedButtonClicked), for: .touchUpInside)
        mainView.waterButton.addTarget(self, action: #selector(waterButtonClicked), for: .touchUpInside)
    }
    
    @objc func feedButtonClicked() {
        setRandomStory()
    }
    
    @objc func waterButtonClicked() {
        setRandomStory()
    }
    
    @objc func settingButtonClicked() {
        print(#function)
    }
}
