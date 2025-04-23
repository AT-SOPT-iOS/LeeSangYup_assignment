//
//  LoginViewController.swift
//  week2_assignment
//
//  Created by 이상엽 on 4/23/25.
//

import UIKit

class LoginViewController: UIViewController {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text="TVING ID 로그인"
        label.font = .pretendardMedium23
        label.numberOfLines = 2
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    lazy var idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디"
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 22, height: 0))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        let xButton = UIButton(type: .custom)
        xButton.setImage(UIImage(named: "x_circle"), for: .normal)
        xButton.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        xButton.addTarget(self, action: #selector(clearIdTextField), for: .touchUpInside)
        let container = UIView(frame: CGRect(x: 0, y: 0, width: 52, height: 24))
        container.addSubview(xButton)
        xButton.center = container.center
        textField.rightView = container
        textField.rightViewMode = .whileEditing
        textField.setPlaceholderColor(.gray2)
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .gray4
        textField.font = .pretendardSemiBold15
        textField.textColor = .gray2
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.isSecureTextEntry = true
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 22, height: 0))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        let eyeButton = UIButton(type: .custom)
        eyeButton.setImage(UIImage(named: "eye_slash"), for: .normal)
        eyeButton.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        eyeButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        textField.rightViewMode = .whileEditing
        let xButton = UIButton(type: .custom)
        xButton.setImage(UIImage(named: "x_circle"), for: .normal)
        xButton.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        xButton.addTarget(self, action: #selector(clearPasswordTextField), for: .touchUpInside)
        xButton.frame.origin = CGPoint(x: -16, y: 0)
        let container = UIView(frame: CGRect(x: 0, y: 0, width: 52, height: 24))
        container.addSubview(eyeButton)
        container.addSubview(xButton)
        eyeButton.center = container.center
        textField.rightView = container
        textField.setPlaceholderColor(.gray2)
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .gray4
        textField.font = .pretendardSemiBold15
        textField.textColor = .gray2
        return textField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .redTving
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 3
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.1
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowRadius = 6
        button.titleLabel?.font = .pretendardSemiBold14
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        setLayout()
    }
    
    func setLayout() {
        self.view.addSubviews(titleLabel,
                              idTextField,
                              passwordTextField,
                              loginButton)
        
        NSLayoutConstraint.activate([titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 90),
                                     titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)])
        NSLayoutConstraint.activate([idTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 31),
                                     idTextField.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor),
                                     idTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
                                     idTextField.heightAnchor.constraint(equalToConstant: 52)])
        NSLayoutConstraint.activate([passwordTextField.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: 7),
                                     passwordTextField.centerXAnchor.constraint(equalTo: passwordTextField.centerXAnchor),
                                     passwordTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
                                     passwordTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
                                     passwordTextField.heightAnchor.constraint(equalToConstant: 52)])
        NSLayoutConstraint.activate([loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 21),
                                     loginButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
                                     loginButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
                                     loginButton.heightAnchor.constraint(equalToConstant: 52)])
    }
    
    @objc
    func togglePasswordVisibility(_ sender: UIButton) {
        passwordTextField.isSecureTextEntry.toggle()
        let iconName = passwordTextField.isSecureTextEntry ? "eye_slash" : "eye"
        sender.setImage(UIImage(named: iconName), for: .normal)
    }
    @objc
    func clearPasswordTextField() {
        passwordTextField.text = ""
    }
    @objc
    func clearIdTextField() {
        idTextField.text = ""
    }
}

#Preview {
    LoginViewController()
}
