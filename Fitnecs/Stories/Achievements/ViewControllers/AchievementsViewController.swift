//
//  AchievementsViewController.swift
//  Fitnecs
//
//  Created by Panov Sergey on 20.10.2020.
//

import UIKit


// MARK: - AchievementsViewController

class AchievementsViewController: UIViewController {

    @IBOutlet weak var allAcheveLabel: UILabel! {
        didSet {
            allAcheveLabel.text = Strings.Achievements.All.Achieve.label
        }
    }
    @IBOutlet weak var achieveLabel: UILabel! {
        didSet {
            achieveLabel.text = Strings.Achievements.Achieve.label
        }
    }
    @IBOutlet weak var overallLabel: UILabel! {
        didSet {
            overallLabel.text = Strings.Achievements.Overall.label
        }
    }
    @IBOutlet weak var forLabel: UILabel! {
        didSet {
            forLabel.text = Strings.Achievements.For.label
        }
    }
    @IBOutlet weak var descriptionLabel: UILabel!

    @IBOutlet weak var daysLabel: UILabel!

    @IBOutlet weak var cardsScrollView: UIScrollView!

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionLayout: UICollectionViewFlowLayout! {
        didSet {
            //collectionLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }
    @IBOutlet weak var collectionHeight: NSLayoutConstraint!

    private struct Const {
        static let padding: CGFloat = 20
        static let cardWidth: CGFloat = 148
        static let cardHeight: CGFloat = 245
        static let endPadding: CGFloat = 30
    }


    // MARK: Properties

    var viewModel: AchievementsViewModelProtocol?


    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel?.updateScreen = { [weak self] data in

            guard let self = self else {
                return
            }

            self.daysLabel.text = data.days

            let attributedString = NSMutableAttributedString(string: data.achievmentDescription ?? "")
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 4
            paragraphStyle.alignment = .center
            attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedString.length))

            self.descriptionLabel.attributedText = attributedString

            guard let cards = data.cards else {
                return
            }

            let cardsWidth = Const.cardWidth * CGFloat(cards.count)
            let scrollWidth = Const.padding + Const.padding * CGFloat(cards.count - 1) + cardsWidth + Const.endPadding

            self.cardsScrollView.contentSize = CGSize(width: scrollWidth, height: Const.cardHeight)
            self.cardsScrollView.layoutIfNeeded()

            for i in 0..<cards.count {
                let cardView: AchievementsCard = .fromNib()
                cardView.bind(viewData: cards[i])
                let offsetX = Const.padding + Const.cardWidth * CGFloat(i) + Const.padding * CGFloat(i)
                cardView.frame = CGRect(x: offsetX, y: 0, width: Const.cardWidth, height: Const.cardHeight)
                //print(cardView.frame)
                self.cardsScrollView.addSubview(cardView)
            }

        }

        viewModel?.updateAwards = { [weak self] in
            self?.collectionView.reloadData()
        }

        viewModel?.start()
    }

    override func viewDidLayoutSubviews() {
        view.layoutIfNeeded()
        let height = collectionView.collectionViewLayout.collectionViewContentSize.height
        collectionHeight.constant = height + 40
    }

}

extension AchievementsViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {


        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return viewModel?.awards.count ?? 0
        }


        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let award = viewModel?.awards[indexPath.row] else {
                return UICollectionViewCell()
            }
            let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: AwardCollectionViewCell.self)
            cell.configure(with: award)

            return cell
        }


        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            print("You selected cell #\(indexPath.item)!")
        }



    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let noOfCellsInRow = 3

        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout

        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))

        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))

        return CGSize(width: size, height: Int(Double(size) * 1.5))
    }

}
