//
//  ProfileViewController.swift
//  Fitnecs
//
//  Created by Panov Sergey on 20.10.2020.
//

import UIKit


// MARK: - ActivityViewController

class ProfileViewController: UIViewController {

    //@IBOutlet weak var scrollView: UIScrollView!

    @IBOutlet weak var scrollView: ExpandableContentSizeScrollView!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var imageWidth: NSLayoutConstraint!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var spendLabel: UILabel! {
        didSet {
            spendLabel.text = Strings.Profile.Spend.label
        }
    }
    @IBOutlet weak var editView: UIView!
    // MARK: Properties
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var editCenterYConstraint: NSLayoutConstraint!
    @IBOutlet weak var editCenterXConstraint: NSLayoutConstraint!

    var viewModel: ProfileViewModelProtocol?

    var imageMultiplier: CGFloat = 0


    // MARK: Lifecycle


    override func viewDidLoad() {
        super.viewDidLoad()
        imageMultiplier = imageWidth.multiplier
        topConstraint.constant = UIApplication.hasTopNotch ? 70 : 40

        activityIndicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }

        viewModel?.updateScreen = { [weak self] data in
            self?.nameLabel.text = data.name
            self?.emailLabel.text = data.email
            self?.userImageView.image = UIImage(named: data.userImage)
            self?.pointsLabel.text = data.points
        }

        viewModel?.updateState = { [weak self] state in
            switch state {
            case .normal:
                self?.activityIndicator.stopAnimating()
            case .loading:
                self?.activityIndicator.startAnimating()
            case .error(viewData: let viewData):
                self?.activityIndicator.stopAnimating()
            }
        }

        viewModel?.start()
    }

    override func viewWillAppear(_ animated: Bool) {
        view.layoutIfNeeded()
        userImageView.makeRounded()
        editView.makeCircle()
    }

    @IBAction func backDidTap(_ sender: Any) {
        viewModel?.back(from: self)
    }

    @IBAction func exitDidTap(_ sender: Any) {
        viewModel?.logout()
    }

    @IBAction func settingsDidTap(_ sender: Any) {
        viewModel?.settings()
    }
}


extension ProfileViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.backgroundColor = scrollView.contentOffset.y < 0 ? .white : .white
        if scrollView.contentOffset.y < 0 {
            editCenterYConstraint.constant = -scrollView.contentOffset.y * 0.12
            editCenterXConstraint.constant = -scrollView.contentOffset.y * 0.12
            let newConstraint = imageWidth.constraintWithMultiplier(imageMultiplier * (1 + abs(scrollView.contentOffset.y) / 300))
            view.removeConstraint(imageWidth)
            view.addConstraint(newConstraint)
            view.layoutIfNeeded()
            imageWidth = newConstraint
            userImageView.makeRounded()
        }
    }


}
