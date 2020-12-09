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
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var passwordTextField: UITextField! {
        didSet {
            let attributes = [
                NSAttributedString.Key.font: FontFamily.SFUIDisplay.light.font(size: 11)
            ]

            passwordTextField.attributedPlaceholder = NSAttributedString(string: Strings.Auth.Password.placeholder, attributes: attributes)
        }
    }
    @IBOutlet weak var loginTextField: UITextField! {
        didSet {
            let attributes = [
                NSAttributedString.Key.font: FontFamily.SFUIDisplay.light.font(size: 11)
            ]

            loginTextField.attributedPlaceholder = NSAttributedString(string: Strings.Auth.Login.placeholder, attributes: attributes)
        }
    }

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var centerView: UIView!
    @IBOutlet weak var registerView: UIView!
    @IBOutlet weak var registerViewTop: NSLayoutConstraint!
    @IBOutlet weak var enterButtonTop: NSLayoutConstraint!
    @IBOutlet weak var logoTop: NSLayoutConstraint!

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
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!


    var viewModel: LoginViewModelProtocol?

    var keyboardHeight: CGFloat = 0
    var difference: CGFloat = 0
    var contentOffset: CGFloat = 0

    var keyboardIsShown = false

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setTextFieldPaddings()
        //self.view.backgroundColor = .white

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)

        viewModel?.updateState = { [weak self] state in
            guard let self = self else {
                return
            }
            DispatchQueue.main.async {
                switch state {
                case .normal:
                    self.activityIndicator.stopAnimating()
                case .loading:
                    self.activityIndicator.startAnimating()
                case .error(let viewData):
                  self.activityIndicator.stopAnimating()
                    self.viewModel?.showErrorMassage(from: self, viewData)
                }
            }
        }

        viewModel?.updateScreen = { [weak self] viewData in
            self?.setLoginState(isValid: viewData.isEmailValid)
            self?.setPasswordState(isValid: viewData.isPasswordValid)
        }

        viewModel?.start()
    }

    override func viewDidLayoutSubviews() {
        if view.bounds.height - (headerView.bounds.height + centerView.bounds.height) < 100 {
            enterButtonTop.constant = 60
            logoTop.constant = 50
        }

        let bottomSpace = askRegistrationLabel.bounds.height + registerButton.bounds.height + 80
        let registerTop = view.bounds.height - headerView.bounds.height - centerView.bounds.height - bottomSpace
        registerViewTop.constant = registerTop > 0 ? registerTop : 15

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    // MARK: Actions
    @IBAction func toMainScreen(_ sender: Any) {
        let data = LoginViewData(email: loginTextField.text ?? "", password: passwordTextField.text ?? "")
        viewModel?.login(data: data)
    }

    @IBAction func registrationDidTap(_ sender: Any) {
        viewModel?.openRegistartion(from: self)
    }

    @IBAction func viewDidTap(_ sender: Any) {
        view.endEditing(true)
    }

    @objc func keyboardWillShow(sender: NSNotification) {
        guard !keyboardIsShown else {
            return
        }
        if let keyboardSize = (sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                keyboardHeight = keyboardSize.height
            }
        self.keyboardIsShown = true
        let emptyDiff = view.bounds.height - (registerView.bounds.height + headerView.bounds.height + centerView.bounds.height)
        let emptySpace = emptyDiff > 0 ? emptyDiff : 0
        difference = (keyboardHeight - (emptySpace + registerView.bounds.height)) - self.scrollView.contentOffset.y
        if difference > 0 {
            self.scrollView.contentOffset.y += difference + 20
        }
        else {
            difference = 0
        }


    }

    @objc func keyboardWillHide(sender: NSNotification) {
        self.keyboardIsShown = false
        guard difference > 0 else {
            return
        }
        self.scrollView.contentOffset.y -= difference + 20
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
        let loginPaddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 20))
        loginTextField.leftView = loginPaddingView
        loginTextField.leftViewMode = .always
        let passwordPaddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 20))
        passwordTextField.leftView = passwordPaddingView
        passwordTextField.leftViewMode = .always
    }

}
