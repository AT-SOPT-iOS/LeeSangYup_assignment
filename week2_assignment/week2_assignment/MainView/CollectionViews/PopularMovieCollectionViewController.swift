//
//  PopularMovieCollectionViewController.swift
//  week2_assignment
//
//  Created by 이상엽 on 5/2/25.
//

import UIKit
import SnapKit

class PopularMovieCollectionViewController: UIViewController {
    private let popularMovieCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    private let popularMovieData = popularMovieModel.dummyData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(popularMovieCollectionView)
        popularMovieCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        popularMovieCollectionView.showsHorizontalScrollIndicator = false
        popularMovieCollectionView.backgroundColor = .clear
        
        PopularMovieCollectionViewLayout()
        register()
        setDelegate()
        
    }
    
    private func PopularMovieCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        layout.itemSize = CGSize(width: 98, height: 146)
        self.popularMovieCollectionView.setCollectionViewLayout(layout, animated: false)
    }
    
    private func register() {
        popularMovieCollectionView.register(PopularMovieCollectionViewCell.self, forCellWithReuseIdentifier: PopularMovieCollectionViewCell.identifier)
    }
    
    private func setDelegate() {
        popularMovieCollectionView.delegate = self
        popularMovieCollectionView.dataSource = self
    }
    
    
}

extension PopularMovieCollectionViewController: UICollectionViewDelegateFlowLayout {
}

extension PopularMovieCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return popularMovieData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = popularMovieCollectionView.dequeueReusableCell(withReuseIdentifier: PopularMovieCollectionViewCell.identifier, for: indexPath) as? PopularMovieCollectionViewCell else { return UICollectionViewCell() }
        cell.dataBind(popularMovieData[indexPath.item])
        
        return cell
    }
    
}
