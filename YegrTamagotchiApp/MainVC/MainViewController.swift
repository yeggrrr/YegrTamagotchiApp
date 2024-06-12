//
//  MainTamagotchiViewController.swift
//  YegrTamagotchiApp
//
//  Created by YJ on 6/8/24.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    enum Food {
        case bob
        case water
    }
    
    let mainView = MainView()
    let nickname = UserInfo.nickname
    
    var mainData: RaisingTamagotchi?
    var index: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        configureNavigation()
        setData()
        setButtonAction()
        textFieldUI()
    }
    
    func configureUI() {
        view.backgroundColor = .primaryBackgroundColor
        view.addSubview(mainView)
        
        let safeArea = view.safeAreaLayoutGuide
        mainView.snp.makeConstraints {
            $0.edges.equalTo(safeArea)
        }
        
        mainView.storyLabel.text = "\(nickname)님! 반가워요!"
    }

    func configureNavigation() {
        navigationController?.navigationBar.barTintColor = .primaryBackgroundColor
        navigationController?.navigationBar.topItem?.title = "\(nickname)님의 다마고치"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.fontBorderColor]
        
        let rightSettingButton = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle"), style: .plain, target: self, action: #selector(settingButtonClicked))
        navigationController?.navigationBar.topItem?.rightBarButtonItem = rightSettingButton
        navigationController?.navigationBar.topItem?.rightBarButtonItem?.tintColor = .fontBorderColor
    }
    
    func textFieldUI() {
        mainView.feedTextField.delegate = self
        mainView.waterTextField.delegate = self
    }
    
    func setRandomStory() {
        guard let name = mainData?.info.name.rawValue else { return }
        let nickname = UserInfo.nickname
        mainView.storyLabel.text = [
            "오늘도 좋은 하루 보내세요!\n\(nickname)님!",
            "저는 \(name)이에요! 배고파요!",
            "저..성장하고 싶어요... \(nickname)님...",
            "아사할 거 같아요..\(nickname)님...",
            "\(nickname)님 혹시 T..?",
            "내 이름은 \(name), 탐정이죠.",
            "무럭무럭 자랄 수 있도록 도와주세요!\n\(nickname)님!",
            "\(nickname)님~ 산책하기 좋은 날씨네요!\n카페 공부는 어때요?",
            "\(nickname)님, 잠이 오나요?\n배도 부른데 코딩하면서 소화 좀 시키죠?ㅎㅎ"
        ].randomElement()
    }
    
    func setData() {
        guard let mainData = mainData else { return }
        updateLevel()
        mainView.tamagotchiNameLabel.text = mainData.info.name.rawValue
        mainView.currentStatusLabel.text = "Lv\(mainData.level) ∙ 밥알 \(mainData.feedCount)개 ∙ 물방울 \(mainData.waterDropCount)개 "
    }
    
    func updateLevel() {
        guard let imageName = mainData?.imageName else { return }
        mainView.tamagotchiImageView.image = UIImage(named: imageName)
    }
    
    func setButtonAction() {
        mainView.feedButton.addTarget(self, action: #selector(feedButtonClicked), for: .touchUpInside)
        mainView.waterButton.addTarget(self, action: #selector(waterButtonClicked), for: .touchUpInside)
    }
    
    func clearTextField(food: Food) {
        switch food {
        case .bob:
            mainView.feedTextField.text = ""
        case .water:
            mainView.waterTextField.text = ""
        }
    }
    
    func showAlert(title: String, subtitle: String) {
        let alert = UIAlertController(title: title, message: subtitle, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "확인", style: .default)
        alert.addAction(okButton)
        present(alert, animated: true)
    }
    
    func give(food: Food) {
        guard let index else { return }
        let oldData = TamagotchiData.raisingTamagotchi[index]
        
        var newData: RaisingTamagotchi
        switch food {
        case .bob:
            guard let text = mainView.feedTextField.text else { return }
            if text.isEmpty {
                let newFeedCount = oldData.feedCount + 1
                newData = RaisingTamagotchi(
                    info: oldData.info,
                    feedCount: newFeedCount,
                    waterDropCount: oldData.waterDropCount)
            } else {
                guard let stringToIntText = Int(text) else { return }
                guard stringToIntText < 100 else {
                    showAlert(title: "너무 많아요!ㅠㅡㅠ", subtitle: "한 번에 먹일 수 있는 밥은\n'99개'까지 입니다ㅎㅎ" )
                    return
                }
                
                let newFeedCount = oldData.feedCount + stringToIntText
                newData = RaisingTamagotchi(
                    info: oldData.info,
                    feedCount: newFeedCount,
                    waterDropCount: oldData.waterDropCount)
            }

        case .water:
            guard let text = mainView.waterTextField.text else { return }
            if text.isEmpty {
                let newWatercount = oldData.waterDropCount + 1
                newData = RaisingTamagotchi(
                    info: oldData.info,
                    feedCount: oldData.feedCount,
                    waterDropCount: newWatercount)
            } else {
                guard let stringToIntText = Int(text) else { return }
                guard stringToIntText < 50 else {
                    showAlert(title: "너무 많아요!ㅠㅡㅠ", subtitle: "한 번에 먹일 수 있는 물은\n'49방울'까지 입니다ㅎㅎ")
                    return
                }
                let newWatercount = oldData.waterDropCount + stringToIntText
                newData = RaisingTamagotchi(
                    info: oldData.info,
                    feedCount: oldData.feedCount,
                    waterDropCount: newWatercount)
            }
        }
        
        TamagotchiData.raisingTamagotchi[index] = newData
        mainData = TamagotchiData.raisingTamagotchi[index]
        setRandomStory()
        setData()
        clearTextField(food: food)
    }
    
    @objc func feedButtonClicked() {
        give(food: .bob)
    }
    
    @objc func waterButtonClicked() {
        give(food: .water)
    }
    
    @objc func settingButtonClicked() {
        print(#function)
    }
}

extension MainViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = mainView.feedTextField.text else { return true }
        let textLength = text.count + string.count - range.length
        return textLength <= 3
    }
}
