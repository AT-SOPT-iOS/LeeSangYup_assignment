//
//  etcCollectionViewController.swift
//  week2_assignment
//
//  Created by 이상엽 on 5/2/25.
//

import UIKit
import SnapKit

class etcCollectionViewController: UIViewController {
    private let etcCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    private let etcData = etcModel.dummyData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(etcCollectionView)
        etcCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        etcCollectionView.showsHorizontalScrollIndicator = false
        etcCollectionView.backgroundColor = .clear
        
        etcCollectionViewLayout()
        register()
        setDelegate()
        
    }
    
    private func etcCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 7
        layout.sectionInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        layout.itemSize = CGSize(width: 90, height: 45)
        self.etcCollectionView.setCollectionViewLayout(layout, animated: false)
    }
    
    private func register() {
        etcCollectionView.register(etcCollectionViewCell.self, forCellWithReuseIdentifier: etcCollectionViewCell.identifier)
    }
    
    private func setDelegate() {
        etcCollectionView.delegate = self
        etcCollectionView.dataSource = self
    }
    
    
}

extension etcCollectionViewController: UICollectionViewDelegateFlowLayout {
}

extension etcCollectionViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return etcData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = etcCollectionView.dequeueReusableCell(withReuseIdentifier: etcCollectionViewCell.identifier, for: indexPath) as? etcCollectionViewCell else { return UICollectionViewCell() }
        cell.dataBind(etcData[indexPath.item])
        
        return cell
    }
    
}
