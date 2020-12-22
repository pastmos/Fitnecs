//
//  LoginViewController.swift
//  VTBMobile
//
//  Created by Panov Sergey on 11/20/19.
//  Copyright © 2019 Panov Sergey. All rights reserved.
//

import UIKit
import SwiftMessages

class RegistrationViewController: BaseViewController {

    // MARK: Properties

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var navigationBar: NavigationBar! {
        didSet {
            navigationBar.bind(title: Strings.Auth.Registration.title)
        }
    }
    @IBOutlet weak var loginUnderlineView: UIView!
    @IBOutlet weak var passwordUnderlineView: UIView!
    @IBOutlet weak var confirmationUnderlineView: UIView!

    @IBOutlet weak var registrationView: UIView!
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
    @IBOutlet weak var passwordConfirmationTextField: UITextField! {
        didSet {
            let attributes = [
                NSAttributedString.Key.font: FontFamily.SFUIDisplay.light.font(size: 11)
            ]

            passwordConfirmationTextField.attributedPlaceholder = NSAttributedString(string: Strings.Auth.Password.Confirmation.placeholder, attributes: attributes)
        }
    }

    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.text = Strings.Auth.Registration.title
        }
    }
    @IBOutlet weak var registerButton: UIButton! {
        didSet {
            registerButton.setTitle(Strings.Auth.Registration.Button.title, for: .normal)
        }
    }
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    @IBOutlet weak var registrationToHeader: NSLayoutConstraint!
    @IBOutlet weak var registerButtonTop: NSLayoutConstraint!

    var viewModel: RegistrationViewModelProtocol?

    var keyboardHeight: CGFloat = 0
    var difference: CGFloat = 0
    var contentOffset: CGFloat = 0

    var keyboardIsShown = false

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar.delegate = self
        setTextFieldPaddings()
        self.view.backgroundColor = Assets.Colors.fitnecsBaseColor.color

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)

        viewModel?.updateState = { [weak self] state in
            DispatchQueue.main.async {
                switch state {
                case .normal:
                    self?.activityIndicator.stopAnimating()
                case .loading:
                    self?.activityIndicator.startAnimating()
                case .error(let viewData):
                    self?.activityIndicator.stopAnimating()
                }
            }
        }

        viewModel?.updateScreen = { [weak self] viewData in
            self?.setLoginState(isValid: viewData.isEmailValid)
            self?.setPasswordState(isValid: viewData.isPasswordValid && viewData.arePasswordsEqual)
            self?.setPasswordConfirmationState(isValid: viewData.isPasswordConfirmationValid && viewData.arePasswordsEqual)
        }

        viewModel?.start()
    }

    override func viewDidLayoutSubviews() {
        registrationToHeader.constant = view.bounds.height / 12
        registerButtonTop.constant = view.bounds.height / 12
    }


    // MARK: Actions
    @IBAction func registrationDidTap(_ sender: Any) {
        let data = RegisterViewData(name: "test", email: loginTextField.text ?? "", password: passwordTextField.text ?? "", passwordConfirmation: passwordConfirmationTextField.text ?? "")
        viewModel?.registration(from: self, data: data )
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

        contentOffset = self.scrollView.contentOffset.y
        let buttonY = registerButton.convert(registerButton.bounds, to: self.view).maxY
        let buttonToBottom = view.bounds.height - buttonY
        difference = keyboardHeight - buttonToBottom
        if difference > 0 {
            self.scrollView.contentOffset.y += difference
        }


    }

    @objc func keyboardWillHide(sender: NSNotification) {
        self.keyboardIsShown = false
        self.scrollView.contentOffset.y = contentOffset
    }


    // MARK: Private

    private func setLoginState(isValid: Bool) {
        loginUnderlineView.backgroundColor = isValid ? Assets.Colors.underlineColor.color : .red
    }

    private func setPasswordState(isValid: Bool) {
        passwordUnderlineView.backgroundColor = isValid ? Assets.Colors.underlineColor.color : .red
    }

    private func setPasswordConfirmationState(isValid: Bool) {
        confirmationUnderlineView.backgroundColor = isValid ? Assets.Colors.underlineColor.color : .red
    }

    private func  setTextFieldPaddings() {
        let loginPaddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 20))
        loginTextField.leftView = loginPaddingView
        loginTextField.leftViewMode = .always
        let passwordPaddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 20))
        passwordTextField.leftView = passwordPaddingView
        passwordTextField.leftViewMode = .always
        let passwordConfirmPaddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 20))
        passwordConfirmationTextField.leftView = passwordConfirmPaddingView
        passwordConfirmationTextField.leftViewMode = .always
    }

}


extension RegistrationViewController: NavigationBarDelegate {
    func backDidTap() {
        viewModel?.back(from: self)
    }

}
