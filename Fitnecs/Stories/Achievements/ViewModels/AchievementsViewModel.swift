//
//  AchievementsViewModel.swift
//  Fitnecs
//
//  Created by Panov Sergey on 20.10.2020.
//

import UIKit

protocol AchievementsViewModelCoordinatorDelegate: AnyObject {
    func close(from controller: UIViewController)
}

protocol AchievementsViewModelProtocol: AnyObject {

    // MARK: Delegates

    var coordinatorDelegate: AchievementsViewModelCoordinatorDelegate? { get set }


    // MARK: Data Sources
    var awards: [AwardModel] { get }


    // MARK: Callbacks

    var updateState: ((AchievementsState) -> Void)? { get set }
    var updateScreen: ((AchievementsViewData) -> Void)? { get set }
    var updateAwards: (() -> Void)? { get set }


    // MARK: Events

    func start()
    func back(from controller: UIViewController)

}

enum AchievementsState {
    case normal
    case loading
    case error(viewData: ErrorViewDataType)
}

class AchievementsViewModel: AchievementsViewModelProtocol {

    // MARK: Delegates
    weak var coordinatorDelegate: AchievementsViewModelCoordinatorDelegate?

    // MARK: Variables
    var awards: [AwardModel] = [] {
        didSet {
            updateAwards?()
        }
    }

    var cards: [AchievementCard] = []

    // MARK: Callbacks

    var updateState: ((AchievementsState) -> Void)?
    var updateScreen: ((AchievementsViewData) -> Void)?
    var updateAwards: (() -> Void)?


    // MARK: Functions

    func start() {


        //Network request to be done later
        awards = [
            AwardModel(isActivated: true, text: "10 000 шагов за день"),
            AwardModel(isActivated: false, text: "30 000 шагов за день"),
            AwardModel(isActivated: false, text: "50 000 шагов за день"),
            AwardModel(isActivated: true, text: "10 000 шагов 5 дней подряд"),
            AwardModel(isActivated: true, text: "2000 ккал сожжено за день"),
            AwardModel(isActivated: false, text: "3 000 шагов за 1 час")
        ]

        cards = [
            AchievementCard(title: "Улитка месяца", description: "Вы были самый медленный среди 150 000 человек", image: UIImage(named:"snail-card")),
            AchievementCard(title: "Царь зверей", description: "Двигаетесь только когда это нужно вам. Не надо так)", image: UIImage(named:"lion-card")),
            AchievementCard(title: "Любитель слоняться", description: "Медленно но уверено преодолеваете огромные расстояния", image: UIImage(named:"elephant-card")),
        ]


        let data = AchievementsViewData(days: "356" + Strings.Achievements.Days.label, achievmentDescription: "Нерегулярное преодолевание коротких расстояний с высокой скоростью", cards: cards)


        updateScreen?(data)

    }


    func back(from controller: UIViewController) {
        coordinatorDelegate?.close(from: controller)
    }

}
