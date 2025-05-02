//
//  MainViewController.swift
//  week2_assignment
//
//  Created by 이상엽 on 4/29/25.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {
    
    private let topLogoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "top_logo_tving")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let searchButton: UIButton = {
        let button = UIButton(type: .system)
        let config = UIImage.SymbolConfiguration(pointSize: 20, weight: .regular)
        let image = UIImage(systemName: "magnifyingglass", withConfiguration: config)
        
        button.setImage(image, for: .normal)
        button.tintColor = .white
        
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.imageView?.contentMode = .scaleAspectFit
        
        return button
    }()
    
    private let tvingButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "tving_button"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private lazy var topButtonStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        return stack
    }()
    
    private lazy var topNavBarStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 103
        return stack
    }()
    
    private let tabBar = CustomTabBarView (
        titles: ["홈", "드라마", "예능", "영화", "스포츠", "뉴스"]
    )
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let mainPostImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "yourname")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let todayTvingLabel: UILabel = {
        let label = UILabel()
        label.text = "오늘의 티빙 TOP 20"
        label.font = .pretendardSemiBold15
        label.textColor = .white
        return label
    }()
    
    private let todayTvingCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    private let todayData = todayTvingModel.dummyData()
    
    private let popularLiveLabel: UILabel = {
        let label = UILabel()
        label.text = "실시간 인기 LIVE"
        label.font = .pretendardSemiBold15
        label.textColor = .white
        return label
    }()
    
    private let moreButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("더보기", for: .normal)
        button.setTitleColor(.gray2, for: .normal)
        button.titleLabel?.font = .pretendardMedium11
        return button
    }()
    
    private let liveStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        return stack
    }()
    
    private let popularLiveCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    private let popularData = popularLiveModel.dummyData()
    
    private let baseballVC = BaseballCollectionViewController()
    
    private let popularMovieLabel: UILabel = {
        let label = UILabel()
        label.text = "실시간 인기 영화"
        label.font = .pretendardSemiBold15
        label.textColor = .white
        return label
    }()
    
    private let popularMovieTextStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        return stack
    }()
    
    private let popularMovieVC = PopularMovieCollectionViewController()
    
    private let etcVC = etcCollectionViewController()
    
    private let masterpieceLabel: UILabel = {
        let label = UILabel()
        label.text = "이상엽PD의 인생작 TOP 5"
        label.font = .pretendardSemiBold15
        label.textColor = .white
        return label
    }()
    
    private let masterpieceVC = MasterpieceCollectionViewController()
    
    private let notiLabelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        return stackView
    }()
    
    private let notificationStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 17, bottom: 0, right: 17)
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.backgroundColor = .gray4
        stackView.layer.cornerRadius = 5
        stackView.clipsToBounds = true
        return stackView
    }()
    
    private let notiLabel: UILabel = {
        let label = UILabel()
        label.text = "공지"
        label.font = .pretendardMedium11
        label.textColor = .gray2
        return label
    }()
    
    private let notiTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "티빙 계정 공유 정책 추가 안내"
        label.font = .pretendardMedium11
        label.numberOfLines = 0
        label.textColor = .gray1
        return label
    }()
    
    private let notiButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private let infoButton1: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("고객문의", for: .normal)
        button.titleLabel?.font = .pretendardMedium10
        button.tintColor = .gray2
        return button
    }()
    
    private let infoButton2: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("이용약관", for: .normal)
        button.titleLabel?.font = .pretendardMedium10
        button.tintColor = .gray2
        return button
    }()
    
    private let infoButton3: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("개인정보처리방침", for: .normal)
        button.titleLabel?.font = .pretendardMedium10
        button.tintColor = .white
        return button
    }()
    
    private let infoFirstStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        return stackView
    }()
    
    private let infoButton4: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("사업자정보", for: .normal)
        button.titleLabel?.font = .pretendardMedium10
        button.tintColor = .gray2
        return button
    }()
    
    private let infoButton5: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("인재채용", for: .normal)
        button.titleLabel?.font = .pretendardMedium10
        button.tintColor = .gray2
        return button
    }()
    
    private let infoSecondStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        return stackView
    }()
    
    private let infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .leading
        return stackView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        
        setTodayTvingCollectionViewLayout()
        popularLiveCollectionViewLayout()
        register()
        setDelegate()
        
    }
    
    private func setUI() {
        view.backgroundColor = .black
        self.navigationItem.hidesBackButton = true
        
        topButtonStackView.addArrangedSubview(searchButton)
        topButtonStackView.addArrangedSubview(tvingButton)
        
        topNavBarStackView.addArrangedSubview(topLogoImage)
        topNavBarStackView.addArrangedSubview(topButtonStackView)
        
        self.view.addSubviews(topNavBarStackView,
                              tabBar,
                              scrollView)
        scrollView.addSubview(contentView)
        
        liveStackView.addArrangedSubview(popularLiveLabel)
        liveStackView.addArrangedSubview(moreButton)
        
        popularMovieTextStackView.addArrangedSubview(popularMovieLabel)
        popularMovieTextStackView.addArrangedSubview(moreButton)
        
        todayTvingCollectionView.showsHorizontalScrollIndicator = false
        todayTvingCollectionView.backgroundColor = .clear
        
        popularLiveCollectionView.showsHorizontalScrollIndicator = false
        popularLiveCollectionView.backgroundColor = .clear
        
        notiLabelStackView.addArrangedSubview(notiLabel)
        notiLabelStackView.addArrangedSubview(notiTitleLabel)
        
        notificationStackView.addArrangedSubview(notiLabelStackView)
        notificationStackView.addArrangedSubview(notiButton)
        
        infoFirstStackView.addArrangedSubview(infoButton1)
        infoFirstStackView.addArrangedSubview(infoButton2)
        infoFirstStackView.addArrangedSubview(infoButton3)
        
        infoSecondStackView.addArrangedSubview(infoButton4)
        infoSecondStackView.addArrangedSubview(infoButton5)
        
        infoStackView.addArrangedSubview(infoFirstStackView)
        infoStackView.addArrangedSubview(infoSecondStackView)
        
        
        contentView.addSubviews(mainPostImageView,
                                todayTvingLabel,
                                todayTvingCollectionView,
                                liveStackView,
                                popularLiveCollectionView,
                                baseballVC.view,
                                popularMovieTextStackView,
                                popularMovieVC.view,
                                etcVC.view,
                                masterpieceLabel,
                                masterpieceVC.view,
                                notificationStackView,
                                infoStackView)
        
    }
    
    private func setLayout() {
        topNavBarStackView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(60)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview().inset(11)
            
        }
        
        tabBar.snp.makeConstraints {
            $0.top.equalTo(topNavBarStackView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(44)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(tabBar.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints{
            $0.top.equalTo(scrollView.contentLayoutGuide.snp.top)
            $0.bottom.equalTo(scrollView.contentLayoutGuide.snp.bottom)
            $0.trailing.equalTo(scrollView.contentLayoutGuide.snp.trailing)
            $0.leading.equalTo(scrollView.contentLayoutGuide.snp.leading)
            
            $0.width.equalTo(scrollView.frameLayoutGuide)
        }
        
        mainPostImageView.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(620)
        }
        
        todayTvingLabel.snp.makeConstraints{
            $0.top.equalTo(mainPostImageView.snp.bottom).offset(9)
            $0.leading.equalToSuperview().offset(12)
        }
        
        todayTvingCollectionView.snp.makeConstraints{
            $0.top.equalTo(todayTvingLabel.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(200)
        }
        
        liveStackView.snp.makeConstraints{
            $0.top.equalTo(todayTvingCollectionView.snp.bottom).offset(9)
            $0.leading.equalToSuperview().offset(12)
            $0.trailing.equalToSuperview().inset(12)
            
        }
        
        popularLiveCollectionView.snp.makeConstraints{
            $0.top.equalTo(popularLiveLabel.snp.bottom).offset(9)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(150)
        }
        
        popularMovieTextStackView.snp.makeConstraints{
            $0.top.equalTo(popularLiveCollectionView.snp.bottom).offset(18)
            $0.leading.equalToSuperview().offset(12)
            $0.trailing.equalToSuperview().inset(12)
            
        }
        
        popularMovieVC.view.snp.makeConstraints {
            $0.top.equalTo(popularMovieLabel.snp.bottom).offset(13)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(146)
        }
        
        baseballVC.view.snp.makeConstraints {
            $0.top.equalTo(popularMovieVC.view.snp.bottom).offset(28)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        etcVC.view.snp.makeConstraints{
            $0.top.equalTo(baseballVC.view.snp.bottom).offset(28)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(45)
        }
        
        masterpieceLabel.snp.makeConstraints{
            $0.top.equalTo(etcVC.view.snp.bottom).offset(25)
            $0.leading.equalToSuperview().offset(12)
        }
        
        masterpieceVC.view.snp.makeConstraints{
            $0.top.equalTo(masterpieceLabel.snp.bottom).offset(13)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(90)
        }
        
        notificationStackView.snp.makeConstraints{
            $0.top.equalTo(masterpieceVC.view.snp.bottom).offset(23)
            $0.leading.equalToSuperview().offset(14)
            $0.trailing.equalToSuperview().inset(14)
            $0.height.equalTo(50)
        }
        
        infoStackView.snp.makeConstraints {
            $0.top.equalTo(notificationStackView.snp.bottom).offset(13)
            $0.leading.equalToSuperview().offset(20)
            $0.height.equalTo(40)
            $0.bottom.equalTo(contentView.snp.bottom)
        }
        
    }
    
    private func setTodayTvingCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        self.todayTvingCollectionView.setCollectionViewLayout(layout, animated: false)
    }
    
    private func popularLiveCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 7
        layout.sectionInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        self.popularLiveCollectionView.setCollectionViewLayout(layout, animated: false)
    }
    
    private func register() {
        todayTvingCollectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        popularLiveCollectionView.register(popularLiveCollectionViewCell.self, forCellWithReuseIdentifier: popularLiveCollectionViewCell.identifier)
        
    }
    
    private func setDelegate() {
        todayTvingCollectionView.delegate = self
        todayTvingCollectionView.dataSource = self
        
        popularLiveCollectionView.delegate = self
        popularLiveCollectionView.dataSource = self
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == todayTvingCollectionView {
            return todayData.count
        } else if collectionView == popularLiveCollectionView {
            return popularData.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == todayTvingCollectionView {
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CollectionViewCell.identifier,
                for: indexPath
            ) as! CollectionViewCell
            cell.dataBind(todayData[indexPath.item])
            return cell
            
        } else {
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: popularLiveCollectionViewCell.identifier,
                for: indexPath
            ) as! popularLiveCollectionViewCell
            cell.dataBind(popularData[indexPath.item])
            return cell
        }
    }
    
    
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == todayTvingCollectionView {
            let posterWidth = UIScreen.main.bounds.width * 0.3
            let labelWidth: CGFloat = 24
            let spacing: CGFloat = 8
            
            let totalWidth = posterWidth + labelWidth + spacing
            let totalHeight = posterWidth * 1.5
            return CGSize(width: totalWidth, height: totalHeight)
        }
        
        else if collectionView == popularLiveCollectionView {
            let itemHeight: CGFloat = 150
            let itemWidth = itemHeight * 1.2
            return CGSize(width: itemWidth, height: itemHeight)
        }
        
        return .zero
    }
}

#Preview{
    MainViewController()
}
