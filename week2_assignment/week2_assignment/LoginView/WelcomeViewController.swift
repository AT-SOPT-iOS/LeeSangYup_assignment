//
//  WelcomeViewController.swift
//  week2_assignment
//
//  Created by 이상엽 on 4/23/25.
//

import UIKit

class WelcomeViewController: UIViewController {
    var id: String?
    let logoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo_tving")
        image.contentMode = .scaleAspectFit
        return image
    }()
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.font = .pretendardBold23
        label.textColor = .white
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    lazy var mainButton: UIButton = {
        let button = UIButton()
        button.setTitle("메인으로", for: .normal)
        button.backgroundColor = .redTving
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 3
        button.addTarget(self, action: #selector(goToMainButtonDidTap), for: .touchUpInside)
        
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        setLayout()
        self.navigationItem.hidesBackButton = true
        bindID()
        
    }
    
    private func setLayout() {
        self.view.addSubviews(logoImage,
                              mainButton,
                              welcomeLabel)
        
        NSLayoutConstraint.activate([logoImage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 58),
                                     logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     logoImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     logoImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     logoImage.heightAnchor.constraint(equalTo: logoImage.widthAnchor, multiplier: 9.0/16.0)
                                     
                                    ])
        NSLayoutConstraint.activate([mainButton.topAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -96),
                                     mainButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
                                     mainButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
                                     mainButton.heightAnchor.constraint(equalToConstant: 52)])
        NSLayoutConstraint.activate([welcomeLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 67),
                                     welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
    }
    @objc
    func backToLoginButtonDidTap() {
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @objc
    func goToMainButtonDidTap() {
        let mainViewController = MainViewController()
        self.navigationController?.pushViewController(mainViewController, animated: true)
    }
    private func bindID() {
        self.welcomeLabel.text = "\(id ?? "???")님 \n반가워요!"
    }
}


#Preview{
    WelcomeViewController()
}

