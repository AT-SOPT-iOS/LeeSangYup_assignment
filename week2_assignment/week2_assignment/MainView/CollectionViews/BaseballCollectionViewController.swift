//
//  BaseballCollectionViewController.swift
//  week2_assignment
//
//  Created by 이상엽 on 5/2/25.
//

import UIKit
import SnapKit

class BaseballCollectionViewController: UIViewController {
    private let baseballCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    private let baseballData = baseballModel.dummyData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(baseballCollectionView)
        baseballCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        baseballCollectionView.showsHorizontalScrollIndicator = false
        baseballCollectionView.backgroundColor = .clear
        
        baseballCollectionViewLayout()
        register()
        setDelegate()
        
    }
    
    private func baseballCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: 80, height: 50)
        self.baseballCollectionView.setCollectionViewLayout(layout, animated: false)
    }
    
    private func register() {
        baseballCollectionView.register(baseballCollectionViewCell.self, forCellWithReuseIdentifier: baseballCollectionViewCell.identifier)
    }
    
    private func setDelegate() {
        baseballCollectionView.delegate = self
        baseballCollectionView.dataSource = self
    }
    
    
}

extension BaseballCollectionViewController: UICollectionViewDelegateFlowLayout {
}

extension BaseballCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return baseballData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = baseballCollectionView.dequeueReusableCell(withReuseIdentifier: baseballCollectionViewCell.identifier, for: indexPath) as? baseballCollectionViewCell else { return UICollectionViewCell() }
        cell.dataBind(baseballData[indexPath.item])
        
        if indexPath.item % 2 == 0 {
            cell.backgroundColor = .white
        } else {
            cell.backgroundColor = .clear   
        }
        
        return cell
    }
    
}
