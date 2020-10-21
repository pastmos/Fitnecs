//
//  AchievementsViewController.swift
//  Fitnecs
//
//  Created by Panov Sergey on 20.10.2020.
//

import UIKit


// MARK: - ActivityViewController

class AchievementsViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    // MARK: Properties

    var viewModel: AchievementsViewModelProtocol?


    // MARK: Lifecycle

    override func viewWillAppear(_ animated: Bool) {
        viewModel?.start()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel?.updateScreen = { [weak self] data in

        }


        //viewModel?.start()
    }


}

extension AchievementsViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout,  UICollectionViewDataSource {


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

        return CGSize(width: size, height: size)
    }

}
