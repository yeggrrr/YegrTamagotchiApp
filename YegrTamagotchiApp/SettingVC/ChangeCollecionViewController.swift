//
//  ChangeCollecionViewController.swift
//  YegrTamagotchiApp
//
//  Created by YJ on 6/22/24.
//

import UIKit
import SnapKit

class ChangeCollecionViewController: UIViewController {
    let changeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: collecionViewLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    func configureUI() {
        // navigation
        navigationController?.navigationBar.topItem?.title = "다마고치 변경하기"
        navigationController?.navigationBar.backgroundColor = .primaryBackgroundColor
        // view
        view.backgroundColor = .primaryBackgroundColor
        // collecionView
        changeCollectionView.backgroundColor = .primaryBackgroundColor
        view.addSubview(changeCollectionView)
        
        changeCollectionView.delegate = self
        changeCollectionView.dataSource = self
        changeCollectionView.register(ChangeCollectionViewCell.self, forCellWithReuseIdentifier: ChangeCollectionViewCell.id)
        
        changeCollectionView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    static func collecionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        let sectionSpacing: CGFloat = 5
        let cellSpacing: CGFloat = 5
        let width = UIScreen.main.bounds.width - (sectionSpacing * 2) - (cellSpacing * 2)
        layout.itemSize = CGSize(width: width / 3, height: width / 3)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = cellSpacing
        layout.minimumInteritemSpacing = cellSpacing
        layout.sectionInset = UIEdgeInsets(top: sectionSpacing, left: sectionSpacing, bottom: sectionSpacing, right: sectionSpacing)
        return layout
    }
}

extension ChangeCollecionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TamagotchiData.raisingTamagotchi.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChangeCollectionViewCell.id, for: indexPath) as? ChangeCollectionViewCell else { return UICollectionViewCell() }
        let item = TamagotchiData.raisingTamagotchi[indexPath.row]
        cell.tamagotchiImageView.image = UIImage(named: item.thumbnailImageName)
        cell.tamagotchiNameLabel.text = item.info.name.rawValue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailData = TamagotchiData.raisingTamagotchi[indexPath.row]
        let detailVC = TamagotchiDetailViewController()
        detailVC.detailData = detailData
        detailVC.index = indexPath.row
        detailVC.modalPresentationStyle = .overCurrentContext
        present(detailVC, animated: false)
    }
}
