//
//  NavigationBar.swift
//  Fitnecs
//
//  Created by Panov Sergey on 10.12.2020.
//  Copyright © 2020 Sergey Panov. All rights reserved.
//

import UIKit

protocol NavigationBarDelegate: class {
    func backDidTap()
}

class NavigationBar: UIView {

    @IBOutlet private var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!

    weak var delegate: NavigationBarDelegate?

    // MARK: Initializers
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        Bundle.main.loadNibNamed("\(NavigationBar.self)", owner: self, options: nil)
        addSubview(contentView)

        contentView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }


    // MARK: Layout

    override public class var requiresConstraintBasedLayout: Bool {
        return true
    }

    func bind(title: String) {
        titleLabel.text = title
    }

    @IBAction func backDidTap(_ sender: Any) {
        delegate?.backDidTap()
    }
}
