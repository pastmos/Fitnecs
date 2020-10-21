//
//  ProfileViewController.swift
//  Fitnecs
//
//  Created by Panov Sergey on 20.10.2020.
//

import UIKit


// MARK: - ActivityViewController

class ProfileViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var imageWidth: NSLayoutConstraint!

    // MARK: Properties

    var viewModel: ProfileViewModelProtocol?


    // MARK: Lifecycle

    override func viewWillAppear(_ animated: Bool) {
        viewModel?.start()

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        userImageView.makeRounded()

        viewModel?.updateScreen = { [weak self] data in

        }


        viewModel?.start()
    }

    override func viewDidAppear(_ animated: Bool) {
        contentSize = scrollView.contentSize.height
    }


    var contentSize : CGFloat = 0
}

extension ProfileViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.backgroundColor = scrollView.contentOffset.y < 0 ? Assets.Colors.Style.background.color : .white
//        if scrollView.contentOffset.y < 0 {
//            let newConstraint = imageWidth.constraintWithMultiplier(imageWidth.multiplier * (1 + -scrollView.contentOffset.y / 1600))
//            view.removeConstraint(imageWidth)
//            view.addConstraint(newConstraint)
//            view.layoutIfNeeded()
//            imageWidth = newConstraint
//            userImageView.makeRounded()
//        }
    }


}


//extension NSLayoutConstraint {
//    func constraintWithMultiplier(_ multiplier: CGFloat) -> NSLayoutConstraint {
//        return NSLayoutConstraint(item: self.firstItem!, attribute: self.firstAttribute, relatedBy: self.relation, toItem: self.secondItem, attribute: self.secondAttribute, multiplier: multiplier, constant: self.constant)
//    }
//}
