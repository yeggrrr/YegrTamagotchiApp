//
//  SelectCollectionViewController.swift
//  YegrTamagotchiApp
//
//  Created by YJ on 6/12/24.
//

import UIKit
import SnapKit

class SelectCollectionViewController: UIViewController {
    let selectCollectionView = UICollectionView(frame: .zero, collectionViewLayout: collecionViewLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    func configureUI() {
        // navigation
        navigationController?.navigationBar.topItem?.title = "다마고치 선택하기"
        navigationController?.navigationBar.backgroundColor = .primaryBackgroundColor
        // view
        view.backgroundColor = .primaryBackgroundColor
        // collecionView
        selectCollectionView.backgroundColor = .primaryBackgroundColor
        view.addSubview(selectCollectionView)
        
        selectCollectionView.delegate = self
        selectCollectionView.dataSource = self
        selectCollectionView.register(SelectCollectionViewCell.self, forCellWithReuseIdentifier: SelectCollectionViewCell.id)
        
        selectCollectionView.snp.makeConstraints {
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

extension SelectCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TamagotchiData.raisingTamagotchi.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectCollectionViewCell.id, for: indexPath) as? SelectCollectionViewCell else { return UICollectionViewCell() }
        let item = TamagotchiData.raisingTamagotchi[indexPath.row]
        cell.tamagotchiImageView.image = UIImage(named: item.thumbnailImageName)
        cell.tamagotchiNameLabel.text = item.name.rawValue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailData = TamagotchiData.raisingTamagotchi[indexPath.row]
        let detailVC = DetailViewController()
        detailVC.detailData = detailData
        detailVC.index = indexPath.row
        detailVC.modalPresentationStyle = .overCurrentContext
        present(detailVC, animated: false)
    }
}
