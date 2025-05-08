//
//  MasterpieceCollectionViewController.swift
//  week2_assignment
//
//  Created by 이상엽 on 5/2/25.
//

import UIKit
import SnapKit

class MasterpieceCollectionViewController: UIViewController {
    private let masterpieceCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    private let masterpieceData = masterpieceModel.dummyData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(masterpieceCollectionView)
        masterpieceCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        masterpieceCollectionView.showsHorizontalScrollIndicator = false
        masterpieceCollectionView.backgroundColor = .clear
        
        masterpieceCollectionViewLayout()
        register()
        setDelegate()
        
    }
    
    private func masterpieceCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        layout.itemSize = CGSize(width: 160, height: 90)
        self.masterpieceCollectionView.setCollectionViewLayout(layout, animated: false)
    }
    
    private func register() {
        masterpieceCollectionView.register(MasterpieceCollectionViewCell.self, forCellWithReuseIdentifier: MasterpieceCollectionViewCell.identifier)
    }
    
    private func setDelegate() {
        masterpieceCollectionView.delegate = self
        masterpieceCollectionView.dataSource = self
    }
    
    
}

extension MasterpieceCollectionViewController: UICollectionViewDelegateFlowLayout {
}

extension MasterpieceCollectionViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return masterpieceData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = masterpieceCollectionView.dequeueReusableCell(withReuseIdentifier: MasterpieceCollectionViewCell.identifier, for: indexPath) as? MasterpieceCollectionViewCell else { return UICollectionViewCell() }
        cell.dataBind(masterpieceData[indexPath.item])
        
        return cell
    }
    
}
