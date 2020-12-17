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

    // MARK: Properties

    var viewModel: ProfileViewModelProtocol?

    var imageMultiplier: CGFloat = 0


    // MARK: Lifecycle


    override func viewDidLoad() {
        super.viewDidLoad()
        userImageView.makeRounded()
        imageMultiplier = imageWidth.multiplier

        //self.scrollView.inset

        viewModel?.updateScreen = { [weak self] data in

        }

        viewModel?.start()
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
        scrollView.backgroundColor = scrollView.contentOffset.y < 0 ? Assets.Colors.Style.background.color : .white
        if scrollView.contentOffset.y < 0 {
            let newConstraint = imageWidth.constraintWithMultiplier(imageMultiplier * (1 + abs(scrollView.contentOffset.y) / 300))
            view.removeConstraint(imageWidth)
            view.addConstraint(newConstraint)
            view.layoutIfNeeded()
            imageWidth = newConstraint
            userImageView.makeRounded()
        }
    }


}
