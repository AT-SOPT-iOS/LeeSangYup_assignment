//
//  CollectionViewCell.swift
//  week2_assignment
//
//  Created by 이상엽 on 4/30/25.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    static let identifier = "CollectionViewCell"
    
    private let rateNumberLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .pretendardSemiBold50
        return label
    }()
    
    private let todayTvingImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 4
        
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.clipsToBounds = false
        clipsToBounds = false
        backgroundColor = .clear
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        contentView.addSubviews(
            todayTvingImageView,
            rateNumberLabel)
        
        todayTvingImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.leading.equalTo(rateNumberLabel.snp.trailing).offset(8)
            $0.trailing.equalToSuperview()
        }
        
        rateNumberLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(30)
        }
    }
    
    
}

extension CollectionViewCell {
    func dataBind(_ todayData: todayTvingModel) {
        rateNumberLabel.text = todayData.rateNumber
        todayTvingImageView.image = todayData.todayTvingImgae
    }
}

class popularLiveCollectionViewCell: UICollectionViewCell {
    static let identifier = "popularLiveCollectionViewCell"
    
    private let popularLiveImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 4
        return imageView
    }()
    
    private let rankLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendardSemiBold19
        label.textColor = .white
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendardMedium10
        label.textColor = .white
        return label
    }()
    
    private let episodeLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendardRegular10
        label.textColor = .gray2
        return label
    }()
    
    private let viewingRatingLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendardRegular10
        label.textColor = .gray2
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.clipsToBounds = false
        clipsToBounds = false
        backgroundColor = .clear
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        contentView.addSubviews(popularLiveImageView,
                                rankLabel,
                                titleLabel,
                                episodeLabel,
                                viewingRatingLabel)
        
        popularLiveImageView.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(57)
        }
        
        rankLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(popularLiveImageView.snp.bottom).offset(10)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(rankLabel)
            $0.leading.equalTo(rankLabel.snp.trailing).offset(4)
        }
        
        episodeLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(1)
            $0.leading.equalTo(titleLabel)
        }
        
        viewingRatingLabel.snp.makeConstraints {
            $0.top.equalTo(episodeLabel.snp.bottom).offset(1)
            $0.leading.equalTo(titleLabel)
        }
    }
    
}

extension popularLiveCollectionViewCell {
    func dataBind(_ popularData: popularLiveModel) {
        popularLiveImageView.image = popularData.popularLiveImgae
        rankLabel.text = popularData.rankNumber
        titleLabel.text = popularData.liveName
        episodeLabel.text = popularData.episodeNumber
        viewingRatingLabel.text = popularData.viewingNumber
        
    }
}

class baseballCollectionViewCell: UICollectionViewCell {
    static let identifier = "baseballCollectionViewCell"
    
    private let baseballImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        setLayout()
    }
    
    private func setLayout() {
        contentView.addSubviews(baseballImageView)
        
        baseballImageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension baseballCollectionViewCell {
    func dataBind(_ baseballData: baseballModel) {
        baseballImageView.image = baseballData.baseballImage
    }
}

class PopularMovieCollectionViewCell: UICollectionViewCell {
    static let identifier = "PopularMovieCollectionViewCell"
    
    private let PopularMovieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 4
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        setLayout()
    }
    
    private func setLayout() {
        contentView.addSubviews(PopularMovieImageView)
        
        PopularMovieImageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PopularMovieCollectionViewCell {
    func dataBind(_ popularMovieData: popularMovieModel) {
        PopularMovieImageView.image = popularMovieData.popularMovieImage
    }
}

class etcCollectionViewCell: UICollectionViewCell {
    static let identifier = "etcCollectionViewCell"
    
    private let etcImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .gray4
        self.layer.cornerRadius = 4
        self.layer.masksToBounds = true
        setLayout()
    }
    
    private func setLayout() {
        contentView.addSubviews(etcImageView)
        
        etcImageView.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(11)
            $0.trailing.equalToSuperview().inset(11)
            $0.top.equalToSuperview().offset(6)
            $0.bottom.equalToSuperview().inset(5)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension etcCollectionViewCell {
    func dataBind(_ etcData: etcModel) {
        etcImageView.image = etcData.etcImage
    }
}

class MasterpieceCollectionViewCell: UICollectionViewCell {
    static let identifier = "MasterpieceCollectionViewCell"
    
    private let masterpieceImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 4
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    private func setLayout() {
        contentView.addSubviews(masterpieceImageView)
        
        masterpieceImageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MasterpieceCollectionViewCell {
    func dataBind(_ masterpieceData: masterpieceModel) {
        masterpieceImageView.image = masterpieceData.masterpieceImage
    }
}



