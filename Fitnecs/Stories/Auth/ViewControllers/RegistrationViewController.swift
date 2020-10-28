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
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var passwordTextField: UITextField! {
        didSet {
            passwordTextField.placeholder = Strings.Auth.Password.placeholder
        }
    }
    @IBOutlet weak var loginTextField: UITextField! {
        didSet {
            loginTextField.placeholder = Strings.Auth.Login.placeholder
        }
    }
    @IBOutlet weak var passwordConfirmationTextField: UITextField! {
        didSet {
            passwordConfirmationTextField.placeholder = Strings.Auth.Password.Confirmation.placeholder
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


    var viewModel: RegistrationViewModelProtocol?

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
                    self?.activityIndicator.stopAnimating()
                case .loading:
                    self?.activityIndicator.startAnimating()
                case .error(let viewData):
                  return
                }
            }
        }

        viewModel?.updateScreen = { [weak self] viewData in
            self?.setLoginState(isValid: viewData.isEmailValid)
            self?.setPasswordState(isValid: viewData.isPasswordValid  && viewData.arePasswordsEqual)
            self?.setPasswordConfirmationState(isValid: viewData.isPasswordConfirmationValid && viewData.arePasswordsEqual)
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
    @IBAction func registrationDidTap(_ sender: Any) {
        let data = RegisterViewData(name: "test", email: loginTextField.text ?? "", password:  passwordTextField.text ?? "", passwordConfirmation: passwordConfirmationTextField.text ?? "")
        viewModel?.registration(from: self, data: data )
    }

    @IBAction func viewDidTap(_ sender: Any) {
        view.endEditing(true)
    }

    @objc func keyboardWillShow(sender: NSNotification) {
        if let keyboardSize = (sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                keyboardHeight = keyboardSize.height
            }
        contentOffset = self.scrollView.contentOffset.y
        difference = keyboardHeight - (view.bounds.height - (headerView.bounds.height) + self.scrollView.contentOffset.y)
        if difference > 0 {
            self.scrollView.contentOffset.y += difference
        }


    }

    @objc func keyboardWillHide(sender: NSNotification) {
        self.scrollView.contentOffset.y = contentOffset
    }

    @IBAction func backDidTap(_ sender: Any) {
        viewModel?.back(from: self)
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

    private func setPasswordConfirmationState(isValid: Bool) {
        passwordConfirmationTextField.layer.borderWidth = isValid ?  0 : 1
        passwordConfirmationTextField.layer.borderColor = UIColor.red.cgColor
    }

    private func  setTextFieldPaddings() {
        let loginPaddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 7, height: 20))
        loginTextField.leftView = loginPaddingView
        loginTextField.leftViewMode = .always
        let passwordPaddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 7, height: 20))
        passwordTextField.leftView = passwordPaddingView
        passwordTextField.leftViewMode = .always
        let passwordConfirmPaddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 7, height: 20))
        passwordConfirmationTextField.leftView = passwordConfirmPaddingView
        passwordConfirmationTextField.leftViewMode = .always
    }

}
