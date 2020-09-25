//
//  LoginViewController.swift
//  VTBMobile
//
//  Created by Alexandr Gabrusevich on 11/20/19.
//  Copyright © 2019 Evgeniy Mikholap. All rights reserved.
//

import UIKit
import SwiftMessages

class LoginViewController: BaseViewController {

    // MARK: Properties


    var viewModel: LoginViewModelProtocol?


    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

       

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
    

    // MARK: Private


}
