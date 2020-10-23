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
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var registerView: UIView!
    @IBOutlet weak var headerView: UIView!


    var viewModel: LoginViewModelProtocol?

    var keyboardHeight: CGFloat = 0
    var difference: CGFloat = 0
    var contentOffset: CGFloat = 0

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

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
        viewModel?.openMainInterface()
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


}
