//
//  LoginViewController.swift
//  week2_assignment
//
//  Created by 이상엽 on 4/23/25.
//

import UIKit

class LoginViewController: UIViewController {
    
    lazy var titleLabel: UILabel = {
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
        textField.layer.cornerRadius = 3
        textField.backgroundColor = .gray4
        textField.font = .pretendardSemiBold15
        textField.textColor = .gray2
        textField.addTarget(self, action: #selector(textFieldDidBegin), for: .editingDidBegin)
        textField.addTarget(self, action: #selector(textFieldDidEnd), for: .editingDidEnd)
        textField.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
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
        textField.layer.cornerRadius = 3
        textField.backgroundColor = .gray4
        textField.font = .pretendardSemiBold15
        textField.textColor = .gray2
        textField.addTarget(self, action: #selector(textFieldDidBegin), for: .editingDidBegin)
        textField.addTarget(self, action: #selector(textFieldDidEnd), for: .editingDidEnd)
        textField.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.isEnabled = false
        button.layer.cornerRadius = 3
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray4.cgColor
        button.titleLabel?.font = .pretendardSemiBold14
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    let findIdButton: UIButton = {
        let button = UIButton()
        button.setTitle("아이디 찾기", for: .normal)
        button.titleLabel?.font = .pretendardSemiBold14
        button.setTitleColor(.gray2, for: .normal)
        button.backgroundColor = .black
        return button
    }()
    
    let buttonDivider: UIView = {
        let view = UIView()
        view.backgroundColor = .gray4
        return view
    }()
    
    let findPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("비밀번호 찾기", for: .normal)
        button.titleLabel?.font = .pretendardSemiBold14
        button.setTitleColor(.gray2, for: .normal)
        button.backgroundColor = .black
        return button
    }()
    
    let dontHaveAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "아직 계정이 없으신가요?"
        label.font = .pretendardSemiBold14
        label.textColor = .gray3
        return label
    }()
    
    let newNicknameButton: UIButton = {
        let button = UIButton()
        let title = "닉네임 만들러가기"
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.pretendardRegular14,
            .foregroundColor: UIColor.gray2,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        let attributedTitle = NSAttributedString(string: title, attributes: attributes)
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.backgroundColor = .black
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
                              loginButton,
                              findIdButton,
                              buttonDivider,
                              findPasswordButton,
                              dontHaveAccountLabel,
                              newNicknameButton)
        
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
        NSLayoutConstraint.activate([buttonDivider.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 36),
                                     buttonDivider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     buttonDivider.widthAnchor.constraint(equalToConstant: 1),
                                     buttonDivider.heightAnchor.constraint(equalToConstant: 12)])
        NSLayoutConstraint.activate([findIdButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 31),
                                     findIdButton.trailingAnchor.constraint(equalTo: buttonDivider.leadingAnchor, constant: -33)])
        NSLayoutConstraint.activate([findPasswordButton.centerYAnchor.constraint(equalTo: findIdButton.centerYAnchor),
                                     findPasswordButton.leadingAnchor.constraint(equalTo: buttonDivider.trailingAnchor, constant: 36)])
        NSLayoutConstraint.activate([dontHaveAccountLabel.topAnchor.constraint(equalTo: findIdButton.bottomAnchor, constant: 28),
                                     dontHaveAccountLabel.centerXAnchor.constraint(equalTo: findIdButton.centerXAnchor)])
        NSLayoutConstraint.activate([newNicknameButton.centerYAnchor.constraint(equalTo: dontHaveAccountLabel.centerYAnchor),
                                     newNicknameButton.leadingAnchor.constraint(equalTo: dontHaveAccountLabel.trailingAnchor, constant: 17),
                                     newNicknameButton.widthAnchor.constraint(equalToConstant: 128)])
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
    @objc
    func loginButtonDidTap() {
        pushToWelcomVC()
    }
    private func pushToWelcomVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.id = idTextField.text ?? ""
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
        
    }
    @objc func textFieldsDidChange(_ textField: UITextField) {
        let isIdFilled = !(idTextField.text ?? "").isEmpty
        let isPasswordFilled = !(passwordTextField.text ?? "").isEmpty
        
        let shouldEnable = isIdFilled && isPasswordFilled
        loginButton.isEnabled = shouldEnable
        loginButton.alpha = shouldEnable ? 1.0 : 0.5
        loginButton.backgroundColor = shouldEnable ? .redTving : .gray4
    }
    @objc func textFieldDidBegin(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.gray2.cgColor
        textField.layer.borderWidth = 1
    }
    
    @objc func textFieldDidEnd(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.clear.cgColor
        textField.layer.borderWidth = 0
    }
}

#Preview {
    LoginViewController()
}
