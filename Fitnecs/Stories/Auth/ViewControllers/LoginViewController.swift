//
//  LoginViewController.swift
//  VTBMobile
//
//  Created by Alexandr Gabrusevich on 11/20/19.
//  Copyright © 2019 Panov Sergey. All rights reserved.
//

import UIKit
import SwiftMessages

class LoginViewController: BaseViewController {

    // MARK: Properties
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var passwordTextField: UITextField! {
        didSet {
            passwordTextField.placeholder = Strings.Auth.Login.placeholder
        }
    }
    @IBOutlet weak var loginTextField: UITextField! {
        didSet {
            loginTextField.placeholder = Strings.Auth.Password.placeholder
        }
    }
    @IBOutlet weak var registerView: UIView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.text = Strings.Auth.Login.title
        }
    }
    @IBOutlet weak var enterButton: UIButton! {
        didSet {
            enterButton.setTitle(Strings.Auth.Login.Enter.Button.title, for: .normal)
        }
    }
    @IBOutlet weak var askRegistrationLabel: UILabel! {
        didSet {
            askRegistrationLabel.text = Strings.Auth.Login.Ask.Registration.title
        }
    }
    @IBOutlet weak var registerButton: UIButton! {
        didSet {
            registerButton.setTitle(Strings.Auth.Registration.Button.title, for: .normal)
        }
    }


    var viewModel: LoginViewModelProtocol?

    var keyboardHeight: CGFloat = 0
    var difference: CGFloat = 0
    var contentOffset: CGFloat = 0

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setTextFieldPaddings()
        self.view.backgroundColor = Assets.Colors.fitnecsBaseColor.color

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil);

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil);

        viewModel?.updateState = { [weak self] state in
            DispatchQueue.main.async {
                switch state {
                case .normal:
                  return
                case .loading:
                  return
                case .error(let viewData):
                  return
                }
            }
        }

        viewModel?.updateScreen = { [weak self] viewData in
            self?.setLoginState(isValid: viewData.isEmailValid)
            self?.setPasswordState(isValid: viewData.isPasswordValid)
        }

        viewModel?.start()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    // MARK: Actions
    @IBAction func toMainScreen(_ sender: Any) {

        var data = LoginViewData()
        data.email = loginTextField.text ?? ""
        data.password = passwordTextField.text ?? ""

        viewModel?.login(data: data)

    }
    @IBAction func registrationDidTap(_ sender: Any) {
        viewModel?.openRegistartion(from: self)
    }

    @IBAction func viewDidTap(_ sender: Any) {
        view.endEditing(true)
    }

    @objc func keyboardWillShow(sender: NSNotification) {
        if let keyboardSize = (sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                keyboardHeight = keyboardSize.height
            }
        contentOffset = self.scrollView.contentOffset.y
        difference = keyboardHeight - (view.bounds.height - (registerView.bounds.height + headerView.bounds.height) + self.scrollView.contentOffset.y)
        if difference > 0 {
            self.scrollView.contentOffset.y += difference
        }


    }

    @objc func keyboardWillHide(sender: NSNotification) {
        self.scrollView.contentOffset.y = contentOffset
    }

    // MARK: Private

    private func setLoginState(isValid: Bool) {
        loginTextField.layer.borderWidth = isValid ?  0 : 1
        loginTextField.layer.borderColor = UIColor.red.cgColor
    }

    private func setPasswordState(isValid: Bool) {
        passwordTextField.layer.borderWidth = isValid ?  0 : 1
        passwordTextField.layer.borderColor = UIColor.red.cgColor
    }

    private func  setTextFieldPaddings() {
        let loginPaddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 7, height: 20))
        loginTextField.leftView = loginPaddingView
        loginTextField.leftViewMode = .always
        let passwordPaddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 7, height: 20))
        passwordTextField.leftView = passwordPaddingView
        passwordTextField.leftViewMode = .always
    }

}
